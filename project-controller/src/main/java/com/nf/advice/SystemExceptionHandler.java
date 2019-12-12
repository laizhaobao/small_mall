package com.nf.advice;

import com.nf.vo.ResponseVO;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author lzb
 * 当控制器中出现运行异常这里会被处理
 */
@ControllerAdvice
public class SystemExceptionHandler {
	@ExceptionHandler(RuntimeException.class)
	@ResponseBody
	public ResponseVO handlerRuntimeException(){
		ResponseVO vo = ResponseVO.newBuilder().code("500").message("failed-----").build();
		return vo;
	}
}
