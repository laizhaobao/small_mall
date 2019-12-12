package com.nf.controller.user;

import com.github.pagehelper.PageInfo;
import com.nf.entity.UserEntity;
import com.nf.service.UserService;
import com.nf.vo.ResponseVO;
import com.nf.vo.UserEntityVO;
import com.sun.org.glassfish.gmbal.ParameterNames;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

/**
 * @author lzb
 * 用户管理模块的控制器
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	//主界面
	@RequestMapping("/index")
	public String index() {
		return "/be/user/index";
	}

	//查询所有用户
	@RequestMapping("/list")
	@ResponseBody
	public ResponseVO list(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum) {
		PageInfo pageInfo = new PageInfo(userService.getPageHelper(pageNum, 3), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}

	//条件查询用户

	@RequestMapping("/search")
	@ResponseBody
	public ResponseVO search(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum, String username) {
		PageInfo pageInfo = new PageInfo(userService.searchName(pageNum, 3, username), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}


//	添加操作

	@RequestMapping("/insert")
	@ResponseBody
	public ResponseVO insert(@Valid UserEntityVO userEntityVO, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return ResponseVO.newBuilder().code("500").message("添加失败!").build();
		}
		UserEntity userEntity = new UserEntity();
		BeanUtils.copyProperties(userEntityVO, userEntity);
		System.out.println(userEntity);
		userService.userInsert(userEntity);
		return ResponseVO.newBuilder().code("200").message("添加成功!").build();
	}

	//	修改操作

	@RequestMapping("/update")
	@ResponseBody
	public ResponseVO update(@Valid UserEntityVO userEntityVO, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return ResponseVO.newBuilder().code("500").message("修改失败!").build();
		}
		UserEntity userEntity = new UserEntity();
		BeanUtils.copyProperties(userEntityVO, userEntity);
		System.out.println(userEntity);
		userService.userUpdate(userEntity);
		return ResponseVO.newBuilder().code("200").message("修改成功!").build();
	}

	//	删除操作
	@RequestMapping("/delete")
	@ResponseBody
	public ResponseVO delete(String id) {
			Integer userId = Integer.parseInt(id);
			userService.userDelete(userId);
		return ResponseVO.newBuilder().code("200").message("删除成功!").build();
	}
}
