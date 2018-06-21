package com.vizer.shiro.services;

import com.vizer.shiro.entities.UserInfo;

public interface UserInfoService {
	
	/**通过username查找用户信息;*/
	public UserInfo findByUsername(String username);
	
}
