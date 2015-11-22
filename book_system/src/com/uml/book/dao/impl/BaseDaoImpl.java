package com.uml.book.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.uml.book.dao.BaseDao;

public abstract class BaseDaoImpl<T, ID extends Serializable> implements BaseDao<T, ID> {
	
	private Class<T> entityClass;

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory hibernateSessionFactory;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public BaseDaoImpl() {
        Type genericType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genericType).getActualTypeArguments();
        entityClass = (Class) params[0];
	}
	
	protected Session getHibernateSession() {
		return this.hibernateSessionFactory.getCurrentSession();
	}
	
	@Override
	public void save(Object object) {
		this.getHibernateSession().save(object);		
	}

	@Override
	public void delete(Object object) {
		this.getHibernateSession().delete(object);
		this.getHibernateSession().flush();
	}

	@Override
	public void delete(ID id) {
		Object object = this.get(id);
		this.delete(object);
		this.getHibernateSession().flush();
	}

	@Override
	public void update(Object object) {
		this.getHibernateSession().update(object);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(ID id) {
		return (T) this.getHibernateSession().get(entityClass, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getByName(String name) {
		String hql = "from "  + entityClass.getName() + " where name=?";
		Query query = this.getHibernateSession().createQuery(hql);
		return (List<T>) query.setParameter(0, name).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getAll() {
		String hql = "from " + entityClass.getName();
		Query query = this.getHibernateSession().createQuery(hql);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getByCondition(String hql) {
		Query query = this.getHibernateSession().createQuery(hql);
		return query.list();
	}

	@Override
	public void batchDelete(ID[] ids) {
		for(ID id : ids){
			this.delete(id);
		}
		this.getHibernateSession().flush();
	}

	@Override
	public void batchDeleteSet(Set<T> ts){
		for(T t : ts){
			this.delete(t);
		}
		this.getHibernateSession().flush();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> getByPage(int currentPage, int showNumber) {
		String hql = "from " + entityClass.getName(); 
		Query query = this.getHibernateSession().createQuery(hql);
	    query.setFirstResult((currentPage - 1) * showNumber);
	    query.setMaxResults(showNumber);
		return query.list();
	}

	@Override
	public long getTotalCount() {
		String hql = "select count(*) from " + entityClass.getName();
		Query query = this.getHibernateSession().createQuery(hql);
		//query.uniqueResult()返回的是long型的数据，只需要做下类型转换就可以了
		return (long) query.uniqueResult();
	}

}
