package com.vizer.system.utils;

import java.io.Serializable;

public class HttpResult implements Serializable{

	/**
	 * RESTful result
	 */
	private static final long serialVersionUID = 1L;
	
	public Integer code;
	public String data;
	public String msg;
	
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
