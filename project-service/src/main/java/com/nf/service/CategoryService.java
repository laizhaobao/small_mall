package com.nf.service;

import com.nf.entity.CategoryEntity;

import java.util.List;

public interface CategoryService {
	List<CategoryEntity> getPageHelper( int pageNum, int pageSize);
	boolean cateInsert(CategoryEntity cateEntity);

	boolean cateDelete(Integer id);

	boolean cateUpdate(CategoryEntity cateEntity);

	List<CategoryEntity> getAll();
	List<CategoryEntity> searchName(int pageNum,int pageSize,String name);
}
