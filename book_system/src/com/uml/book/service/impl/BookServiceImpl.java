package com.uml.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uml.book.dao.BookDao;
import com.uml.book.entity.Book;
import com.uml.book.service.BookService;

@Service("bookService")
public class BookServiceImpl implements BookService{
	
	@Autowired
	@Qualifier("bookDao")
	private BookDao bookDao;
	
	@Override
	public List<Book> getAll() {		
		return bookDao.getAll();
	}

}
