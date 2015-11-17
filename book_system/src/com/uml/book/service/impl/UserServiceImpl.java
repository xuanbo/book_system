package com.uml.book.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uml.book.dao.OrderDao;
import com.uml.book.dao.RoleDao;
import com.uml.book.dao.UserDao;
import com.uml.book.entity.Order;
import com.uml.book.entity.User;
import com.uml.book.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	@Autowired
	@Qualifier("roleDao")
	private RoleDao roleDao;
	
	@Autowired
	@Qualifier("orderDao")
	private OrderDao orderDao;
	
	@Override
	public void save(User user) {
		userDao.save(user);
	}

	@Override
	public boolean isFindPasswordByUserName(String username, String password) {
		List<User> user = userDao.getByName(username);
		if(user.size() == 0){
			//System.out.println("登录失败：用户不存在");
			return false;
		}else if(user.get(0).getPassword().equals(password)){
			//之后改为解密后的密码进行匹配
			//System.out.println("登录成功");
			return true;
		}else{
			//System.out.println("登录失败：密码不匹配");
			return false;
		}
		
	}

	@Override
	public List<User> getByName(String name) {
		return userDao.getByName(name);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public List<User> getUser(String roleName) {
		return userDao.getUser(roleName);
	}

	/**
	 * 删除user之前要删除order对应的记录，不然order记录中的userId找不到user中的id对应
	 */
	@Override
	public void delete(User user) {
		User newuser = userDao.get(user.getId());
		Set<Order> orders = newuser.getOrders();
		orderDao.batchDeleteSet(orders);
		userDao.delete(newuser);
	}

	@Override
	public User get(int id) {
		return userDao.get(id);
	}

}
