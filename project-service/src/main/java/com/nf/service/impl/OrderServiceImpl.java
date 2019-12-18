package com.nf.service.impl;

import com.nf.dao.OrderDao;
import com.nf.entity.OrderEntity;
import com.nf.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @author admin
 */
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;
	@Override
	public List<OrderEntity> getPageHelper(int pageNum, int pageSize) {
		return orderDao.getPageHelper(pageNum,pageSize);
	}

	@Override
	public List<OrderEntity> searchName(int pageNum, int pageSize, String orderNo) {
		return orderDao.searchName(pageNum,pageSize,orderNo);
	}

	@Override
	public OrderEntity getByOrderNo(String orderNo) {
		return orderDao.getByOrderNo(orderNo);
	}

	@Override
	public boolean updateStatus(String orderNo) {
		return orderDao.updateStatus(orderNo);
	}
}
