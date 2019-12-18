package com.nf.entity;

import lombok.Data;

/**
 * @author lzb
 * 收货地址信息表
 */
@Data
public class ShippingEntity {
	private Integer shippingId;
	private Integer userId;
	//用户id

	private String receiverName;
	//收货人姓名

	private String receiverPhone;
	//固定电话

	private String receiverMobile;
	//移动电话

	private String receiverProvince;
	//省份

	private String receiverCity;
	//城市
	private String receiverDistrict;
	/*区/县*/

	private String receiverAddress;
	//详细地址

	private String receiverZip;
	//邮编


}
