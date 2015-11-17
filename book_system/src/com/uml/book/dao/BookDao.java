package com.uml.book.dao;

import java.util.List;

import com.uml.book.entity.Book;

public interface BookDao extends BaseDao<Book,Integer>{
	public List<Book> getByPage(int currentPage, int showNumber);
}
