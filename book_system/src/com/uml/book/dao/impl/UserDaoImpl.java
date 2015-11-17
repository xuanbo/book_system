package com.uml.book.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.uml.book.dao.UserDao;
import com.uml.book.entity.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User, Integer> implements UserDao {

	/**
	 * 多对多关联查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUser(String roleName) {
		String hql = "select u from User u join u.roles r where r.name=?";
		Query query = super.getHibernateSession().createQuery(hql);
		query.setString(0, roleName);
		return query.list();
	}

}
