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

	/**
	 * 根据角色名获取记录
	 * @param roleName
	 * @return
	 */
	public List<User> getUser(String roleName);
	
	/**
	 * 根据对象跟新记录
	 * @param user
	 */
	public void update(User user);
	
	/**
	 * 根据对象删除记录
	 * @param user
	 */
	public void delete(User user);
	
	/**
	 * 根据id获取记录
	 * @param id
	 * @return
	 */
	public User get(int id);
}
