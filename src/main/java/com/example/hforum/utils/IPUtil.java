package com.example.hforum.utils;

import javax.servlet.http.HttpServletRequest;

public class IPUtil {  
	/**
	 * 
	 * 
	 * 0:0:0:0:0:0:0:1是ipv6的表现形式，对应ipv4来说相当于127.0.0.1 ，也就是本机
	 * 
	 * 如果项目部署在本机win7系统，访问时是通过 localhost 来访问，
	 * 
	 * 用java获取ip地址可能会出现该问题，这时获取的ip将是 0:0:0:0:0:0:0:1
	 * 
	 * 要是机器在局域网中，访问时使用自己的ip访问 这时候请求会经过路由器转发，所以服务器获取的就是本机的局域网内ip
	 * 
	 * @param ip
	 * @return
	 */
	private static boolean checkIP(String ip) {
		if (ip == null || ip.length() == 0 || "unkown".equalsIgnoreCase(ip)) {
			return true;
		}
		return false;
	}

	/**
	 * 获得客户端真实IP地址的方法
	 * 如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP值，究竟哪个才是真正的用户端的真实IP呢？
	 * 答案是取X-Forwarded-For中第一个非unknown的有效IP字符串.如： X-Forwarded-For：192.168.1.110,
	 * 192.168.1.120, 192.168.1.130, 192.168.1.100 用户真实IP为： 192.168.1.110
	 * 
	 */
	//
	public static String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (checkIP(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (checkIP(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (checkIP(ip)) {
			ip = request.getRemoteAddr();
		}
		if ("0:0:0:0:0:0:0:1".equals(ip)) {
			ip = "127.0.0.1";
		}
		return ip;
	}

}
