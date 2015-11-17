package com.uml.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uml.book.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	@Qualifier("bookService")
	private BookService bookService;
	
	@RequestMapping(value="/common/book/list*",method=RequestMethod.GET)
	public String bookListPage(Model model){
		model.addAttribute("books", bookService.getAll());
		return "books/list";		
	}
}
