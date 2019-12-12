package com.nf.dao;

import com.nf.entity.CategoryEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryDao {
	List<CategoryEntity> getPageHelper(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

	boolean cateInsert(CategoryEntity cateEntity);

	boolean cateDelete(Integer id);

	boolean cateUpdate(CategoryEntity cateEntity);

	List<CategoryEntity> getAll();

	List<CategoryEntity> searchName(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize, @Param("name") String name);

}
