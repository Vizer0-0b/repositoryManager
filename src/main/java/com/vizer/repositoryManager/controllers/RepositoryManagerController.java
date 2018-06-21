package com.vizer.repositoryManager.controllers;


import java.util.*;
import java.util.Date;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.vizer.repositoryManager.entities.Goods;
import com.vizer.repositoryManager.repositories.GoodsRepository;

import freemarker.template.Configuration;

@RestController
@RequestMapping(path="/goods")
public class RepositoryManagerController {
	private static final Logger logger = LoggerFactory.getLogger(RepositoryManagerController.class);
	// final private String back = "<p><input name=\"back\" type=\"button\" value=\"back\" onclick=\"javascript:history.back(-1);\"/></p>";
	
	@Autowired
	Configuration configuration; //freeMarker configuration  
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	@Value("${userName}")
	private String userName;
	

    @RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView index(Model model) throws Exception{
        ModelAndView mv = new ModelAndView("repositoryManager/index");		
		Iterable<Goods> goods = goodsRepository.findAll();
	    model.addAttribute("time",new Date().toString());
	    model.addAttribute("goods", goods);
	    model.addAttribute("userName", userName);
		return mv;
	}
	
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public ModelAndView getList(Model model) throws Exception {
        ModelAndView mv = new ModelAndView("repositoryManager/mainList");
	    Iterable<Goods> goods = goodsRepository.findAll();
	    model.addAttribute("time",new Date().toString());
	    model.addAttribute("goods", goods);
        return mv;
    }
//	
//	@GetMapping(path="/list")
//	public String getList(Model model) throws Exception {
//	    Iterable<Goods> goods = goodsRepository.findAll();
//	    model.addAttribute("time",new Date().toString());
//	    model.addAttribute("goods", goods);
//		return "mainList";
//	}
//	
    

    @RequestMapping(value="/searc", method=RequestMethod.GET)
	public ModelAndView search(@RequestParam String pattern, Model model) {
	    Iterable<Goods> goods = goodsRepository.findAll();
	    model.addAttribute("time",new Date().toString());
	    //Pattern p=Pattern.compile("^.*" + pattern + ".*$");
	    ArrayList<Goods> goodsList = new ArrayList<Goods>();
	    for(Goods good:goods) {
			if(good.getCode().equals(pattern)) {
				goodsList.add(good);
			}
		}
	    if(goodsList.size() > 0) {
	        ModelAndView mv = new ModelAndView("repositoryManager/mainList");
	    	model.addAttribute("goods", goodsList);
	    	return mv;
	    }else {
	        ModelAndView mv = new ModelAndView("repositoryManager/message");
	    	model.addAttribute("message", "sorry, could not find the target witch code is " + pattern);
	    	return mv;
	    }
	    
	}

    @RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView add (Model model) {
        ModelAndView mv = new ModelAndView("repositoryManager/addone");
	    model.addAttribute("time",new Date().toString());
		return mv;
	}
	
	
    @RequestMapping(value="/addone", method=RequestMethod.GET)
	public ModelAndView addOne (@RequestParam String name	, @RequestParam String code, Model model) {
		Goods good = new Goods();
		good.setName(name);
		good.setRemainNum(0);
		good.setCode(code);

	    model.addAttribute("time",new Date().toString());
	    
		try {
			goodsRepository.save(good);
		}catch(Exception e) {
			ModelAndView mv = new ModelAndView("repositoryManager/message");
			logger.info("saveError");
			model.addAttribute("message", "save error!"+" target already exsist!");
			return mv;
		}
		ModelAndView mv = new ModelAndView("repositoryManager/message");
		model.addAttribute("message", good.getName()+" has been saved!");
		return mv;
	}

	/**
	@GetMapping(path="/all")
	public @ResponseBody Iterable<Goods> getAllGoods() {
    	logger.info("getAllGoods called");
		// This returns a JSON or XML with the users
		return goodsRepository.findAll();
	}
	**/
	
