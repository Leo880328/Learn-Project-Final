//package fourth.service;
//
//import java.util.Collections;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import fourth.bean.MemberBean;
//
//@Service
//public class AuthUserDetailsService implements UserDetailsService {
//	
//	@Autowired
//	private MemberService memberService;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		MemberBean user = memberService.findByAccountLogin(username);
//		System.out.println("進入 AuthUserDetailsService");
//		System.out.println("uProfiles: " +user);
//		return new User(user.getAccount(),user.getPassword(),Collections.emptyList());
//	}
//
//}
