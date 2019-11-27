package com.nf.service.impl;

import com.nf.dao.UserDao;
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
}
