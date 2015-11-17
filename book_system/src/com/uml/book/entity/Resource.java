package com.uml.book.entity;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * 资源实体类
 * @author 寻花问柳
 *
 */
@Entity
@Table(name = "resource")
public class Resource {
	private Integer id;
	private String url;         //资源路径
	private String authority;   //权限
	private Set<Role> roles;    //不同的角色可以访问不同的资源

	public Resource() {
		super();
	}
	public Resource(Integer id, String url, String authority, Set<Role> roles) {
		super();
		this.id = id;
		this.url = url;
		this.authority = authority;
		this.roles = roles;
	}
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}	
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@ManyToMany(mappedBy="resources")
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	
}
