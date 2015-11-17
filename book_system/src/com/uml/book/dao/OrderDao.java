package com.uml.book.dao;

import java.util.List;

import com.uml.book.entity.Order;

public interface OrderDao extends BaseDao<Order,Integer>{
	
	/**
	 * 获取用户id为userId的预约成功记录数
	 * @param userId
	 * @return
	 */
	public int getOrderSuccessNumber(int userId);
	
	/**
	 * 根据用户id获取某个用户的预约状态记录
	 * @param userId
	 * @param state
	 * @return
	 */
	public List<Order> getAllOrderStateOfSomeone(int userId, String state);
	
	/**
	 * 任意字段查询记录
	 * @param userId
	 * @param state
	 * @param bookId
	 * @return
	 */
	public List<Order> getByConditionParam(int userId, String state, int bookId);
	
	/**
	 * 获取某个预约状态的记录数目
	 * @param state
	 * @return
	 */
	public int getOrderStateNumber(String state);
	
}
