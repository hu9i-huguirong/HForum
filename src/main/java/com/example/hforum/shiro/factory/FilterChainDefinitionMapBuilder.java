package com.example.hforum.shiro.factory;

import java.util.LinkedHashMap;

/**
 * 工厂类,只实例化一次
 */
public class FilterChainDefinitionMapBuilder {
    /**
     * 配置哪些页面需要受保护. 以及访问这些页面需要的权限. 1). anon 可以被匿名访问 2). authc 必须认证(即登录)后才可能访问的页面.
     * 3). logout 登出. 4). roles 角色过滤器 配置顺序：前面的优先匹配,会覆盖后面的
     */
    public LinkedHashMap<String, String> buildFilterChainDefinitionMap() {
        LinkedHashMap<String, String> map = new LinkedHashMap<>();
        map.put("/back/login", "anon");
        map.put("/back/manage/news/channel", "roles[admin]");
        map.put("/back/**", "kickout,authc,roles[manage]");
        map.put("/u/**", "authc");
        //剩下的都是可以匿名访问的
        map.put("/**", "anon");
        return map;
    }

}
