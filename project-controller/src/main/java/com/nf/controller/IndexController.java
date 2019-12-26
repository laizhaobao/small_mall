package com.nf.controller;


import com.google.code.kaptcha.Producer;
import com.nf.entity.UserEntity;
import com.nf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;


/**
 * @author lzb
 */
@Controller
@RequestMapping("/be")
public class IndexController {

	@Autowired
	private UserService userService;
	@Autowired
	private Producer captchaProducer;

/*主界面*/
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/be/index");
		return modelAndView;
	}

/*	登陆界面*/

	@RequestMapping("/loginView")
	public String login(){
		return "/be/loginView";
	}

//	登录校验

	@RequestMapping("/login")
	public String login(String username, String pwd,String verificationCode, HttpServletRequest request){
		String a = "/be/loginView";
		HttpSession session = request.getSession();
//		获取插件生成的验证文字
		String captcha = (String) session.getAttribute("captcha");
		System.out.println(captcha);
		if(verificationCode!=null && verificationCode.equalsIgnoreCase(captcha)){
			UserEntity userEntity = new UserEntity();
			userEntity.setUsername(username);
			UserEntity u2= userService.getByName(userEntity);
			if(u2!=null){
				if(u2.getPwd().equalsIgnoreCase(pwd)){
					session.setAttribute("user",u2);
					System.out.println("登陆成功...");
					return "/be/index";
				}
			}
		}
		return a;
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

	/**
	 * 生成图片验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/defaultKaptcha")
	public void getCaptchar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//设置内容类型
		response.setContentType("image/jpeg");
		//创建验证码文本
		String capText = captchaProducer.createText();
		//将验证码文本设置到session中
		request.getSession().setAttribute("captcha",capText);
		//创建验证码图片
		BufferedImage bi = captchaProducer.createImage(capText);

		ServletOutputStream outputStream = response.getOutputStream();
		//将图片验证码数据写到响应输出流
		ImageIO.write(bi,"jpg",outputStream);
		try {
			outputStream.flush();
		}finally {
			outputStream.close();
		}
	}

}
