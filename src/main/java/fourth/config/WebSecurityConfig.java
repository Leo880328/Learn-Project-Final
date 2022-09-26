package fourth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

//import fourth.service.AuthUserDetailsService;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
//	private AuthUserDetailsService auDetailService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		System.out.println("進入WebSecurity");
//		auth.userDetailsService(auDetailService).passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		 http.cors().and().csrf().disable();

	}

}
