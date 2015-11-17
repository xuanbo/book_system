package com.uml.book.service;

import java.util.List;

import com.uml.book.entity.Status;

public interface StatusService {
	/**
	 * 获取所有的记录
	 * @return
	 */
	public List<Status> getAll();
	
	/**
	 * 根据对象跟新记录
	 * @param status
	 */
	public void update(Status status);
	
	/**
	 * 新增记录
	 * @param status
	 */
	public void save(Status status);
	
	/**
	 * 通过name获取记录
	 * @param name
	 * @return
	 */
	public List<Status> getByName(String name);
}
