package com.onlyou.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.onlyou.service.UserService;

/**
 * 测试controller
 * @author xuan
 *
 */
@Controller
@RequestMapping("/test")
public class TestDao {

	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	
	@RequestMapping(value="/user/list", method = RequestMethod.GET)
	public ModelAndView Test(){
		ModelAndView model = new ModelAndView();
		model.setViewName("test");
		model.addObject("title", "基于baseServiceImpl的测试，测试有多少个用户");
		model.addObject("user", userService.getAll());
		return model;
	}
	
	@RequestMapping(value="/isMatch", method = RequestMethod.GET)
	public @ResponseBody boolean TestIsFindPasswordByName(@RequestParam String name, 
		@RequestParam String password){
		if(userService.isFindPasswordByName(name, password)){
			return true;
		}else{
			return false;
		}
	}
}
