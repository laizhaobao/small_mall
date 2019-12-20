package com.nf.interceptory;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author lzb
 *
 */

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			System.out.println("没有登陆...被拦截了");
			response.sendRedirect("/be/loginView");
			return false;
		}
		System.out.println("拦截器正在运行中...用户在线");
		return true;
	}
}
