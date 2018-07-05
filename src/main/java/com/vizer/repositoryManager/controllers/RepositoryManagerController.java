package com.vizer.repositoryManager.controllers;


import java.util.*;


import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.vizer.repositoryManager.entities.Goods;
import com.vizer.repositoryManager.repositories.GoodsRepository;
import com.vizer.shiro.entities.UserInfo;
import com.vizer.system.utils.HttpResult;

import freemarker.template.Configuration;

@RestController
@RequestMapping(path="/")
public class RepositoryManagerController {
	
	@Autowired
	Configuration configuration; //freeMarker configuration  
	
	@Autowired
	private GoodsRepository goodsRepository;
	

    // goods view use RequsetMethod.GET    
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public ModelAndView goodsList(Model model) throws Exception {
        ModelAndView mv = new ModelAndView("render");
	    Iterable<Goods> goodsList = goodsRepository.findAll();
		UserInfo user = (UserInfo)SecurityUtils.getSubject().getPrincipal();

	    model.addAttribute("page","repositoryManager/list");
	    model.addAttribute("userInfo",user);
	    model.addAttribute("time",new Date().toString());
	    model.addAttribute("goodsList", goodsList);
        return mv;
    }
    
    // goods add use RequestMethod.POST
    @RequestMapping(value="/goodsinsert", method=RequestMethod.POST)
	public HttpResult goodsAdd(@RequestParam String name, @RequestParam String code) {
		HttpResult result = new HttpResult();
		Goods good = new Goods();
		good.setName(name);
		good.setRemainNum(0);
		good.setCode(code);
	    
		try {
			goodsRepository.save(good);
		}catch(Exception e) {
			return result;
		}
		result.setCode(200);
		result.setMsg(good.getName()+" has been saved!");
		result.setData("");
		
		return result;
	}
    
    // goods delete use RequestMethod.DELETE
    @RequestMapping(value="/goodsdelete", method=RequestMethod.DELETE)
	public HttpResult goodsDelete(@RequestParam Integer id) {
		HttpResult result = new HttpResult();
		Iterable<Goods> goods = goodsRepository.findAll();
		
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				goodsRepository.delete(good);
				result.setCode(200);
				result.setMsg( "" + good.getName() + " has been deleted!");
				result.setData("");
				
				return result;
			}
		}
		result.setCode(200);
		result.setMsg("error! target target not found!");
		result.setData("");
		
		return result;
	}
    
    // goods modify use  RequestMethod.PATCH & RequestMethod.PUT(no this service)
    @RequestMapping(value="/goodsin",method=RequestMethod.PATCH)
	public HttpResult goodsIn(@RequestParam Integer id, @RequestParam Integer quantity){
		HttpResult result = new HttpResult();
		Iterable<Goods> goods = goodsRepository.findAll();
		
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				good.setRemainNum(quantity + good.getRemainNum());
				goodsRepository.save(good);
				result.setCode(200);
				result.setMsg("goods save successful!!! " + good.getName() + " has " + good.getRemainNum() + " left!!!");
				result.setData("");
				
				return result;
			}
		}
		result.setCode(404);
		result.setMsg("goods in failed!!!arget not found!!!");
		result.setData("");
		
		return result;
	}
    
	@RequestMapping(value="/goodsout",method=RequestMethod.PATCH)
	public HttpResult goodsOut(@RequestParam Integer id, @RequestParam Integer quantity){
		HttpResult result = new HttpResult();
		
		Iterable<Goods> goods = goodsRepository.findAll();

		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				if(good.getRemainNum() >= quantity) {
					good.setRemainNum(good.getRemainNum() - quantity);
					goodsRepository.save(good);
					result.setCode(200);
					result.setMsg("good out successful!!! " + good.getName() + " has " + good.getRemainNum() + " left!!!");
					result.setData("");
				}else {
					result.setCode(500);
					result.setMsg("good out failed!!! not enought " + good.getName() + " to out!!!");
					result.setData("");
				}
				return result;
			}
		}
		result.setCode(404);
		result.setMsg("good out failed!!! target not found!!!");
		result.setData("");
		
		return result;
	}
    
    @RequestMapping(value="/goodsrename", method=RequestMethod.PATCH)
	public HttpResult goodsRename(@RequestParam Integer id, @RequestParam String name) {
		HttpResult result = new HttpResult();
		Iterable<Goods> goods = goodsRepository.findAll();
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				good.setName(name);
				goodsRepository.save(good);
				result.setCode(200);
				result.setMsg("modify successfully!!!");
				result.setData("");
				
				return result;
			}
		}
		result.setCode(404);
		result.setMsg("error! target target not found!");
		result.setData("");
		
		return result;
	}
}