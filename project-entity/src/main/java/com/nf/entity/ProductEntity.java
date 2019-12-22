package com.nf.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author lzb
 * 商品表
 */
@Data
public class ProductEntity {
	private Integer id;
	private Integer categoryId;
	//'分类id,对应small_category表的主键',

	private String productName;
	// '商品名称',

	private String subtitle;
	//'商品副标题',

	private String mainImage;
	// '产品主图,url相对地址',

	private String subImages;
	//'图片地址,json格式,扩展用',

	private String detail;
	//'商品详情',

	private Integer ptype;
	//'商品类型.1-普通商品2-二手商品',

	private BigDecimal price;
	//'价格,单位-元保留两位小数',

	private Integer stock;
	// '库存数量',

	private Integer pstatus;
	//'商品状态.1-在售 2-下架 3-删除',

	private Date createTime;
	//'创建时间',

	private Date updateTime;
	//'更新时间',

}
