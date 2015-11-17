package com.uml.book.dao.impl;

import org.springframework.stereotype.Repository;

import com.uml.book.dao.RoleDao;
import com.uml.book.entity.Role;

@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoImpl<Role,Integer> implements RoleDao{

}
