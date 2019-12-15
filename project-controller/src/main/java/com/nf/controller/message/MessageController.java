package com.nf.controller.message;

import com.github.pagehelper.PageInfo;
import com.nf.service.MessageService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService messageService;

	//主界面
	@RequestMapping("/index")
	public String index() {
		return "/be/message/index";
	}

	//查询所有类型
	@RequestMapping("/list")
	@ResponseBody
	public ResponseVO list(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum) {
		PageInfo pageInfo = new PageInfo(messageService.getPageHelper(pageNum, 3), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}


	//条件查询类型

	@RequestMapping("/search")
	@ResponseBody
	public ResponseVO search(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum, String name) {
		PageInfo pageInfo = new PageInfo(messageService.searchName(pageNum, 3, name), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}

	//	删除
	@RequestMapping("/delete")
	@ResponseBody
	public ResponseVO delete(String id) {
		Integer mesId = Integer.parseInt(id);
		messageService.mesDelete(mesId);
		return ResponseVO.newBuilder().code("200").message("删除成功!").build();
	}

}
