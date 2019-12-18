package com.nf.dao;

import com.nf.entity.OrderEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
	List<OrderEntity> getPageHelper(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
	List<OrderEntity> searchName(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize,@Param("orderNo") String orderNo);
	OrderEntity getByOrderNo(String orderNo);
	boolean updateStatus(String orderNo);
}
