package com.nf.service;

import com.nf.entity.OrderItemEntity;

import java.util.List;

public interface OrderItemService {
	List<OrderItemEntity> getByOrderNo(String orderNo);
}