    @RequestMapping(value="/deleteone", method=RequestMethod.GET)
	public ModelAndView deleteOne(@RequestParam Integer id, Model model) {
		Iterable<Goods> goods = goodsRepository.findAll();
	    model.addAttribute("time",new Date().toString());
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				ModelAndView mv = new ModelAndView("repositoryManager/message");
				goodsRepository.delete(good);
				model.addAttribute("message", good.getName() + " has been deleted!");
				return mv;
			}
		}
		ModelAndView mv = new ModelAndView("repositoryManager/message");
		model.addAttribute("message", "error! target target not found!");
		return mv;
	}
	
    @RequestMapping(value="/edit", method=RequestMethod.GET)
	public ModelAndView editPage(@RequestParam Integer id, Model model) {
	    model.addAttribute("time",new Date().toString());
		Iterable<Goods> goods = goodsRepository.findAll();
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				ModelAndView mv = new ModelAndView("repositoryManager/editgood");
			    model.addAttribute("time",new Date().toString());
				model.addAttribute("good", good);
				return mv;
			}
		}
		ModelAndView mv = new ModelAndView("repositoryManager/message");
		model.addAttribute("message", "error! target not found!");
		return mv;
	}
	
    @RequestMapping(value="/editgood", method=RequestMethod.GET)
	public ModelAndView editGood(@RequestParam Integer id,@RequestParam String code,@RequestParam String name, Model model) {
		Iterable<Goods> goods = goodsRepository.findAll();
	    model.addAttribute("time",new Date().toString());
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				ModelAndView mv = new ModelAndView("repositoryManager/message");
				good.setName(name);
				goodsRepository.save(good);
				model.addAttribute("message", "modify successfully!!!");
				return mv;
			}
		}
		ModelAndView mv = new ModelAndView("repositoryManager/message");
		model.addAttribute("message", "error! target target not found!");
		return mv;
		
	}
	
	/**
	 * 
	 * @param id
	 * @param io	true means in; false means out;
	 * @param model
	 * @return ModelAndView
	 */
    @RequestMapping(value="/goodsio", method=RequestMethod.GET)
	public ModelAndView goodsioe(@RequestParam Integer id, @RequestParam boolean type, Model model) {
		model.addAttribute("type", type?"goodsin":"goodsout");	// tell front page i or o.
	    model.addAttribute("time",new Date().toString());
	    
		Iterable<Goods> goods = goodsRepository.findAll();
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				ModelAndView mv = new ModelAndView("repositoryManager/goodsio");
				model.addAttribute("good", good);
				return mv;
			}
		}
		ModelAndView mv = new ModelAndView("repositoryManager/message");
		model.addAttribute("message", "target not found!!!");
		return mv;
	}
	
    @RequestMapping(value="/goodsin", method=RequestMethod.GET)
	public ModelAndView goodsin(@RequestParam Integer id, @RequestParam Integer amount, Model model) {
		model.addAttribute("time",new Date().toString());
	    
		Iterable<Goods> goods = goodsRepository.findAll();
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				ModelAndView mv = new ModelAndView("repositoryManager/message");
				good.setRemainNum(amount + good.getRemainNum());
				goodsRepository.save(good);
				model.addAttribute("message", "good entry successful!!! " + good.getName() + " has " + good.getRemainNum() + " left!!!");
				return mv;
			}
		}
		ModelAndView mv = new ModelAndView("repositoryManager/message");
		model.addAttribute("message", "target not found!!!");
		return mv;
	}
	
    @RequestMapping(value="/goodsout", method=RequestMethod.GET)
	public ModelAndView goodsout(@RequestParam Integer id, @RequestParam Integer amount, Model model) {
		model.addAttribute("time",new Date().toString());	    
		
		Iterable<Goods> goods = goodsRepository.findAll();
		for(Goods good:goods) {
			if(good.getId().equals(id)) {
				ModelAndView mv = new ModelAndView("repositoryManager/message");
				if(good.getRemainNum() >= amount) {
					good.setRemainNum(good.getRemainNum() - amount);
					goodsRepository.save(good);
					model.addAttribute("message", "good out successful!!! " + good.getName() + " has " + good.getRemainNum() + " left!!!");
				}else {
					model.addAttribute("message", "good out failed!!! not enought " + good.getName() + " to out!!!");
				}
				return mv;
			}
		}
		ModelAndView mv = new ModelAndView("repositoryManager/message");
		model.addAttribute("message", "target not found!!!");
		return mv;
	}
    
 
    
	
}