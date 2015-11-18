package com.uml.book.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.uml.book.dao.OrderDao;
import com.uml.book.entity.Order;

@Repository("orderDao")
public class OrderDaoImpl extends BaseDaoImpl<Order,Integer> implements OrderDao{

	@Override
	public int getOrderSuccessNumber(int userId) {
		String hql = null;
		Query query = super.getHibernateSession().createQuery(hql);
		query.setInteger(0, userId);
		query.setString(1, "预约成功");
		return ((Number)query.uniqueResult()).intValue();
	}

	@Override
	public List<Order> getAllOrderStateOfSomeone(int userId, String state) {
		/**
		 
		String hql = "from orders where userId=? and state=?";
		Query query = super.getHibernateSession().createQuery(hql);
		query.setInteger(0, userId);
		query.setString(1, state);
		*/
		return this.getByConditionParam(userId, state, 0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getByConditionParam(int userId, String state, int bookId) {
		String hql = "from Order o where 1=1";
		if(userId != 0){
			hql += " and o.user.id=" + userId;
		};
		if(state != null){
			hql += " and o.state='" + state + "'";
		};
		if(bookId != 0){
			hql += " and o.book.id=" + bookId;
		}
		Query query = super.getHibernateSession().createQuery(hql);
		return query.list();
	}

	@Override
	public int getOrderStateNumber(String state) {
		String hql = "select count(*) from Order o where o.state=?";
		Query query = super.getHibernateSession().createQuery(hql);
		query.setString(0, state);
		return ((Number)query.uniqueResult()).intValue();
	}
    
}
