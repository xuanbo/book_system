package com.uml.book.service;

import java.util.List;

import com.uml.book.entity.User;

public interface UserService {
	/**
	 * 最后会对密码进行加密的
	 */
	public void save(User user);
	
	/**
	 * 验证用户是否登录成功
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean isFindPasswordByUserName(String username,String password);
	
	public List<User> getByName(String name);
}
