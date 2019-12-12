package com.nf.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * @author lzb
 */
@Controller
@RequestMapping("/be")
public class IndexController {

/*主界面*/
	@RequestMapping("/index")
	public String index() {
		return "/be/index";
	}

/*	登陆*/

	@RequestMapping("/loginView")
	public String login(){
		return "/be/loginView";
	}
	@RequestMapping("/login")
	public String login(String username, String pwd, HttpServletRequest request){
		if("admin".equalsIgnoreCase(username)&&"123456".equalsIgnoreCase(pwd)){
			HttpSession session = request.getSession();
			session.setAttribute("username",username);
			System.out.println("登陆成功...");
		}
		return "/be/index";
	}
/*退出登录*/

	@RequestMapping("/exit")
	public void exitLogin(HttpServletRequest request){
		HttpSession session = request.getSession();
		System.out.println("退出登录...");
//		强制会话销毁
		session.invalidate();
	}

//错误页面404地址

	@RequestMapping("/error")
	public String error(){
		return "error";
	}
}
