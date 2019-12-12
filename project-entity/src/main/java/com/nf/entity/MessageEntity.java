package com.nf.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author lzb
 *
 */
@Data
public class MessageEntity {
	private Integer id;
	private Integer userId;
	private String content;
	private Date createTime;
	private Date updateTime;
}
