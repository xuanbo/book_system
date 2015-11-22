package com.onlyou.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.onlyou.dao.BaseDao;

/**
 * BaseDao接口的实现
 * @author xuan
 *
 * @param <T>
 * @param <ID>
 */
public class BaseDaoImpl <T extends Serializable, ID extends Serializable> implements BaseDao<T, ID>{

	/**
	 * 获取实体类的名字，用于hibernate操作数据库
	 * hibernate中hql语句操作数据库是根据实体类进行操作，而不是根据表名进行操作
	 */
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
		//query.uniqueResult()返回的是long型的数据，如果是int类型只需要做下类型转换就可以了
		return (long) query.uniqueResult();
	}
}
