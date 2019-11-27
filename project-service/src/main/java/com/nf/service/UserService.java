package com.nf.service;

import com.nf.entity.UserEntity;

import java.util.List;

/**
 * @author lzb
 *
 */
public interface UserService {
	List<UserEntity> getPageHelper(int pageNum,int pageSize);
}
