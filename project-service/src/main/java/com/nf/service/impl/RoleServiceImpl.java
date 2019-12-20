package com.nf.service.impl;

import com.nf.dao.RoleDao;
import com.nf.entity.MenuEntity;
import com.nf.entity.RoleEntity;
import com.nf.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	@Override
	public boolean addRole(RoleEntity role) {
		return roleDao.addRole(role);
	}

	@Override
	public RoleEntity findRole(String id) {
		return roleDao.findRole(id);
	}

	@Override
	public List<RoleEntity> getAll() {
		return roleDao.getAll();
	}

	@Override
	public List<MenuEntity> getMenusByRoleId(String roleId) {
		return roleDao.getMenusByRoleId(roleId);
	}
}
