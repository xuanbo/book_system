package com.uml.book.service;

import java.util.List;

import com.uml.book.entity.Book;

public interface BookService {
	/**
	 * 获取所有的书籍记录
	 * @return
	 */
	public List<Book> getAll();
	
	/**
	 * 分页获取记录
	 * @param currentPage   当前页面
	 * @param showNumber    每一个页面要显示的数目
	 * @return
	 */
	public List<Book> getByPage(int currentPage, int showNumber);
	
	/**
	 * 获取记录的数目
	 * @return
	 */
	public long getTotalCount();
	
	/**
	 * 根据id删除图书记录（flag置为1）
	 * @param id
	 */
	public void delete(int id);
	
	/**
	 * 根据id获取实体类
	 */
	public Book get(int id);
	
	/**
	 * 根据实体类跟新记录
	 * @param book
	 */
	public void update(Book book);
	
	/**
	 * 新增记录
	 * @param book
	 */
	public void save(Book book);
}
