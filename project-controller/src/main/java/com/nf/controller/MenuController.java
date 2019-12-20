package com.nf.controller;

import com.nf.entity.MenuEntity;
import com.nf.entity.RoleEntity;
import com.nf.service.RoleService;
import com.nf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 * @author lzb
 * 菜单栏数据
 */
@Controller
public class MenuController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping("/privileges/query")
	@ResponseBody
	protected List<MenuEntity> service(String id) {
		RoleEntity roles = userService.getUserRole(id);
		System.out.println(roles.toString());
// 	获取角色权限
		List<MenuEntity> list = roleService.getMenusByRoleId(roles.getId());
		for (MenuEntity menuEntity : list) {
			System.out.println("menuEntity = " + menuEntity);
		}
		return list;
	}
}
