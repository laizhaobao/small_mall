package com.nf.controller.user;

import com.nf.entity.RoleEntity;
import com.nf.service.RoleService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class RoleController {
	@Autowired
	private RoleService roleService;

	@RequestMapping("/user/role")
	public String index() {
		return "/be/user/roles";
	}

	@RequestMapping("/user/query")
	@ResponseBody
	public ResponseVO roleQuery() {
			List<RoleEntity> list = roleService.getAll();
		return ResponseVO.newBuilder().code("200").data(list).build();
	}
}
