package fourth.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import fourth.bean.MemberBean;
import fourth.coursemail.JavaMail;
import fourth.service.MemberMailService;
import fourth.service.MemberService;

@Controller
@SessionAttributes(names = { "user" })
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberMailService memberMailService;

	@GetMapping(path = "/forgotpassword/{mail}")
	public void forgotPWD(@PathVariable String mail) {
		MemberBean member = memberService.checkRegister(mail);
		System.out.println("member: " + mail);
		if (member != null) {
			String pwd = memberMailService.givenUsingJava8_whenGeneratingRandomAlphanumericString_thenCorrect();
			System.out.println("pwd:" + pwd);
			member.setPassword(pwd);
			MemberBean registerUser = memberService.registerUser(member);
			System.out.println("registerUser: " + registerUser);
			System.out.println("email:" + member.getEmail());
			memberMailService.sendMail(member.getEmail(), "[ 快樂學習(你快樂嗎?) ]忘記密碼通知信",
					"親愛的會員您好:<br><br>您的帳號:" + member.getAccount() + " 申請忘記密碼通知，" + "系統發送新密碼為:" + pwd + "，"
							+ "請使用新密碼登入，並至個人資料重新修改密碼。<br> <br> <br>  快樂學習團隊 敬上");

		}
	}

	// 切入忘記密碼畫面
	@RequestMapping(path = "/forgetPassword.controller", method = RequestMethod.GET)
	public String ForgetPWDController() {
		return "ForgetPassword";
	}

	// 成為老師
	@RequestMapping(path = "/becometeacher.controller", method = RequestMethod.GET)
	public String becometeacherController() {
		return "BecomeTeacher";
	}

	// 一般會員查詢
	@RequestMapping(path = "/user.controller", method = RequestMethod.GET)
	public String userController(Model m) {
		MemberBean user = (MemberBean) m.getAttribute("user");
		MemberBean mem = memberService.checkLogin(user.getAccount());
		m.addAttribute("user", mem);
		return "UserSeting";
	}

	// 登入
	@RequestMapping(path = "/login.controller", method = RequestMethod.GET)
	public String loginController() {
		return "Login";
	}

	// 登出
	@RequestMapping(path = "/logout.controller", method = RequestMethod.GET)
	public String logoutController(Model m, SessionStatus status) {
		m.addAttribute("user", null);
		status.setComplete();
		return "Login";
	}

	// 登入檢查 //**************************
	@RequestMapping(path = "/checklogin.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam("account") String account, @RequestParam("password") String password,
			Model m, SessionStatus status) {
		Map<String, String> errors = new HashMap<String, String>();

		m.addAttribute("errors", errors);
		if (account == null || account.length() == 0) {
		}
		if (password == null || password.length() == 0) {
		}
		if (errors != null && !errors.isEmpty()) {
			return "Login";
		}
		MemberBean user = memberService.checkLogin(account);
		System.out.println("執行user");
		System.out.println(user);
		m.addAttribute("user", user);
		if (user != null && user.getPassword().equals(password)) {
			if (user.getStatus() == 3) {

				return "redirect:/backendIndex";
			} else if(user.getStatus()==5){
				errors.put("msg", "<font color=red size=6 >帳號有問題!!</font>");
				return "Login";
			}else {
				return "redirect:/Index";
			}

		} else {
			errors.put("msg", "<font color=red size=6 >帳號或密碼有誤!!</font>");
			return "Login";
		}

	}

	// 切入註冊畫面
	@RequestMapping(path = "/register.controller", method = RequestMethod.GET)
	public String registerController() {
		return "Register";
	}

	// 註冊 ************************
	@RequestMapping(path = "/newRegister", method = RequestMethod.POST)
	@ResponseBody
	public String newRegister(@RequestBody MemberBean memberBean, BindingResult result, Model m, Object mb) {
		System.out.println("進入註冊controller");
		HashMap<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		String timeStamp = new SimpleDateFormat("yyyy/MM/dd").format(Calendar.getInstance().getTime());
//		String bcEncode = new BCryptPasswordEncoder().encode(memberBean.getPassword());
//		System.out.println("bcEncode :" +bcEncode);
//		memberBean.setPassword(bcEncode);
		memberBean.setStatus(1);
		memberBean.setImg("images/user000.png");
		memberBean.setJoinDate(timeStamp);

		MemberBean checkRegisterByEmail = memberService.checkRegister(memberBean.getEmail());
		MemberBean checkRegisterByAccount = memberService.checkLogin(memberBean.getAccount());
		System.out.println(checkRegisterByAccount);
		System.out.println(checkRegisterByEmail);
		return "信箱已經註冊";
//		System.out.println("進入完service");

//		if (checkRegisterByEmail != null) {
//			if (checkRegisterByEmail.getEmail() != null) {
//				errors.put("RegisterError", "<font color=red size=4 >信箱已經註冊!!</font>");
//				return "信箱已經註冊 幹你娘";
//			}
//		}
//		if (checkRegisterByAccount != null) {
//			if (checkRegisterByAccount.getAccount() != null) {
//				errors.put("RegisterErrorAccount", "<font color=red size=4 >帳號已經註冊!!</font>");
//				return "帳號已經註冊 幹你娘";
//			}
//		}

//		memberService.registerUser(memberBean);
//		m.addAttribute("register", mb);
//
//		return "註冊成功";
	}

	// 查詢全部
	@GetMapping("/memberList")
	public String selectAllMembers(Model m) {
		List<MemberBean> listMembers = memberService.selectAllMembers();
		m.addAttribute("listMembers", listMembers);
		return "MemberList";

	}

	// 查詢待審核會員
	@GetMapping("/checkteacherlist")
	public String selectCheckTeacher(Model m) {
		List<MemberBean> listCheck = memberService.selectAllCheck("%" + "4" + "%");
		System.out.println(listCheck);
		m.addAttribute("listCheck", listCheck);
		return "CheckTeacherList";

	}

	// 進入新增畫面
	@GetMapping("/addNewUser")
	public String addForm() {
		return "AddNewUser";
	}

	// 新增會員
	@PostMapping("/insertNewUser")
	public String insertMember(@ModelAttribute("memberBean") MemberBean memberBean) {
		memberService.insertUser(memberBean);
		return "redirect:/memberList";
	}

	// 找尋更新會員
	@GetMapping("/showEditUser")
	public String showEditUser(int userId, Model m) {
		MemberBean existingUser = memberService.selectUserById(userId);
		m.addAttribute("mb", existingUser);
		return "AddNewUser";
	}

	// 審核更新會員
	@GetMapping("/checkteacher")
	public String checkTeacher(int userId, Model m) {
		MemberBean existingUser = memberService.selectUserById(userId);
		m.addAttribute("mb", existingUser);
		return "CheckBecomeTeacher";
	}

	// 提出申請成為老師
	@PostMapping("/becometeacher")
	public String becomeTeacher(MemberBean memberBean, Model m) {
		System.out.println("//////////////////////執行成為老師");
		MemberBean user = (MemberBean) m.getAttribute("user");
		MemberBean mem = memberService.checkLogin(user.getAccount());
		System.out.println("mem: " + mem);
		mem.setStatus(4);
		m.addAttribute("user", mem);
		memberService.updateUser(memberBean);
		System.out.println("memberBean: " + memberBean);
		return "redirect:/user.controller";
	}

	// 更新會員
	@PostMapping("/updateUser")
	public String updateUser(MemberBean memberBean, MultipartFile mf, String account, int status)
			throws IllegalStateException, IOException {
		MemberBean member = memberService.checkLogin(account);
		if (status == 1) {
			memberService.updateUser(memberBean);
			return "redirect:/memberList";
		}
		if (status == 2) {
			memberService.updateUser(memberBean);
			String txt = "<h2>" + "偉大的 " + memberBean.getNick() + " 您好 :" + "<br>" + "審核結果: 通過!! 恭喜你成為老師" + "<br>"
					+ "<h2>";
			JavaMail javaMail = new JavaMail();
//			javaMail.setCustomer("fock360man@gmail.com");
			javaMail.setCustomer("ch570981400@gmail.com");
			javaMail.setSubject("好學生-EEIT49 身分審核通過!");
			javaMail.setTxt(txt);
			javaMail.sendMail();
		}
		return "redirect:/memberList";
	}

	// 尋找帳號
	@PostMapping("/queryAccount")
	public String queryAccount(@RequestParam("keyword_account") String account, Model m) {
		HashMap<String, String> errorMsgMap = new HashMap<String, String>();
		m.addAttribute("errorMsgMap", errorMsgMap);
		List<MemberBean> list = memberService.QueryUserByAccount(account);
		System.out.println("queryList:" + list);
		if (list.isEmpty()) {
			errorMsgMap.put("QueryError", "<font color=red size=5>查無此帳號!!</font>");
			return selectAllMembers(m);
		} else {
			m.addAttribute("queryResult", list);
			return "QueryMemberByAccount";
		}

	}

	// 刪除會員
	@GetMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable("id") int userId) {
		memberService.deleteUser(userId);
		return "redirect:/memberList";
	}

	// 使用者自己更新資料
	@PostMapping("/updateMyUser")
	public String updateMyUser(MemberBean memberBean) {
		memberService.updateUser(memberBean);
		return "redirect:/user.controller";
	}

}
