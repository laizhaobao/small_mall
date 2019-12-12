package com.nf.service;

import com.nf.entity.ProductEntity;

import java.util.List;

/**
 * @author lzb
 *
 */
public interface ProductService {
	List<ProductEntity> getPageHelper(int pageNum, int pageSize);
	boolean proInsert(ProductEntity proEntity);
	boolean proDelete(Integer id);
	boolean proUpdate(ProductEntity proEntity);
	List<ProductEntity> searchName(int pageNum,int pageSize,String name);
}
