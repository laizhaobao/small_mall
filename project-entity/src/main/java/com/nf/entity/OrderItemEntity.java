package com.nf.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class OrderItemEntity {
	private Integer oiId;
	private Integer userId;
	private String orderNo;
	private Integer productId;
	private String productName;
	private String productImage;
	private BigDecimal currentUnitPrice;
	private Integer quantity;
	private BigDecimal totalPrice;
	private Date createTime;
	private Date updateTime;
	public  String getImageUrl(){
		return "/product/download?filename=" + this.getProductImage();
	}
}
