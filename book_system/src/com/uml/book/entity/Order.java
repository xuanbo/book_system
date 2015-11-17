package com.uml.book.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 订单实体类(记录了预约，归还信息)
 * @author 寻花问柳
 *
 */
@Entity
@Table(name = "orders")
public class Order {
	private Integer id;
	private String state;            //订单的状态(预定处理，预定成功，已借阅，已归还)
	private Date orderTime;           //预约的时间
	private Date borrowTime;          //借阅的时间
	private Date returnTime;          //归还时间
	private boolean overdue;         //是否逾期
	private User user;               //每一条订单只有一用户
	private Book book;               //每一条订单一本书
	
	public Order(Integer id, String state, Date orderTime, Date borrowTime,
			Date returnTime, boolean overdue, User user, Book book) {
		super();
		this.id = id;
		this.state = state;
		this.orderTime = orderTime;
		this.borrowTime = borrowTime;
		this.returnTime = returnTime;
		this.overdue = overdue;
		this.user = user;
		this.book = book;
	}

	public Order() {
		super();
	}

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}	

	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Date getBorrowTime() {
		return borrowTime;
	}
	public void setBorrowTime(Date borrowTime) {
		this.borrowTime = borrowTime;
	}

	public Date getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	public boolean isOverdue() {
		return overdue;
	}
	public void setOverdue(boolean overdue) {
		this.overdue = overdue;
	}

	@OneToOne(cascade = CascadeType.MERGE,fetch = FetchType.LAZY)
	@JoinTable(name = "userOrder" ,
	joinColumns = { @JoinColumn( name ="orderId" )},
	inverseJoinColumns = { @JoinColumn( name = "userId") })
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	@OneToOne(cascade = CascadeType.MERGE,fetch = FetchType.LAZY)
	@JoinTable(name = "orderBook" ,
	joinColumns = { @JoinColumn( name ="orderId" )},
	inverseJoinColumns = { @JoinColumn( name = "bookId") })
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}

	
}
