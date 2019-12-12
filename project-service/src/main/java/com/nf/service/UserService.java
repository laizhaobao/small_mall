package com.nf.service;

import com.nf.entity.UserEntity;

import java.util.List;

/**
 * @author lzb
 *
 */
public interface UserService {
	List<UserEntity> getPageHelper(int pageNum,int pageSize);
	UserEntity getByName(UserEntity userEntity);
	boolean userInsert(UserEntity userEntity);
	boolean userDelete(Integer id);
	boolean userUpdate(UserEntity userEntity);
	List<UserEntity> searchName(int pageNum,int pageSize,String name);
}
