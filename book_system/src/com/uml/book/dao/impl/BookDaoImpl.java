package com.uml.book.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.uml.book.dao.BookDao;
import com.uml.book.entity.Book;

@Repository("bookDao")
public class BookDaoImpl extends BaseDaoImpl<Book,Integer> implements BookDao{
	@SuppressWarnings("unchecked")
	public List<Book> getByPage(int currentPage, int showNumber){
		String hql = "from Book b where b.flag=0"; 
		Query query = this.getHibernateSession().createQuery(hql);
	    query.setFirstResult((currentPage - 1) * showNumber);
	    query.setMaxResults(showNumber);
		return query.list();
	}
}
