package com.uml.book.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.uml.book.entity.Resource;
import com.uml.book.entity.Role;
import com.uml.book.entity.User;
import com.uml.book.service.UserService;


@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserService userService;

	@Override
	public UserDetails loadUserByUsername(String name)
			throws UsernameNotFoundException {
		
		UserDetails userDetails = null;
		
		try {
			User user = userService.getByName(name).get(0);
			Collection<GrantedAuthority> authorities = getAuthorities(user);
			userDetails = (UserDetails) new CustomUserDetails(user.getName(), user.getPassword(), true, true, true, true, authorities);
		} catch (Exception e) { 
            throw new UsernameNotFoundException("Error in retrieving user"); 
		}
		return userDetails;
	}

	 /** 
     * 获得访问角色权限 
     *  
     * @param access 
     * @return 
     */  
	private Set<GrantedAuthority> getAuthorities(User user) {  
  
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();  
        Set<Role> roles = user.getRoles();
        Set<Resource> resources = new HashSet<Resource>();
        for(Role role : roles){
        	resources = role.getResources();
        	for(Resource resource : resources){
        		authorities .add(new  SimpleGrantedAuthority(resource.getAuthority())); 
        	}     	
        } 
        return authorities ;  
    }  
}
