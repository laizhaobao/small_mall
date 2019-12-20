package com.nf.service;

import com.nf.entity.MenuEntity;

import java.util.List;

public interface MenuService {
	MenuEntity findMenuById(String id);

	List<MenuEntity> getAllMenus();
}
