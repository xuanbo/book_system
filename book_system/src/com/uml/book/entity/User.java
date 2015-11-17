package com.uml.book.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 用户实体类
 * @author 寻花问柳
 *
 */
@Entity
@Table(name = "user")
public class User {
	private Integer id; 
	private String name;         //用户名
	private String password;     //用户密码
	private Set<Role> roles;     //每个用户拥有不同的权限
	private Status status;       //一个用户自能拥有一种身份
	private Set<Order> order;    //一个用户拥有多条订单
	
	public User(Integer id, String name, String password, Set<Role> roles,
			Status status, Set<Order> order) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.roles = roles;
		this.status = status;
		this.order = order;
	}

	public User() {
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

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	//主控方
	@ManyToMany(cascade = CascadeType.MERGE,fetch = FetchType.LAZY)
	@JoinTable(name = "userRole" ,
	joinColumns = { @JoinColumn( name ="userId" )},
	inverseJoinColumns = { @JoinColumn( name = "roleId") })
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	//写了mappedBy就代表这个方法的返回值是被维护方
    @ManyToOne(cascade = CascadeType.MERGE,fetch = FetchType.LAZY)
	@JoinTable(name = "userStatus" ,
	joinColumns = { @JoinColumn( name ="userId" )},
	inverseJoinColumns = { @JoinColumn( name = "statusId") })
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}

	//写了mappedBy就代表这个方法的返回值是被维护方
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "user")
	public Set<Order> getOrder() {
		return order;
	}
	public void setOrder(Set<Order> order) {
		this.order = order;
	}
	
	
	
} 
