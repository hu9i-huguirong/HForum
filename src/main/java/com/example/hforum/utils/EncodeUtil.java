package com.example.hforum.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class EncodeUtil {
	//加密名称
	private final static String ALGORITHMNAME  ="MD5";
	//迭代次数
	private final static  int HASHITERATIONS   =1024;
	public static String toChinese(String get) {
		try {
			byte[] b = get.getBytes("ISO-8859-1");// 解码
			get = new String(b, "UTF-8");// 转码
			return get;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}


	public static String hashEcode(String source,String credentialsSalt) {
		SimpleHash simpleHash = new SimpleHash(ALGORITHMNAME, source, ByteSource.Util.bytes(credentialsSalt), HASHITERATIONS);
		return  simpleHash.toString();
	}

	public static void main(String[] args) {
		System.out.println(hashEcode("123456", 205+""));
	}
}
