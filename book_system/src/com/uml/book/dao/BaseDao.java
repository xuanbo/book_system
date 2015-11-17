package com.uml.book.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T ,ID extends Serializable>{

	/**
	 * 根据对象保存记录
	 * @param object
	 */
	public void save(Object object);
	
	/**
	 * 根据对象删除记录
	 * @param object
	 */
	public void delete(Object object);
	
	/**
	 * 根据id删除记录
	 * @param id
	 */
	public void delete(ID id);
	
	/**
	 * 根据对象更新记录
	 * @param object
	 */
	public void update(Object object);
	
	/**
	 * 根据id获取记录
	 * @param id
	 * @return
	 */
	public T get(ID id);
	
	/**
	 * 根据name获取记录
	 * @param name
	 * @return
	 */
	public List<T> getByName(String name);
	/**
	 * 获取所有的记录
	 * @return
	 */
	public List<T> getAll();
	
	/**
	 * 根据自定义的hql语句获取记录
	 * @param hql
	 * @return
	 */
	public List<T> getByCondition(String hql);
	
	/**
	 * 根据ID[]批量删除记录
	 * @param id
	 */
	public void batchDelete(ID[] ids);
}

