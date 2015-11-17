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
		String hql = "from Book b where b.flag=0";
		return bookDao.getByCondition(hql);
	}

	@Override
	public List<Book> getByPage(int currentPage, int showNumber) {
		return bookDao.getByPage(currentPage, showNumber);
	}

	@Override
	public long getTotalCount() {
		return bookDao.getTotalCount();
	}

	@Override
	public void delete(int id) {
		Book book = bookDao.get(id);
		book.setFlag(1);
		bookDao.update(book);
	}

	@Override
	public Book get(int id) {
		return bookDao.get(id);
	}

	@Override
	public void update(Book book) {
		bookDao.update(book);
	}

	@Override
	public void save(Book book) {
		bookDao.save(book);
	}

}
