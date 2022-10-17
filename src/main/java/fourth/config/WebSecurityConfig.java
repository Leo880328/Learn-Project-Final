package fourth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import fourth.security.oauth.CustomOAuth2UserService;
import fourth.service.AuthUserDetailsService;

//import fourth.service.AuthUserDetailsService;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService auDetailService;
	
	@Autowired
	private CustomOAuth2UserService oAuth2UserService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		System.out.println("進入WebSecurity");
		auth.userDetailsService(auDetailService).passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		 http.exceptionHandling().accessDeniedPage("/404NotFound");
		
		 http.logout().logoutUrl("/logout").
         logoutSuccessUrl("/logout.controller").permitAll();
		
		
		 http	
		 		.authorizeRequests()
		 		.antMatchers("/oauth2/**").permitAll()
		 		.and()
				.formLogin() // 自定义自己编写的登录页面
				.loginPage("/login.controller")// 登录页面设置
				.loginProcessingUrl("/loginsuccess") // 登录访问路径
				.defaultSuccessUrl("/checklogin.controller",true).permitAll() // 登录成功之后，跳转路径
				.failureUrl("/logfail")
				.and()
				.authorizeRequests().antMatchers("/","/assets/**","/assets/**","/assets1/**","/backend/**","/backend2/**","/css/**","/fonts/**","/images/**","/js/**","/wayne/**","/xiang/**"
						,"/coursefront1.list","/coursefront.details","/ActivityResources/**","/Activity/**"
						,"/register.controller","/newRegister","/forgetPassword.controller","/forgotpassword","/becometeacher")
				.permitAll() // 设置哪些路径可以直接访问，不需要认证
				// 当前登录用户，只有具有admins权限才可以访问这个路径
				// 1 hasAuthority方法
				.antMatchers("/backendIndex/**").hasAuthority("3")
				// 2 hasAnyAuthority方法
				// .antMatchers("/test/index").hasAnyAuthority("admins,manager")
				// 3 hasRole方法 ROLE_sale
//				.antMatchers("/wayne/**").hasRole("sale")
				.anyRequest().authenticated()
				.and()
				.oauth2Login()
				.loginPage("/login.controller")
				.userInfoEndpoint().userService(oAuth2UserService)
				.and()
//				.and().rememberMe().tokenRepository(persistentTokenRepository())
//				.tokenValiditySeconds(60)// 设置有效时长，单位秒
//				.userDetailsService(userDetailsService);
		// .and().csrf().csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());
				.and().csrf().disable(); //关闭csrf防护

	}

}
