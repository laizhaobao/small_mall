package com.nf.controller.category;

import com.github.pagehelper.PageInfo;
import com.nf.entity.CategoryEntity;
import com.nf.entity.UserEntity;
import com.nf.service.CategoryService;
import com.nf.service.UserService;
import com.nf.vo.CategoryEntityVO;
import com.nf.vo.ResponseVO;
import com.nf.vo.UserEntityVO;
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
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	//主界面
	@RequestMapping("/index")
	public String index() {
		return "/be/category/index";
	}

	//查询所有类型
	@RequestMapping("/list")
	@ResponseBody
	public ResponseVO list(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum) {
		PageInfo pageInfo = new PageInfo(categoryService.getPageHelper(pageNum, 3), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}

	//条件查询类型

	@RequestMapping("/search")
	@ResponseBody
	public ResponseVO search(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum, String name) {
		PageInfo pageInfo = new PageInfo(categoryService.searchName(pageNum, 3, name), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}


//	添加操作

	@RequestMapping("/insert")
	@ResponseBody
	public ResponseVO insert(@Valid CategoryEntityVO cateEntityVO, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return ResponseVO.newBuilder().code("500").message("添加失败!").build();
		}
		CategoryEntity categoryEntity = new CategoryEntity();
		BeanUtils.copyProperties(cateEntityVO, categoryEntity);
		System.out.println(categoryEntity);
		categoryService.cateInsert(categoryEntity);
		return ResponseVO.newBuilder().code("200").message("添加成功!").build();
	}

	//	修改操作

	@RequestMapping("/update")
	@ResponseBody
	public ResponseVO update(@Valid CategoryEntityVO cateEntityVO, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return ResponseVO.newBuilder().code("500").message("修改失败!").build();
		}
		CategoryEntity categoryEntity = new CategoryEntity();
		BeanUtils.copyProperties(cateEntityVO, categoryEntity);
		System.out.println(categoryEntity);
		categoryService.cateUpdate(categoryEntity);
		return ResponseVO.newBuilder().code("200").message("修改成功!").build();
	}

	//	删除操作
	@RequestMapping("/delete")
	@ResponseBody
	public ResponseVO delete(String id) {
			Integer cateId = Integer.parseInt(id);
			categoryService.cateDelete(cateId);
		return ResponseVO.newBuilder().code("200").message("删除成功!").build();
	}
}
