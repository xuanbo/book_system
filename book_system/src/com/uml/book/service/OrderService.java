package com.uml.book.service;

import java.util.List;

import com.uml.book.entity.Order;

public interface OrderService {
	/**
	 * 保存预约记录
	 * @param order
	 */
	public void save(Order order, int userId, int bookId);
	
	/**
	 * 能否进行预约
	 * @param userId
	 * @param bookId
	 * @return
	 */
	public boolean isCanOrder(int userId, int bookId);
	
	/**
	 * 任意字段查询记录
	 * @param userId
	 * @param state
	 * @param bookId
	 * @return
	 */
	public List<Order> getByConditionParam(int userId, String state, int bookId);
	
	/**
	 * 根据预约状态获取预约的记录数目
	 * @param state
	 * @return
	 */
	public int getOrderStateNumber(String state);
	
	/**
	 * 根据orderId跟新预约记录
	 * @param orderId
	 */
	public void updateOrderState(int orderId, String state);

}
