package com.nf.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author lzb
 * 订单表
 */
@Data
public class OrderEntity {
	private Integer oid;

	private String orderNo;
//	订单编号

	private String receiverName;
//	收货人姓名

	private String receiverProvince;
	//省份

	private String receiverCity;
	//城市
	private String receiverDistrict;

	private Integer userId;
//	用户id

	private Integer shippingId;
//	收货人id

	private BigDecimal payment;
//	实际支付金额

	private Integer paymentType;
//	支付类型: 1在线支付

	private BigDecimal postage;
//	运费

	private Integer orderStatus;
//	订单状态: 0 已取消 10未付款 20已付款 40已发货 50交易成功 60交易成功

	private Date paymentTime;
//	支付时间

	private Date sendTime;
//	发货时间

	private Date endTime;
//	交易完成时间

	private Date closeTime;
//	交易关闭时间

	private Date createTime;
//	订单创建时间

	private Date updateTime;
//	订单修改时间
}
