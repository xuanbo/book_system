package com.uml.book.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.uml.book.dao.ResourceDao;
import com.uml.book.entity.Resource;

@Repository("resourceDao")
public class ResourceDaoImpl extends BaseDaoImpl<Resource,Integer> implements ResourceDao{

//	/**
//	 * 获取所有资源权限映射
//	 * key-URL
//	 * value-Role
//	 */
//	@Override
//	public Map<String, String> getResources() {
//		Map<String, String> map = new HashMap<String, String>();
//		List<Resource> resources =this.getAll();
//		for(Resource resource : resources){
//		    map.put(resource.getUrl(), resource.getAuthority());			
// 		}
////		map.put("/common/**", "ROLE_USER");
////		map.put("/bookadmin/**", "ROLE_BOOKADMIN");
////		map.put("/admin/**", "ROLE_ADMIN");
//		return map; 
//	}

}
