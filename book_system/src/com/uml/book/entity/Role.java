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
import javax.persistence.Table;

/**
 * 角色实体类
 * @author 寻花问柳
 *
 */
@Entity
@Table(name = "role")
public class Role {
	private Integer id;     
	private String name;                //角色名(user,bookadmin,admin)
	private Set<User> users;            //不同的用户拥有不同的角色
	private Set<Resource> resources;    //不同的角色可以访问不同的资源
	
	public Role(Integer id, String name, Set<User> users,
			Set<Resource> resources) {
		super();
		this.id = id;
		this.name = name;
		this.users = users;
		this.resources = resources;
	}

	public Role() {
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
    
	//写了mappedBy就代表这个方法的返回值是被维护方
	@ManyToMany(fetch = FetchType.LAZY,mappedBy = "roles")
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}

	//主控方
	@ManyToMany(cascade = CascadeType.MERGE,fetch = FetchType.LAZY)
	@JoinTable(name = "roleResource" ,
	joinColumns = { @JoinColumn( name ="roleId" )},
	inverseJoinColumns = { @JoinColumn( name = "resourceId") })
	public Set<Resource> getResources() {
		return resources;
	}
	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}
	
	
}
