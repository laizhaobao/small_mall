package com.nf.service.impl;

import com.nf.dao.OrderItemDao;
import com.nf.entity.OrderItemEntity;
import com.nf.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {
	@Autowired
	private OrderItemDao orderItemDao;

	@Override
	public List<OrderItemEntity> getByOrderNo(String orderNo) {
		return orderItemDao.getByOrderNo(orderNo);
	}
}
