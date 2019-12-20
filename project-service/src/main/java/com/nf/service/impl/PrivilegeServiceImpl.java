package com.nf.service.impl;

import com.nf.dao.PrivilegeDao;
import com.nf.entity.MenuEntity;
import com.nf.service.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PrivilegeServiceImpl implements PrivilegeService {
	@Autowired
	private PrivilegeDao privilegeDao;

	@Override
	public void deleteRolePrivilege(String roleId) {
		privilegeDao.deleteRolePrivilege(roleId);
	}

	@Override
	public void insertRolePrivilege(String roleId, List<MenuEntity> privileges) {
		privilegeDao.insertRolePrivilege(roleId,privileges);
	}
}
