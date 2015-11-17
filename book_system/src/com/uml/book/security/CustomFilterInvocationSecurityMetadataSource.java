package com.uml.book.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import com.uml.book.service.ResourceService;


@Service("customFilterInvocationSecurityMetadataSource")
public class CustomFilterInvocationSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {

	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	private PathMatcher pathMatcher = new AntPathMatcher();	

	@Autowired
	@Qualifier("resourceService")
	private ResourceService resourceService;
		
	public CustomFilterInvocationSecurityMetadataSource (ResourceService resourceService) {
		super();
		this.resourceService = resourceService;
		resourceMap = loadResourceMatchAuthority();
	}
	/**
	 * 加载资源与权限的映射关系
	 * 
	 * @return
	 */
	private Map<String, Collection<ConfigAttribute>> loadResourceMatchAuthority() {

		Map<String, Collection<ConfigAttribute>> map = new HashMap<String, Collection<ConfigAttribute>>();

		// 获取资源权限映射key：url，value：role
		Map<String, String> configs = resourceService.getResources();
		
		for (Entry<String, String> entry : configs.entrySet()) {
			Collection<ConfigAttribute> list = new ArrayList<ConfigAttribute>();

			String[] vals = entry.getValue().split(",");
			for (String val : vals) {
				ConfigAttribute config = new SecurityConfig(val);
				list.add(config);
			}
			map.put(entry.getKey(), list);
		}

		return map;

	}
	
	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		String url = ((FilterInvocation) object).getRequestUrl();

		//System.out.println("requestUrl is :" + url);
		
		if (resourceMap == null) {
			loadResourceMatchAuthority();
		}
		//比较url是否存在
		Iterator<String> ite = resourceMap.keySet().iterator();
		while (ite.hasNext()) {
			String resURL = ite.next();
			if (pathMatcher.match(resURL,url)) {
				return resourceMap.get(resURL);
			}
		}
		return resourceMap.get(url);
	}

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

}
