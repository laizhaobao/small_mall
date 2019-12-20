package com.nf.dao;

import com.nf.entity.RoleEntity;
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

	List<UserEntity> searchName(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize, @Param("name") String name);

//根据用户id获取角色信息

	RoleEntity getRoles(String userId);

	//	删除该用户的某个角色解除权限

	void deleteRolesByUserId(String userId);

//	添加该用户某个权限

	void insertUserRole(@Param("userId") String userId, @Param("roleId") String roleId);
}
