package com.nf.dao;

import com.nf.entity.MenuEntity;

import java.util.List;

/**
 * @author lzb
 * 菜单
 */
public interface MenuDao {
	MenuEntity findMenuById(String id);

	List<MenuEntity> getAllMenus();
}
