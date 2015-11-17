package com.uml.book.controller;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uml.book.entity.Book;
import com.uml.book.entity.Page;
import com.uml.book.entity.Role;
import com.uml.book.entity.User;
import com.uml.book.service.BookService;
import com.uml.book.service.UserService;

@Controller
public class BookController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	
	@RequestMapping(value="/common/book/list",method=RequestMethod.GET)
	public ModelAndView bookListPage(@RequestParam int currentPage, HttpServletRequest request){
		int newcurrentPage = currentPage;
		Long totalCount = bookService.getTotalCount();
		Page page = new Page(newcurrentPage, totalCount);
		ModelAndView model = new ModelAndView();
		model.addObject("books",  bookService.getByPage(newcurrentPage, 10));		
		model.addObject("page", page);
		model.setViewName("books/list");
		/**
		 * 获取session中的用户名
		 * 通过用户名获取到user对象
		 */
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		String username = securityContextImpl.getAuthentication().getName();
		User user = userService.getByName(username).get(0);
	    Set<Role> roles =user.getRoles();
	    for(Role role : roles){
	    	if(!role.getName().equals("user")){
	    		model.setViewName("books/listOfBookAdmin");		    		
	    	}
	    }				
		return model;		
	}
	
	@RequestMapping(value="common/book/delete", method = RequestMethod.POST)
	public @ResponseBody boolean bookDelete(@RequestBody JSONObject jsonobject){
		bookService.delete(Integer.parseInt(jsonobject.getString("id")));
		return true;		
	}
	
	@RequestMapping(value="common/book/update", method = RequestMethod.POST)
	public @ResponseBody boolean bookUpdata(@RequestBody JSONObject jsonobject){
		int id = Integer.parseInt(jsonobject.getString("id"));
		Book book = bookService.get(id);
		book.setName(jsonobject.getString("name"));
		book.setWriter(jsonobject.getString("writer"));
		book.setBookId(jsonobject.getString("bookId"));
		book.setStyle(jsonobject.getString("style"));
		book.setCountry(jsonobject.getString("country"));
		book.setDescription(jsonobject.getString("description"));
		book.setRestNumber(Integer.parseInt(jsonobject.getString("restNumber")));
		book.setBookNumber(Integer.parseInt(jsonobject.getString("bookNumber")));
		bookService.update(book);
		return true;		
	}
}
