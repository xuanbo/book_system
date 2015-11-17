package com.uml.book.service;

import java.util.List;

import com.uml.book.entity.Book;

public interface BookService {
	/**
	 * 获取所有的书籍记录
	 * @return
	 */
	public List<Book> getAll();
}
