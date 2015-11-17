package com.uml.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uml.book.dao.RoleDao;
import com.uml.book.entity.Role;
import com.uml.book.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{

	@Autowired
	@Qualifier("roleDao")
	private RoleDao roleDao;
	
	@Override
	public List<Role> getByName(String name) {
		return roleDao.getByName(name);
	}

}
