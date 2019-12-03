package com.nf.controller;


import com.github.pagehelper.PageInfo;
import com.nf.vo.ResponseVO;
import com.nf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * @author lzb
 */
@Controller
@RequestMapping("/fe")
public class IndexController {
	@Autowired
	private UserService userService;
/*主界面*/

	@RequestMapping("/index")
	public String index() {
		return "fe/index";
	}

	@RequestMapping("/list")
	@ResponseBody
	public ResponseVO list(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum) {
		PageInfo pageInfo = new PageInfo(userService.getPageHelper(pageNum, 3),5);
		System.out.println(userService.getPageHelper(pageNum, 3).get(0).getCreateTime());
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}


/*	登陆*/

	@RequestMapping("/loginView")
	public String login(){
		return "fe/loginView";
	}
	@RequestMapping("/login")
	public String login(String username, String pwd, HttpServletRequest request){
		if("admin".equalsIgnoreCase(username)&&"123456".equalsIgnoreCase(pwd)){
			HttpSession session = request.getSession();
			session.setAttribute("username",username);
			System.out.println("登陆成功...");
		}
		return "redirect:index";
	}


}
