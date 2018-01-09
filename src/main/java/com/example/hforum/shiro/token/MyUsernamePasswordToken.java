package com.example.hforum.shiro.token;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 拓展shiro 中的UsernamePasswordToken
 * @author 胡桂榕
 *
 */
public class MyUsernamePasswordToken extends UsernamePasswordToken {
    private static final long serialVersionUID = 1L;
    private String userType ;

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public MyUsernamePasswordToken(String loginName, String password, String userType) {

        super(loginName, password);

        this.userType = userType;

    }
}
