package com.nf.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nf.interceptory.LoginInterceptor;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @author lzb
 * Mvc配置
 */
public class MvcConfig implements WebMvcConfigurer {

	//	配置视图资源解析器
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");

	}

	//	配置时间格式转换器 这个是在数据绑定的时候将字符串转换为日期格式

	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addFormatter(new DateFormatter("yyyy-MM-dd"));
	}

	//配置信息转换器,这个是在响应回去的时候进行转换,重写这个方法会覆盖默认的

/*	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {

	}*/

	@Override
	public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setDateFormat(sdf);
		MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter(objectMapper);
//		converters.add(converter);
		converters.add(0,converter);
	}

	//配置拦截器
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration registration = registry.addInterceptor(new LoginInterceptor());
		registration.addPathPatterns("/**");
		List<String> excludeUrl = new ArrayList<>();
		excludeUrl.add("/be/loginView");
		excludeUrl.add("/be/login");
		excludeUrl.add("/be/exit");
		registration.excludePathPatterns(excludeUrl);
	}

	//配置静态资源解析器
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		相当于xml中配置mapping
		ResourceHandlerRegistration registration = registry.addResourceHandler("/static/**");
//      相当于xml中配置location
		registration.addResourceLocations("classpath:/static/");
	}
}
