package com.nf.controller;


import com.nf.entity.UserEntity;
import com.nf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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

	@Autowired
	private UserService userService;

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
		UserEntity userEntity = new UserEntity();
		userEntity.setUsername(username);
		UserEntity u2= userService.getByName(userEntity);
		if(u2!=null){
			if(u2.getPwd().equalsIgnoreCase(pwd)){
				HttpSession session = request.getSession();
				session.setAttribute("user",u2);
				System.out.println("登陆成功...");
			}
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
