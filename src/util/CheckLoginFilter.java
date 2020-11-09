package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes(names = "LoginOK")
public class CheckLoginFilter implements Filter{
	int counter = 0;
	
	private static List<String> passUrls = new ArrayList<>();
	
	private static String beforeCheckURL;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//保存不攔截的url
		passUrls.add("/member/memberBackLoginEntry");
		passUrls.add("/member/memberBackLogin");
		
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Login Check count : " + (++counter));
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		//得到當前路徑
		req.getRequestURI().substring(req.getContextPath().length());
		System.out.println("requestURI : " + req.getRequestURI());
		if (passUrls.contains(req.getRequestURI().substring(req.getContextPath().length()))) {
			System.out.println("before check");
			chain.doFilter(request, response);
			return;
		}
		
		HttpSession session = req.getSession();
		String account = (String) session.getAttribute("LoginOK");
		if (account==null) {
			System.out.println("after check go to loginPage " );
			beforeCheckURL = req.getRequestURI().substring(req.getContextPath().length());
			session.setAttribute("beforeCheckURL", beforeCheckURL);
			resp.sendRedirect(req.getContextPath()+"/member/memberBackLoginEntry");
			return;
		}else {
			System.out.println("check Success");
			chain.doFilter(request, response);
			return;
		}
		
	}

}
