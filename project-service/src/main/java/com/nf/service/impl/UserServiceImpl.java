package com.nf.service.impl;

import com.nf.dao.UserDao;
import com.nf.entity.RoleEntity;
import com.nf.entity.UserEntity;
import com.nf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lzb
 * 业务类
 */
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public List<UserEntity> getPageHelper(int pageNum, int pageSize) {
		return userDao.getPageHelper(pageNum,pageSize);
	}

	@Override
	public UserEntity getByName(UserEntity userEntity) {
		return userDao.getByName(userEntity);
	}

	@Override
	public boolean userInsert(UserEntity userEntity) {
		return userDao.userInsert(userEntity);
	}

	@Override
	public boolean userDelete(Integer id) {
		return userDao.userDelete(id);
	}

	@Override
	public boolean userUpdate(UserEntity userEntity) {
		return userDao.userUpdate(userEntity);
	}

	@Override
	public List<UserEntity> searchName(int pageNum, int pageSize,String name) {
		return userDao.searchName(pageNum,pageSize,name);
	}

	@Override
	public RoleEntity getRoles(String userId) {
		return userDao.getRoles(userId);
	}

	@Override
	public void deleteRolesByUserId(String userId) {
		userDao.deleteRolesByUserId(userId);
	}

	@Override
	public void insertUserRole(String userId, String roleId) {
		userDao.insertUserRole(userId,roleId);
	}

	@Override
	public RoleEntity getUserRole(String id) {
		return userDao.getRoles(id);
	}
}
