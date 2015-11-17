package com.uml.book.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


public class CustomUserDetails implements UserDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String username;
	
	private String password;
	
	private boolean enabled;
	
	private Collection<GrantedAuthority> authorities;
	
	private boolean accountNonExpired;
	
	private boolean credentialsNonExpired;
	
	private boolean accountNonLocked;

	
	
	public CustomUserDetails(String username, String password, boolean enabled,
			 boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,Collection<GrantedAuthority> collection) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.authorities = collection;
		this.accountNonExpired = accountNonExpired;
		this.credentialsNonExpired = credentialsNonExpired;
		this.accountNonLocked = accountNonLocked;
	}

	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		return authorities;
	}
	
	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Collection<GrantedAuthority> getRoles() {
		return authorities;
	}

	public void setRoles(Collection<GrantedAuthority> roles) {
		this.authorities = roles;
	}
	
}
