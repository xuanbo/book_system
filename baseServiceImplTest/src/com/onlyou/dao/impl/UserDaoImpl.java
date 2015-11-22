package com.onlyou.dao.impl;

import org.springframework.stereotype.Repository;

import com.onlyou.dao.UserDao;
import com.onlyou.entity.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl <User, Integer> implements UserDao{

}
