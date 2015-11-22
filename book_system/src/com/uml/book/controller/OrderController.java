package com.uml.book.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uml.book.entity.Order;
import com.uml.book.entity.User;
import com.uml.book.service.OrderService;
import com.uml.book.service.UserService;

@Controller
public class OrderController {
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;
	
	/**
	 * 用户进行预约请求
	 * @param jsonobject
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/common/book/order", method = RequestMethod.POST)
	public @ResponseBody boolean order(@RequestBody JSONObject jsonobject, HttpServletRequest request){
		/**
		 * 获取session中的用户名
		 * 通过用户名获取到user对象
		 */
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		String username = securityContextImpl.getAuthentication().getName();		
		//System.out.println(username);
		User user = userService.getByName(username).get(0);
		//获取前端预定的bookId
		int bookId = Integer.parseInt(jsonobject.getString("bookId"));
		//System.out.println(bookId);
		if(orderService.isCanOrder(user.getId(), bookId)){
			Order order = new Order();
			order.setOrderTime(new Date());
			order.setState("预约成功");
			orderService.save(order, user.getId(), bookId);
			return true;
		}else{
			//System.out.println("无法进行预约");
			return false;	
		}					
	}
	
	@RequestMapping(value="/common/myOrderList", method = RequestMethod.GET)
	public String myOrder(Model model, HttpServletRequest request){
		/**
		 * 获取session中的用户名
		 * 通过用户名获取到user对象
		 */
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		String username = securityContextImpl.getAuthentication().getName();
		User user = userService.getByName(username).get(0);
	    model.addAttribute("myOrders", orderService.getByConditionParam(user.getId(), "预约成功", 0));
		return "user/orderList";
	}
	
	@RequestMapping(value="/common/myBorrowList", method = RequestMethod.GET)
	public String myBorrow(Model model, HttpServletRequest request){
		/**
		 * 获取session中的用户名
		 * 通过用户名获取到user对象
		 */
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		String username = securityContextImpl.getAuthentication().getName();
		User user = userService.getByName(username).get(0);
	    model.addAttribute("myBorrows", orderService.getByConditionParam(user.getId(), "已借出", 0));
		return "user/borrowList";
	}
}
