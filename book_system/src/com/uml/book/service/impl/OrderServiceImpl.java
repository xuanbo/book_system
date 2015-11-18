package com.uml.book.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uml.book.dao.BookDao;
import com.uml.book.dao.OrderDao;
import com.uml.book.dao.UserDao;
import com.uml.book.entity.Book;
import com.uml.book.entity.Order;
import com.uml.book.entity.User;
import com.uml.book.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	@Autowired
	@Qualifier("orderDao")
	private OrderDao orderDao;
	
	@Autowired
	@Qualifier("bookDao")
	private BookDao bookDao;
	
	@Override
	public void save(Order order0, int userId, int bookId) {
		User user = userDao.get(userId);
		user.setOrderBookNumber(user.getOrderBookNumber() + 1);
		Book book = bookDao.get(bookId);
		book.setRestNumber(book.getRestNumber() - 1);
		Order order = order0;
		order.setUser(user);
		order.setBook(book);
		/**
		 * 由于order维护表之间的关系，所以只需要存储order记录
		 * hibernate会自动更新关联表的信息
		 */
		orderDao.save(order);
	}

	/**
	 * 用户借阅的书超出或等于当前身份能借阅的书籍，则无法进行预约
	 * 用户预约的书超出或等于当前身份能预约的书籍，则无法进行预约
	 * 剩余能预约的书籍不足一本，则无法进行预约
	 */
	@Override
	public boolean isCanOrder(int userId, int bookId) {
		User user = userDao.get(userId);
		Book book = bookDao.get(bookId);
		if(user.getBorrowBookNumber() < user.getStatus().getBorrowNumber() 
				&& user.getOrderBookNumber() < user.getStatus().getOrderNumber() 
				&& book.getRestNumber() > 0
				){
			return true;
		}else{
			return false;
		}		
	}

	@Override
	public List<Order> getByConditionParam(int userId, String state, int bookId) {
		return orderDao.getByConditionParam(userId, state, bookId);
	}

	@Override
	public int getOrderStateNumber(String state) {
		return orderDao.getOrderStateNumber(state);
	}

	@Override
	public void updateOrderState(int orderId,String state) {
		Order order = orderDao.get(orderId);
		order.setState(state);
		if(state.equals("已借出")){
			order.setBorrowTime(new Date());
			order.getUser().setOrderBookNumber(order.getUser().getOrderBookNumber() - 1);
			order.getUser().setBorrowBookNumber(order.getUser().getBorrowBookNumber() + 1);			
			order.getBook().setBookNumber(order.getBook().getBookNumber() - 1);
		}else if(state.equals("已归还")){
			order.setReturnTime(new Date());
			order.getUser().setBorrowBookNumber(order.getUser().getBorrowBookNumber() - 1);	
			order.getBook().setBookNumber(order.getBook().getBookNumber() + 1);
			order.getBook().setRestNumber(order.getBook().getRestNumber() + 1);
		}else if(state.equals("归还失败")){
			order.setReturnTime(new Date());
			order.getUser().setBorrowBookNumber(order.getUser().getBorrowBookNumber() - 1);
		}else if(state.equals("借出失败")){
			order.setBorrowTime(new Date());
			order.getUser().setOrderBookNumber(order.getUser().getOrderBookNumber() - 1);
			order.getBook().setRestNumber(order.getBook().getRestNumber() + 1);
		}		
		orderDao.update(order);
	}



}
