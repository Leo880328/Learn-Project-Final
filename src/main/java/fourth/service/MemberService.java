package fourth.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fourth.bean.MemberBean;
import fourth.dao.MemberRepository;
//import fourth.exception.UserNotFoundException;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	
	//註冊驗證
//	public MemberBean checkRegister(String account, String password, String email) {
//		return memberRepository.checkRegister(account, password, email);
//	}
	public MemberBean checkRegister(String email) {
		return memberRepository.findByEmail(email);
	}

	// 會員註冊
	public MemberBean registerUser(MemberBean newRegister) {
		return memberRepository.save(newRegister);

	}

	// 會員登入
	public MemberBean checkLogin(String account) {
		return memberRepository.findByAccount(account);
	}

	// 新增會員
	public MemberBean insertUser(MemberBean memberBean) {
		return memberRepository.save(memberBean);
	}

	// 查詢所有會員
	public List<MemberBean> selectAllMembers() {
		return memberRepository.findAll();
	}

	// 刪除會員
	public void deleteUser(int userId) {
		memberRepository.deleteById(userId);
	}

	// 會員更新前找到帳號
	public MemberBean selectUserById(int userId) {
		Optional<MemberBean> optional = memberRepository.findById(userId);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	// 會員更新
	public MemberBean updateUser(MemberBean memberBean) {
		return memberRepository.save(memberBean);
	}

	// 會員查詢(帳號)Service
	public List<MemberBean> QueryUserByAccount(String account) {
		return memberRepository.findByAccountLike(account);
	}

}
