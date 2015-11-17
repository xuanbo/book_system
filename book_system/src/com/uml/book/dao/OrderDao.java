package com.uml.book.dao;

import java.util.List;

import com.uml.book.entity.Order;

public interface OrderDao extends BaseDao<Order,Integer>{
	/**
	 * 覆盖父接口中的getAll方法，父方法中的getAll对于orderDao失效
	 * 由于order与数据库中的关键字冲突，表的名字在实体类后加了‘s’，即表名改为了orders
	 */
	public List<Order> getAll();
}
