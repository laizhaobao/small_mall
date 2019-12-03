package com.nf.entity;

import lombok.Data;

/**
 * @author lzb
 * 收货地址信息表
 */
@Data
public class ShippingEntity {
	private Integer id;
	private Integer user_id;
	//用户id

	private String receiver_name;
	//收货人姓名

	private String receiver_phone;
	//固定电话

	private String receiver_mobile;
	//移动电话

	private String receiver_province;
	//省份

	private String receiver_city;
	//城市
	private String receiver_district;
	/*区/县*/

	private String receiver_address;
	//详细地址

	private String receiver_zip;
	//邮编


}
