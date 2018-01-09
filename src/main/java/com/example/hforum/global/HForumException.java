package com.example.hforum.global;

public class HForumException extends Exception {

	private static final long serialVersionUID = -1383134987162495589L;

	// 异常信息
	private String message;

	public HForumException(String message) {
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}
	

}
