package com.nf.controller;


import com.github.pagehelper.PageInfo;
import com.nf.vo.ResponseVO;
import com.nf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * @author lzb
 */
@Controller
public class IndexController {
	@Autowired
	private UserService userService;

	@RequestMapping("/index")
	public String index() {
		return "index";
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
}
