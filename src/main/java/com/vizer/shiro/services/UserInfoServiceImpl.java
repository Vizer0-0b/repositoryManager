package com.vizer.shiro.services;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vizer.shiro.entities.UserInfo;
import com.vizer.shiro.repositories.UserInfoRepository;



@Service
public class UserInfoServiceImpl implements UserInfoService{
	
	@Resource
	private UserInfoRepository userInfoRepository;
	
	@Override
	public UserInfo findByUsername(String username) {
		System.out.println("UserInfoServiceImpl.findByUsername()");
		return userInfoRepository.findByUsername(username);
	}
	
}
