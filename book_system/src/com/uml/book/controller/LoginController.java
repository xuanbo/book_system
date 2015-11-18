package com.uml.book.controller;

import java.util.Set;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uml.book.entity.Role;
import com.uml.book.entity.User;
import com.uml.book.security.CustomUserDetailsService;
import com.uml.book.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("customUserDetailsService")
	private CustomUserDetailsService customUserDetailsService;
	
	
	@RequestMapping(value = "/login**", method = RequestMethod.GET)
	public ModelAndView loginPage(
		@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {
 
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
 
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login"); 
		return model; 
	}
	
	@RequestMapping(value = "/validate", method = RequestMethod.POST)
	public @ResponseBody boolean login(@RequestBody JSONObject jsonobject,HttpSession session){
		if(userService.isFindPasswordByUserName(jsonobject.getString("username"), jsonobject.getString("password"))){
			//spring security 将权限及用户信息存入securityContext  
		    UserDetails userDetails = customUserDetailsService.loadUserByUsername(jsonobject.getString("username"));  
		    Authentication authentication = new UsernamePasswordAuthenticationToken(    
		            userDetails, userDetails.getPassword(), userDetails.getAuthorities());  
		    SecurityContext securityContext = SecurityContextHolder.getContext();  
		    securityContext.setAuthentication(authentication);    
		    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		    User user = userService.getByName(jsonobject.getString("username")).get(0);
		    Set<Role> roles = user.getRoles();
		    for(Role role : roles){
		    	session.setAttribute("Role", role.getName());
		    }	    
			return true;	
		}else{
			return false;
		}
	}
	
	/** 
     * 指定无访问额权限页面 
     *  
     * @return 
     */  
    @RequestMapping(value = "/denied**", method = RequestMethod.GET)  
    public String deniedPage() {   
        return "denied";  
    }  
    
    @RequestMapping(value = "/admin**", method = RequestMethod.GET)  
    public String adminPage() {   
        return "admin/admin";  
    }
   
     
}
