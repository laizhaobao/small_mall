package com.nf.service.impl;

import com.nf.dao.ProductDao;
import com.nf.entity.ProductEntity;
import com.nf.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;

	@Override
	public List<ProductEntity> getPageHelper(int pageNum, int pageSize) {
		return productDao.getPageHelper(pageNum, pageSize);
	}

	@Override
	public boolean proInsert(ProductEntity proEntity) {

		return productDao.proInsert(proEntity);
	}

	@Override
	public boolean proDelete(Integer id) {
		return productDao.proDelete(id);
	}

	@Override
	public boolean proUpdate(ProductEntity proEntity) {
		return productDao.proUpdate(proEntity);
	}

	@Override
	public List<ProductEntity> searchName(int pageNum, int pageSize, String name) {
		return productDao.searchName(pageNum,pageSize,name);
	}
}
