package fourth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import fourth.bean.MemberBean;
import fourth.service.MemberService;

@Controller
@SessionAttributes(names = { "user" })
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 一般會員查詢
	@RequestMapping(path = "/user.controller", method = RequestMethod.GET)
	public String userController() {
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

	// 登入檢查    //**************************
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
		if (user != null) {
			if (user.getStatus() == 3) {

				return "redirect:/backendIndex";
			} else {
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

	// 註冊   ************************
	@RequestMapping(path = "/newRegister", method = RequestMethod.POST)
	public String newRegister(@ModelAttribute("register") MemberBean memberBean, BindingResult result, Model m,
			Object mb) {
		HashMap<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

//		String bcEncode = new BCryptPasswordEncoder().encode(memberBean.getPassword());
//		memberBean.setPassword(bcEncode);
		memberBean.setStatus(1);
//		memberBean.setImg(images/)

//		MemberBean checkRegister = memberService.checkRegister(memberBean.getAccount(), memberBean.getPassword(),
//				memberBean.getEmail());
//		MemberBean checkRegister = memberService.checkRegister(memberBean.getEmail());
//		System.out.println("checkRegister Email:" + checkRegister.getEmail());
//		System.out.println("checkRegister Account:" + checkRegister.getAccount());
//
//		if (checkRegister.getEmail() != null) {
//			errors.put("RegisterError", "<font color=red size=4 >信箱已經註冊!!</font>");
//			return "Register";
//		} else {
			memberService.registerUser(memberBean);
//			m.addAttribute("register", mb);
//		}
		return "Login";
	}
//		if (checkRegister.getAccount() != null) {
//			errors.put("RegisterError", "<font color=red size=4 >帳號已經註冊!!</font>");
//			return "Register";
//		}

	// 查詢全部
	@GetMapping("/memberList")
	public String selectAllMembers(Model m) {
		List<MemberBean> listMembers = memberService.selectAllMembers();
		m.addAttribute("listMembers", listMembers);
		return "MemberList";

	}

	// 進入新增畫面
	@GetMapping("/addNewUser")
	public String addForm() {
		return "AddNewUser";
	}

	// 新增會員
	@PostMapping("/insertNewUser")
	public String insertMember(@ModelAttribute("memberBean") MemberBean memberBean) {
		memberBean.setImg("images/" + memberBean.getImg());
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

	// 更新會員
	@PostMapping("/updateUser")
	public String updateUser(MemberBean memberBean) {
		memberService.updateUser(memberBean);
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
	@GetMapping("/deleteUser")
	public String deleteUser(int userId) {
		memberService.deleteUser(userId);
		return "redirect:/memberList";
	}

}
