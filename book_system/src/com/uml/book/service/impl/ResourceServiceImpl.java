package com.uml.book.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uml.book.dao.ResourceDao;
import com.uml.book.entity.Resource;
import com.uml.book.service.ResourceService;

@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	@Qualifier("resourceDao")
	private ResourceDao resourceDao;
		
	@Override
	public Map<String, String> getResources() {
		Map<String, String> map = new HashMap<String, String>();
		List<Resource> resources = resourceDao.getAll();
		for(Resource resource : resources){
			map.put(resource.getUrl(), resource.getAuthority());
		}
		return map;
	}

}
