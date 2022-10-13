package fourth.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import fourth.bean.MemberBean;

//@WebFilter({ "/backendIndex" })
public class AuthMember extends HttpFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		MemberBean user = (MemberBean) httpServletRequest.getSession().getAttribute("user");
		if (user != null&& user.getStatus()==3) {
			chain.doFilter(request, response);
		} else {
			httpServletRequest.getRequestDispatcher("/Index").forward(httpServletRequest, response);
		}

	}

}
