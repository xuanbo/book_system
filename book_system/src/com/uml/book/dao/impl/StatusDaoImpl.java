package com.uml.book.dao.impl;

import org.springframework.stereotype.Repository;

import com.uml.book.dao.StatusDao;
import com.uml.book.entity.Status;

@Repository("statusDao")
public class StatusDaoImpl extends BaseDaoImpl<Status,Integer> implements StatusDao{

}
