package com.nf.controller.user;

import com.nf.entity.MenuEntity;
import com.nf.entity.RoleEntity;
import com.nf.service.MenuService;
import com.nf.service.PrivilegeService;
import com.nf.service.RoleService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RoleController {
//	角色

	@Autowired
	private RoleService roleService;

//	角色权限

	@Autowired
	private PrivilegeService privilegeService;

//	菜单

	@Autowired
	private MenuService menuService;

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

	// 查询角色权限

	@RequestMapping("/role/privilege/list")
	@ResponseBody
	protected List<Map<String, Object>> service(String roleId) {

		List<Map<String, Object>> jsonArray = new ArrayList<Map<String, Object>>();
		List<MenuEntity> list = menuService.getAllMenus();
		List<MenuEntity> rolePrivilege = roleService.getMenusByRoleId(roleId);
		for (MenuEntity p : list) {
			Map<String, Object> jsonObject = new HashMap<String, Object>();
			jsonObject.put("id", p.getId());
			jsonObject.put("pId", p.getPid());
			jsonObject.put("name", p.getName());
			jsonObject.put("open", "true");
			for (MenuEntity r : rolePrivilege) {
				if (p.getId().equals(r.getId())) {
					jsonObject.put("checked", "true");
				}
			}
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}

//	权限赋予
@RequestMapping("/user/role-privilege/insert")
@ResponseBody
protected Object service(String[] privilege_id,String role_id) {
	RoleEntity role = roleService.findRole(role_id);
	List<MenuEntity> list = new ArrayList<MenuEntity>();
	for(String pid:privilege_id) {
		MenuEntity privilege = menuService.findMenuById(pid);
		list.add(privilege);
	}
	privilegeService.updateRolePrivilege(role,list);
	return true;

}
}
