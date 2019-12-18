package com.nf.service;

import com.nf.entity.OrderEntity;

import java.util.List;

public interface OrderService {
	List<OrderEntity> getPageHelper(int pageNum, int pageSize);
	List<OrderEntity> searchName(int pageNum, int pageSize,String orderNo);
	OrderEntity getByOrderNo(String orderNo);
	boolean updateStatus(String orderNo);
}
