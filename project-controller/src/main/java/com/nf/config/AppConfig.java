package com.nf.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageInterceptor;

import org.apache.ibatis.logging.stdout.StdOutImpl;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;

import javax.servlet.Filter;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

/**
 * @author lzb
 * Configuration:声明该类是一个配置文件类
 * ComponentScan:扫描当前包下的注解,进行spring管理
 * MapperScan:扫描当前包下的Mapper,目的是获得dao的实现类
 * PropertySource:资源来源
 * EnableTransactionManagement:配置事务,然后在需要添加事务的地方添加@Transactional注解即可
 * EnableWebMvc(WebMvcConfigurer): 开启MVC配置,实现这个类,可以进行mvc的一些配置
 */
@Configuration
@ComponentScan({"com.nf.service.impl", "com.nf.controller", "com.nf.advice"})//, "com.nf.interceptory"拦截器先不急
@MapperScan("com.nf.dao")
@PropertySource("classpath:db.properties")
@EnableTransactionManagement
@MvcConfigAnnotation
@EnableWebMvc
public class AppConfig {
	@Value("${jdbc.url}")
	private String URL;
	@Value("${jdbc.username}")
	private String USERNAME;
	@Value("${jdbc.password}")
	private String PWD;

	@Bean
	public DataSource dataSource() {
		DruidDataSource druidDataSource = new DruidDataSource();
		druidDataSource.setUrl(URL);
		druidDataSource.setUsername(USERNAME);
		druidDataSource.setPassword(PWD);
		return druidDataSource;
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
		sessionFactoryBean.setDataSource(dataSource());
//		配置资源匹配解析器
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		Resource[] resources = resolver.getResources("classpath:mappers/*Mapper.xml");
//     	将Mapper进行注入
		sessionFactoryBean.setMapperLocations(resources);
		sessionFactoryBean.setPlugins(pageInterceptor());
		sessionFactoryBean.setConfiguration(getConfiguration());
		return sessionFactoryBean.getObject();
	}

//	// 配置日志
	private org.apache.ibatis.session.Configuration getConfiguration() {
		org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
		configuration.setLogImpl(StdOutImpl.class);
		configuration.setMapUnderscoreToCamelCase(true);
		return configuration;
	}

	//	配置分页
	private PageInterceptor pageInterceptor() {
		PageInterceptor pageInterceptor = new PageInterceptor();
		Properties properties = new Properties();
		properties.put("supportMethodsArguments", "true");
		properties.put("reasonable", "true");
		pageInterceptor.setProperties(properties);
		return pageInterceptor;
	}

	//	配置事务管理器
	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager();
		transactionManager.setDataSource(dataSource());
		return transactionManager;
	}

}
