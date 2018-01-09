package com.example.hforum.utils;

import java.util.Random;
import java.util.UUID;

/**
 * 生成指定区间的随机数
 */
public class IDUtil {
	public static int createNumber(int min,int max) {
		Random random = new Random();
		int no = random.nextInt(max) % (max - min + 1) + min;
		return no;
	}
	/**
	 * 获取UUID
	 */
	public static String createUUID() {
		String s = UUID.randomUUID().toString();
		s = s.replace("-", "");
		return s.toUpperCase();
	}
}
