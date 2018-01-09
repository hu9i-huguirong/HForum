package com.example.hforum.service.impl;

import com.example.hforum.model.User;
import com.example.hforum.service.UserService;
import com.example.hforum.utils.IDUtil;
import com.example.hforum.utils.PageBean;
import com.example.hforum.utils.ResponseDataFactory;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext-dao.xml"})
public class UserServiceImplTest {
@Autowired
private UserService userService;
    @Before
    public void setUp() throws Exception {

    }

    @Test
    public void add() {
      for (int i = 3;i < 103;i++){
          ByteSource bytes = ByteSource.Util.bytes(""+i);
          SimpleHash simpleHash = new SimpleHash("MD5", "123456", bytes, 1024);
          User  user =new User();
          user.setUserName("用户12345"+i);

          Long  phone = Long.parseLong("139"+  IDUtil.createNumber(10000000,99999999));
          user.setCellPhoneNumber(phone);
          user.setEmail(i+"234432@qq.com");
          user.setPassword(simpleHash.toString());
          user.setRegisterTime(new Date());
          user.setUserHead("00DED8F46AF44C72A399812EC6E2AD9A");
          user.setUserStatus(1l);
          userService.add(user);
        }
        System.out.println("OK");
    }
    @Test
    public void list() {
        User user  =new User();
        user.setUserName("测");
        PageBean pageBean = ResponseDataFactory.createPageBean(1, 3,true);
        List<User> list = userService.list(user, pageBean);
        Map<String, Object> stringObjectMap = ResponseDataFactory.buildResponseDataMap(pageBean, list);
        System.out.println(stringObjectMap.get("count"));
    }
}