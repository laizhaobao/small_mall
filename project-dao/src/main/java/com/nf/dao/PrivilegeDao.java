package com.nf.dao;

import com.nf.entity.MenuEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author lzb
 *权限表
 */
public interface PrivilegeDao {
	void deleteRolePrivilege(String roleId);

	void insertRolePrivilege(@Param("roleId") String roleId, @Param("privileges") List<MenuEntity> privileges);
}
