package fourth.security.oauth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import fourth.service.MemberService;

@Component
public class GoogleLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private MemberService memberServicel;
	
	
	public GoogleLoginSuccessHandler() {
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
			System.out.println("進入google登入");
			HttpSession session = request.getSession();
			Object oauthUser = (CustomOAuth2User)authentication.getPrincipal();
			
		
		
		
	}

}
