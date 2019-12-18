package com.nf.dao;

import com.nf.entity.OrderItemEntity;

import java.util.List;

public interface OrderItemDao {
	List<OrderItemEntity> getByOrderNo(String orderNo);
}
