package com.uml.book.dao;

import java.util.Map;

import com.uml.book.entity.Resource;

public interface ResourceDao extends BaseDao<Resource,Integer>{
	
	/**
	 * 获取资源权限列表
	 * @return
	 */
	//Map<String,String> getResources();
}
