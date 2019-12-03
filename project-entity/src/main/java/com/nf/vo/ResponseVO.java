package com.nf.vo;


import lombok.Builder;
import lombok.Data;

/**
 * @author lzb
 */
@Data
public class ResponseVO {
	private String code;
//	显示代码

	private String message;
//	显示信息

	private Object data;
	//	数据

	private ResponseVO(Builder builder) {
		setCode(builder.code);
		setMessage(builder.message);
		setData(builder.data);
	}

	public static Builder newBuilder() {
		return new Builder();
	}

	public static Builder newBuilder(ResponseVO copy) {
		Builder builder = new Builder();
		builder.code = copy.getCode();
		builder.message = copy.getMessage();
		builder.data = copy.getData();
		return builder;
	}

	public static final class Builder {
		private String code;
		private String message;
		private Object data;

		private Builder() {
		}

		public Builder code(String val) {
			code = val;
			return this;
		}

		public Builder message(String val) {
			message = val;
			return this;
		}

		public Builder data(Object val) {
			data = val;
			return this;
		}

		public ResponseVO build() {
			return new ResponseVO(this);
		}
	}


}
