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

import mountain.MountainLoginCheck;

@SessionAttributes(names = "Member")
public class CheckLoginFilter implements Filter{
//	int counter = 0;
	
	private static List<String> passUrls = new ArrayList<>();
	
	private static String beforeCheckURL;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//保存攔截的url
//		passUrls.add("/member/memberBackLoginEntry");
//		passUrls.add("/member/memberBackLogin");
		MountainLoginCheck.setPassUrls(passUrls);
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//		System.out.println("Login Check count : " + (++counter));
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		//得到當前路徑
		req.getRequestURI().substring(req.getContextPath().length());
//		System.out.println("requestURI : " + req.getRequestURI());
		int length = req.getContextPath().length();
		String requestURI = req.getRequestURI().substring(length);
		//檢查是否需要登入檢查
		if ( CheckLogin(requestURI) ) {
			
			//否，繼續
//			System.out.println("this url don't need to be check");
			chain.doFilter(request, response);
			return;
		}
		
		//是，前往檢查
//		System.out.println("this url need to be check");
		HttpSession session = req.getSession();
		if (session.getAttribute("beforeCheckURL") != null) {
//			System.out.println("beforeCheckURL : " +session.getAttribute("beforeCheckURL"));
			session.removeAttribute("beforeCheckURL");
		}
		//檢查是否以登入
		if (session.getAttribute("Member")==null) {
			//尚未登入，導向登入頁
//			System.out.println("not login yet, redirect to loginPage" );
			beforeCheckURL = req.getRequestURI().substring(req.getContextPath().length());
			session.setAttribute("beforeCheckURL", beforeCheckURL);
			resp.sendRedirect(req.getContextPath()+"/member/memberLoginEntry");
			return;
		}else {
			//已登入，繼續
//			System.out.println("login cofirm");
			chain.doFilter(request, response);
			if (session.getAttribute("beforeCheckURL") != null) {
//				System.out.println("beforeCheckURL : " +session.getAttribute("beforeCheckURL"));
				session.removeAttribute("beforeCheckURL");
			}
//			System.out.println("=========================");
//			System.out.println("after login confirm");
			return;
		}
		
	}

	private boolean CheckLogin(String requestURI) {
		
		if(passUrls.contains(requestURI)) {
			return false;
		}
		for (String string : passUrls) {
			if (requestURI.indexOf(string) > -1) {
				return false;
			}
		}
		return true;
	}

}
