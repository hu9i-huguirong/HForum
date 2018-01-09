package com.example.hforum.shiro.realms;

import com.example.hforum.model.LoginRecord;
import com.example.hforum.model.Role;
import com.example.hforum.model.User;
import com.example.hforum.service.LoginRecordService;
import com.example.hforum.service.UserService;
import com.example.hforum.utils.IPUtil;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 
 * 1. 授权需要继承 AuthorizingRealm 类, 并实现其 doGetAuthorizationInfo 方法 2.
 * AuthorizingRealm 类继承自 AuthenticatingRealm, 但没有实现 AuthenticatingRealm 中的
 * doGetAuthenticationInfo, 所以认证和授权只需要继承 AuthorizingRealm 就可以了. 同时实现他的两个抽象方法.
 *
 */
public class AdminLoginRealm extends AuthorizingRealm {
	@Autowired
	private UserService userService;
	@Autowired
	private LoginRecordService loginRecordService;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 1. 把 AuthenticationToken 转换为 UsernamePasswordToken
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		// // 2. 从 UsernamePasswordToken 中来获取 username
		String username = upToken.getUsername();

		User u = new User();
		// 3. 调用数据库的方法, 从数据库中查询 username 对应的用户记录
		if (username.indexOf("@") == -1) {
			// 手机号登录
			u.setCellPhoneNumber(Long.parseLong(username));
		} else {
			// 邮箱登录
			u.setEmail(username);
		}
		User user = userService.login(u);
		//登录后台
		user.setLoginType(2);

		// 4. 若用户不存在, 则可以抛出 UnknownAccountException 异常
		if (user == null) {
			throw new UnknownAccountException("用户不存在!");
		} else {
			// 5. 根据用户信息的情况, 决定是否需要抛出其他的 AuthenticationException 异常.
			if (user.getUserStatus() == 0) {
				throw new LockedAccountException("用户被锁定");
			}

		}
		// 6. 根据用户的情况, 来构建 AuthenticationInfo 对象并返回. 通常使用的实现类为: SimpleAuthenticationInfo
		// 以下信息是从数据库中获取的.
		// 1). principal: 认证的实体信息. 可以是 username, 也可以是数据表对应的用户的实体类对象.
		Object principal = user;
		// 2). credentials: 密码.
		// 密码的比对:
		// 通过 AuthenticatingRealm 的 credentialsMatcher 属性来进行的密码的比对!
		// 3). realmName: 当前 realm 对象的 name. 调用父类的 getName() 方法即可
		// 4). 盐值(唯一). 加盐后即使两个人的密码相同,在数据库看到的明文也是不一样的
		ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUserId() + "");
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, user.getPassword(), credentialsSalt,
				getName());
		return info;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 1. 从 PrincipalCollection 中来获取登录用户的信息
		User user = (User) principals.getPrimaryPrincipal();
		// 2. 利用登录的用户的信息来获取当前用户的角色
		Set<Role> roles = user.getSetRole();
		Set<String> roleNames = new HashSet<>();
		for (Role role : roles) {
			roleNames.add(role.getRoleType());
		}
		// 登录记录
		LoginRecord loginRecord = new LoginRecord();
		loginRecord.setLoginUserId(user.getUserId());
		loginRecord.setLoginTime(new Date());
		loginRecord.setLoginType(0l);
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		loginRecord.setLoginIp(IPUtil.getIpAddress(request));

		int i = loginRecordService.add(loginRecord);
		if (i <= 0) {
			System.out.println("插入失败");
		}

		// 3. 创建 SimpleAuthorizationInfo, 并设置其 roles 属性.
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
		// 4. 返回 SimpleAuthorizationInfo 对象.
		return info;
	}

	public static void main(String[] args) {

		SimpleHash simpleHash = new SimpleHash("MD5", "123456", ByteSource.Util.bytes("2"), 1024);
		System.out.println(simpleHash);
	}

}
