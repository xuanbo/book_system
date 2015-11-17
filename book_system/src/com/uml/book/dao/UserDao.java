package com.uml.book.dao;

import java.util.List;

import com.uml.book.entity.User;

public interface UserDao extends BaseDao<User,Integer>{
    /**
     * 根据用户角色多对多查询user
     * @param roleName
     * @return
     */
	public List<User> getUser(String roleName);
}
