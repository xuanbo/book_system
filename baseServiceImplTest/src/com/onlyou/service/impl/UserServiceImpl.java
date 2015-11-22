package com.onlyou.service.impl;

import org.springframework.stereotype.Service;

import com.onlyou.entity.User;
import com.onlyou.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl <User, Integer> implements UserService {

	@Override
	public boolean isFindPasswordByName(String name, String password) {
	    User user = super.getByName(name).get(0);
		if(user.equals(null)){
			return false;
		}else if(user.getPassword().equals(password)){
			return true;
		}else{
			return false;
		}
	}

}
