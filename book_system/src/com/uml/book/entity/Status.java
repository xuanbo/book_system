package com.uml.book.entity;

import java.util.Set;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 身份实体类
 * @author 寻花问柳
 *
 */
@Entity
@Table(name = "status")
public class Status {
	private Integer id;
	private String name;                //用户身份(学生：博士生，研究生，本科生，专科生；老师)
	private int orderNumber;            //不同的身份预约的书籍上限不同
	private int borrowNumber;           //不同的身份借阅的书籍上限不同
	private String borrowBookTime;      //不同的身份借阅时间不同
	private Set<User> users;            //一个用户只有一种身份
	
	public Status(Integer id, String name, int orderNumber, int borrowNumber,
			String borrowBookTime, Set<User> users) {
		super();
		this.id = id;
		this.name = name;
		this.orderNumber = orderNumber;
		this.borrowNumber = borrowNumber;
		this.borrowBookTime = borrowBookTime;
		this.users = users;
	}
	
	public Status() {
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

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public int getBorrowNumber() {
		return borrowNumber;
	}
	public void setBorrowNumber(int borrowNumber) {
		this.borrowNumber = borrowNumber;
	}

	public String getBorrowBookTime() {
		return borrowBookTime;
	}
	public void setBorrowBookTime(String borrowBookTime) {
		this.borrowBookTime = borrowBookTime;
	}

	@OneToMany(mappedBy="status")
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	
	
}
