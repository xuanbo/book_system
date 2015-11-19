package com.uml.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	/**
	 * 主页
	 * @return
	 */
	@RequestMapping(value={"/","/home"}, method = RequestMethod.GET)
	public String home(){
		return "home";	
	}
	
	@RequestMapping(value="common/aboutUs", method = RequestMethod.GET)
	public String aboutUs(){
		return "aboutUs";
	}
}
