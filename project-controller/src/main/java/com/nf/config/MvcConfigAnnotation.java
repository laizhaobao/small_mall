package com.nf.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Import(MvcConfig.class)
@Configuration
@Target(ElementType.TYPE) //修饰目标
@Retention(RetentionPolicy.RUNTIME) //注流策略
public @interface MvcConfigAnnotation {
}
