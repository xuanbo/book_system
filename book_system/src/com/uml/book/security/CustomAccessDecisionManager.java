package com.uml.book.security;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

/**
 * 自定义访问决策器，决定某个用户具有的角色，是否有足够的权限去访问某个资源 
 *
 */
public class CustomAccessDecisionManager implements AccessDecisionManager {

	@Override
	public void decide(Authentication authentication, Object object,
			Collection<ConfigAttribute> configAttributes)
			throws AccessDeniedException, InsufficientAuthenticationException {
		
		if (configAttributes == null) {
			return;
		}

		// 所请求的资源拥有的权限(一个资源对多个权限)
		Iterator<ConfigAttribute> iterator = configAttributes.iterator();
		
		while (iterator.hasNext()) {
			ConfigAttribute configAttribute = iterator.next();
			
			// 访问所请求资源所需要的权限
			String needPermission = configAttribute.getAttribute();
			
			//System.out.println("needPermission is " + needPermission);
			
			// 用户所拥有的权限authentication
			for (GrantedAuthority ga : authentication.getAuthorities()) {
				if (needPermission.equals(ga.getAuthority())) {
					//System.out.println("拥有权限：" + needPermission);
					return;
				}
			}
		}

		// 没有权限
		throw new AccessDeniedException(" No Access Dendied ");

	}

	@Override
	public boolean supports(ConfigAttribute arg0) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

}
