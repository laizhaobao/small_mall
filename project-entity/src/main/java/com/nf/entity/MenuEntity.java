package com.nf.entity;

import lombok.Data;

@Data
public class MenuEntity {
	private String id;
	private String name;
	private String uri;
	private Boolean parent;
	private Integer pid;
}
