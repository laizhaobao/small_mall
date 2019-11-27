package com.nf.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SystemConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
	@Override
	protected Class<?>[] getRootConfigClasses() {
		//		容器启动(配置父容器的地方)
		return new Class[]{AppConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
// 配置子容器的地方
		return null;
	}

	@Override
	protected String[] getServletMappings() {
//		配置 "/" 代表所有请求都接受
		return new String[]{"/"};
	}
}
