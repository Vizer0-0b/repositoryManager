package com.vizer.shiro.controllers;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {
	
	/**
	 * 用户查询.
	 * @return
	 */
	@RequestMapping("/userList")
	public String userInfo(){
		return "shiro/userInfo";
	}
	
	/**
	 * 用户添加;
	 * @return
	 */
	@RequestMapping("/userAdd")
	@RequiresPermissions("userInfo:add")//权限管理;
	public String userInfoAdd(){
		return "shiro/userInfoAdd";
	}
	
	/**
	 * 用户删除;
	 * @return
	 */
	@RequestMapping("/userDel")
	@RequiresPermissions("userInfo:del")//权限管理;
	public String userDel(){
		return "shiro/userInfoDel";
	}
	
}