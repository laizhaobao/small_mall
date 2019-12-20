package com.nf.service.impl;

import com.nf.dao.PrivilegeDao;
import com.nf.entity.MenuEntity;
import com.nf.entity.RoleEntity;
import com.nf.service.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		privilegeDao.insertRolePrivilege(roleId, privileges);
	}

	@Override
	@Transactional
	public void updateRolePrivilege(RoleEntity role, List<MenuEntity> privileges) {
//		根据角色id删除该角色的所有权限

		privilegeDao.deleteRolePrivilege(role.getId());

//		将用户添加的权限添加进角色权限表中

		privilegeDao.insertRolePrivilege(role.getId(), privileges);
	}

}
