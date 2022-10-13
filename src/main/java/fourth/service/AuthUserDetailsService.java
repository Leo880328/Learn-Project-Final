package fourth.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import fourth.bean.MemberBean;

@Service
public class AuthUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberBean user = memberService.checkLogin(username);
		System.out.println("進入 AuthUserDetailsService");
		System.out.println("uProfiles: " +user);
		List<GrantedAuthority> auths =
                AuthorityUtils.commaSeparatedStringToAuthorityList(String.valueOf(user.getStatus()));
		return new User(user.getAccount(), new BCryptPasswordEncoder().encode(user.getPassword()),auths);
	}
	
	
}
