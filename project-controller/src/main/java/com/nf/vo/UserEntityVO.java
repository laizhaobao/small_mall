package com.nf.vo;

import lombok.Data;

import java.util.Date;

/**
 * @author lzb
 */
@Data
public class UserEntityVO {
	private Integer uid;
	//主键

	private String username;
	//账号

	private String pwd;
	//	密码

	private String email;
	//	邮箱地址

	private String phone;
	//	手机号码

	private String question;
	//	密保问题

	private String answer;
	//	密保答案

	private Integer role;
	//	角色权限 0 --管理员 1--普通用户

	private Date createTime;
	//	创建时间

	private Date updateTime;
	//	修改时间
}
