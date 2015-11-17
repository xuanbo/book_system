package com.uml.book.dao.impl;

import org.springframework.stereotype.Repository;

import com.uml.book.dao.ResourceDao;
import com.uml.book.entity.Resource;

@Repository("resourceDao")
public class ResourceDaoImpl extends BaseDaoImpl<Resource,Integer> implements ResourceDao{

}
