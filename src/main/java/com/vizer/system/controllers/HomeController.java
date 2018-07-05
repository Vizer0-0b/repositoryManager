package com.vizer.system.controllers;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.vizer.repositoryManager.entities.Goods;
import com.vizer.repositoryManager.repositories.GoodsRepository;
import com.vizer.shiro.entities.UserInfo;



@RestController
public class HomeController {
	
	@Autowired
	private GoodsRepository goodsRepository;

	@RequestMapping(value= {"/*" ,"/index"})
	public ModelAndView index(HttpServletRequest request, Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("render");
		UserInfo user = (UserInfo)SecurityUtils.getSubject().getPrincipal();
		Iterable<Goods> goods = goodsRepository.findAll();
		map.put("page", "index");
	    map.put("userInfo", user);
		map.put("time",new Date().toString());
		map.put("goods", goods);
		
		return mv;
	}	
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	// 登录提交地址和applicationontext-shiro.xml配置的loginurl一致。 (配置文件方式的说法)
		@RequestMapping(value="/login",method=RequestMethod.POST)
		public ModelAndView login(HttpServletRequest request, Map<String, Object> map) throws Exception {
			System.out.println("HomeController.login()");
			// 登录失败从request中获取shiro处理的异常信息。
			// shiroLoginFailure:就是shiro异常类的全类名.
			String exception = (String) request.getAttribute("shiroLoginFailure");
			ModelAndView mv = new ModelAndView("login");
			
			System.out.println("exception=" + exception);
			String msg = "";
			if (exception != null) {
				if (UnknownAccountException.class.getName().equals(exception)) {
					System.out.println("UnknownAccountException -- > 账号不存在：");
					msg = "UnknownAccountException -- > 账号不存在：";
				} else if (IncorrectCredentialsException.class.getName().equals(exception)) {
					System.out.println("IncorrectCredentialsException -- > 密码不正确：");
					msg = "IncorrectCredentialsException -- > 密码不正确：";
				} else if ("kaptchaValidateFailed".equals(exception)) {
					System.out.println("kaptchaValidateFailed -- > 验证码错误");
					msg = "kaptchaValidateFailed -- > 验证码错误";
				} else {
					msg = "else >> "+exception;
					System.out.println("else -- >" + exception);
				}
			}else {
				ModelAndView index_page = new ModelAndView("render");
					UserInfo user = (UserInfo)SecurityUtils.getSubject().getPrincipal();
					Iterable<Goods> goods = goodsRepository.findAll();
					map.put("page", "index");
					map.put("userInfo", user);
					map.put("time",new Date().toString());
					map.put("goods", goods);
				return index_page;
			}
			map.put("msg", msg);
			// 此方法不处理登录成功,由shiro进行处理.
			return mv;
		}
}