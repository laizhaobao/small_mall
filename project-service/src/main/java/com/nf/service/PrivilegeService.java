package com.nf.service;

import com.nf.entity.MenuEntity;

import java.util.List;

public interface PrivilegeService {
	void deleteRolePrivilege(String roleId);

	void insertRolePrivilege( String roleId,List<MenuEntity> privileges);
}
