package com.nf.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author lzb
 * 商品类型表
 */
@Data
public class CategoryEntity {
	private Integer id;
//	主键

	private String name;
//	类型名称

	private Integer status;
	private Date createTime;
	private Date updateTime;
}
