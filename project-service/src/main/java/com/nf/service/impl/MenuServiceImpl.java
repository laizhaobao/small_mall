package com.nf.service.impl;

import com.nf.dao.MenuDao;
import com.nf.entity.MenuEntity;
import com.nf.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	@Override
	public MenuEntity findMenuById(String id) {
		return menuDao.findMenuById(id);
	}

	@Override
	public List<MenuEntity> getAllMenus() {
		return menuDao.getAllMenus();
	}
}
