package com.uml.book.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.uml.book.dao.OrderDao;
import com.uml.book.entity.Order;

@Repository("orderDao")
public class OrderDaoImpl extends BaseDaoImpl<Order,Integer> implements OrderDao{

	@SuppressWarnings("unchecked")
	public List<Order> getAll(){
		String hql = "from orders";
		Query query = super.getHibernateSession().createQuery(hql);
		return query.list();		
	}
}
