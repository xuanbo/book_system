package com.uml.book.dao.impl;

import org.springframework.stereotype.Repository;

import com.uml.book.dao.BookDao;
import com.uml.book.entity.Book;

@Repository("bookDao")
public class BookDaoImpl extends BaseDaoImpl<Book,Integer> implements BookDao{

}
