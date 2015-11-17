package com.uml.book.dao.impl;

import org.springframework.stereotype.Repository;

import com.uml.book.dao.UserDao;
import com.uml.book.entity.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User, Integer> implements UserDao {

}
