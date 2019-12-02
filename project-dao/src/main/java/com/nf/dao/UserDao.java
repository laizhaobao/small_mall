package com.nf.dao;

import com.nf.entity.UserEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author lzb
 */
public interface UserDao {
	List<UserEntity> getPageHelper(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
	UserEntity getByName(UserEntity userEntity);
	boolean userInsert(UserEntity userEntity);
	boolean userDelete(Integer id);
	boolean userUpdate(UserEntity userEntity);
}
