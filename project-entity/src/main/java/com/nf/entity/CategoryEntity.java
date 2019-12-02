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
	private Integer parentId;
	private String name;
	private Integer status;
	private Date createTime;
	private Date updateTime;
}
