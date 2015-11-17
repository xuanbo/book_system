package com.uml.book.controller;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uml.book.entity.User;
import com.uml.book.service.OrderService;
import com.uml.book.service.UserService;

@Controller
@RequestMapping("/bookadmin")
public class BookAdminController {
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public ModelAndView bookAdminIndex(){
		ModelAndView model = new ModelAndView();
		model.addObject("orderWaring", "请在上面选择您要做的业务");
		model.addObject("orderSuccessNumber", orderService.getOrderStateNumber("预约成功"));
		model.addObject("orderBorrowNumber", orderService.getOrderStateNumber("已借出"));
		model.setViewName("bookAdmin/home");
		return model;
	}
	
	/**
	 * 图书管理员处理 预约成功处理 
	 * @return
	 */
	@RequestMapping(value="/orderSuccess/list", method = RequestMethod.GET)
	public ModelAndView bookAdminOrderProcess(){
		ModelAndView model = new ModelAndView();
		model.addObject("orderSuccess", orderService.getByConditionParam(0, "预约成功", 0));
		model.addObject("orderSuccessNumber", orderService.getOrderStateNumber("预约成功"));
		model.addObject("orderBorrowNumber", orderService.getOrderStateNumber("已借出"));
		model.setViewName("bookAdmin/orderSuccessPage");
		return model;
	}
	
	/**
	 * 根据借阅证查询预约成功的记录
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/orderSuccess/search", method = RequestMethod.GET)
	public ModelAndView findUserOrder(@RequestParam String userId){	
		if(!userService.getByName(userId).isEmpty()){
			ModelAndView model = new ModelAndView();
			User user = userService.getByName(userId).get(0);
		    model.addObject("orderSuccess", orderService.getByConditionParam(user.getId(), "预约成功", 0));
		    model.setViewName("bookAdmin/orderSuccessPage");
		    return model;
		}else{
			ModelAndView model = new ModelAndView();
			model.addObject("orderSuccess", null);
		    model.setViewName("bookAdmin/orderSuccessPage");
			return model;
		}
	}
	
	/**
	 * 改变预约state的状态
	 * @param jsonobject
	 * @return
	 */
	@RequestMapping(value="/orderSuccess/orderStateChange", method = RequestMethod.POST)
	public @ResponseBody boolean orderSuccessToBorrowState(@RequestBody JSONObject jsonobject){
		System.out.println(jsonobject.getString("state"));
		orderService.updateOrderState(Integer.parseInt(jsonobject.getString("orderId")), jsonobject.getString("state"));
		return true;		
	}
	
	/**
	 * 图书管理员页面 已借出
	 * @return
	 */
	@RequestMapping(value="/borrowSuccess/list", method = RequestMethod.GET)
	public ModelAndView bookAdminBorrowSuccess(){
		ModelAndView model = new ModelAndView();
		model.addObject("borrowSuccess", orderService.getByConditionParam(0, "已借出", 0));
		model.addObject("orderSuccessNumber", orderService.getOrderStateNumber("预约成功"));
		model.addObject("orderBorrowNumber", orderService.getOrderStateNumber("已借出"));
		model.setViewName("bookAdmin/borrowSuccessPage");
		return model;		
	}
	
	/**
	 * 图书管理员页面 已归还
	 * @return
	 */
	@RequestMapping(value="/returnSuccess/list", method = RequestMethod.GET)
	public ModelAndView bookAdminReturnSuccess(){
		ModelAndView model = new ModelAndView();
		model.addObject("returnSuccess", orderService.getByConditionParam(0, "已归还", 0));
		model.addObject("orderSuccessNumber", orderService.getOrderStateNumber("预约成功"));
		model.addObject("orderBorrowNumber", orderService.getOrderStateNumber("已借出"));
		model.setViewName("bookAdmin/returnSuccessPage");
		return model;		
	}
	
	/**
	 * 根据借阅证查询已借出成功的记录
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/borrowSuccess/search", method = RequestMethod.GET)
	public ModelAndView findUserBorrow(@RequestParam String userId){	
		if(!userService.getByName(userId).isEmpty()){
			ModelAndView model = new ModelAndView();
			User user = userService.getByName(userId).get(0);
		    model.addObject("borrowSuccess", orderService.getByConditionParam(user.getId(), "已借出", 0));
		    model.setViewName("bookAdmin/borrowSuccessPage");
		    return model;
		}else{
			ModelAndView model = new ModelAndView();
			model.addObject("borrowSuccess", null);
		    model.setViewName("bookAdmin/borrowSuccessPage");
			return model;
		}
	}
	
	/**
	 * 根据借阅证查询已归还成功的记录
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/returnSuccess/search", method = RequestMethod.GET)
	public ModelAndView findUserReturn(@RequestParam String userId){	
		if(!userService.getByName(userId).isEmpty()){
			ModelAndView model = new ModelAndView();
			User user = userService.getByName(userId).get(0);
		    model.addObject("returnSuccess", orderService.getByConditionParam(user.getId(), "已归还", 0));
		    model.setViewName("bookAdmin/returnSuccessPage");
		    return model;
		}else{
			ModelAndView model = new ModelAndView();
			model.addObject("returnSuccess", null);
		    model.setViewName("bookAdmin/returnSuccessPage");
			return model;
		}
	}
	
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addBook(){
		return "bookAdmin/add";
	}
}
