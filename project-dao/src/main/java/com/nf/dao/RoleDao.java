package com.nf.dao;

import com.nf.entity.MenuEntity;
import com.nf.entity.RoleEntity;

import java.util.List;

/**
 * @author lzb
 * 角色表
 */
public interface RoleDao {
	boolean addRole(RoleEntity role);

	RoleEntity findRole(String id);

	List<RoleEntity> getAll();

	List<MenuEntity> getMenusByRoleId(String roleId);
}
