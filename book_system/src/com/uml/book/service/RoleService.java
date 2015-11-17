package com.uml.book.service;

import java.util.List;

import com.uml.book.entity.Role;

public interface RoleService {
	
	/**
	 * 根据role name获取记录
	 * @param name
	 * @return
	 */
	public List<Role> getByName(String name);
}
