package com.example.hforum.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	/**
	 * 将字符串格式化成java.util.Date
	 * 
	 * @param date
	 * @param patterm
	 * @return
	 */
	public static Date parse(String date, String pattern) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			Date d = sdf.parse(date);
			return d;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 将java.util.Date格式化成字符串
	 *
	 * @param date
	 * @param patterm
	 * @return
	 */
	public static String format(Date date, String pattern) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			String f = sdf.format(date);
			return f;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public static void main(String[] args) {
		System.out.println(format(new Date(),"yyyyMMdd"));
	}
}
