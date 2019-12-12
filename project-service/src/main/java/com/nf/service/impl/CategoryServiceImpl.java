package com.nf.service.impl;

import com.nf.dao.CategoryDao;
import com.nf.entity.CategoryEntity;
import com.nf.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<CategoryEntity> getPageHelper(int pageNum, int pageSize) {
		return categoryDao.getPageHelper(pageNum,pageSize);
	}

	@Override
	public boolean cateInsert(CategoryEntity cateEntity) {
		return categoryDao.cateInsert(cateEntity);
	}

	@Override
	public boolean cateDelete(Integer id) {
		return categoryDao.cateDelete(id);
	}

	@Override
	public boolean cateUpdate(CategoryEntity cateEntity) {
		return categoryDao.cateUpdate(cateEntity);
	}

	@Override
	public List<CategoryEntity> getAll() {
		return categoryDao.getAll();
	}

	@Override
	public List<CategoryEntity> searchName(int pageNum, int pageSize, String name) {
		return categoryDao.searchName(pageNum,pageSize,name);
	}
}
