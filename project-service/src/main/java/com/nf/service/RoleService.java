package com.nf.service;

import com.nf.entity.MenuEntity;
import com.nf.entity.RoleEntity;

import java.util.List;

public interface RoleService {
	boolean addRole(RoleEntity role);

	RoleEntity findRole(String id);

	List<RoleEntity> getAll();

	List<MenuEntity> getMenusByRoleId(String roleId);
}
