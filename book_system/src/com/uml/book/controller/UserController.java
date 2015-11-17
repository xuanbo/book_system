package com.uml.book.controller;

import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.Set;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uml.book.entity.Role;
import com.uml.book.entity.Status;
import com.uml.book.entity.User;
import com.uml.book.service.RoleService;
import com.uml.book.service.StatusService;
import com.uml.book.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	@Qualifier("userService")
    private UserService userService;
	
	@Autowired
	@Qualifier("statusService")
    private StatusService statusService;
	
	@Autowired
	@Qualifier("roleService")
	private RoleService roleService;
	
	@RequestMapping(value="admin/user",method = RequestMethod.GET)
	public String userList(){
		return "admin/user";
	}
	
	@RequestMapping(value="admin/user/list",method = RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView model = new ModelAndView();
		model.setViewName("admin/userList");
		model.addObject("users", userService.getUser("user"));
		model.addObject("status", statusService.getAll());
		return model;		
	}
	
	@RequestMapping(value="admin/user/search",method = RequestMethod.GET)
	public ModelAndView search(@RequestParam String name){
		ModelAndView model = new ModelAndView();
		model.setViewName("admin/userList");
		model.addObject("users", userService.getByName(name));		
		model.addObject("status", statusService.getAll());
		return model;		
	}
	
	@RequestMapping(value="admin/user/update",method = RequestMethod.POST)
	public @ResponseBody boolean userUpdate(@RequestBody JSONObject json){
		User user = userService.getByName(json.getString("name")).get(0);
		
		user.setPassword(json.getString("password"));
		Status status = statusService.getByName(json.getString("statusName")).get(0);
		user.setStatus(status);
		
		userService.update(user);
		return true;
	
	}
	
	@RequestMapping(value="/admin/user/delete", method = RequestMethod.POST)
	public @ResponseBody boolean userDelete(@RequestParam String name){
		User user = userService.getByName(name).get(0);
		userService.delete(user);
		return true;
	}
	
	@RequestMapping(value="admin/user/add", method = RequestMethod.GET)
	public ModelAndView userAdd(){
		ModelAndView model = new ModelAndView();
		model.setViewName("admin/userAdd");
		model.addObject("status", statusService.getAll());
		return model;
	}
	
	@RequestMapping(value="admin/user/add", method = RequestMethod.POST)
	public @ResponseBody boolean userAddPost(@RequestBody JSONObject json){
		if(userService.getByName(json.getString("name")).isEmpty()){
			User user = new User();
			user.setName(json.getString("name"));
			user.setPassword(json.getString("password"));
			
			Status status = statusService.getByName(json.getString("statusName")).get(0);
			user.setStatus(status);
			
			Role role = roleService.getByName("user").get(0);
			Set<Role> roles = new HashSet<Role>();
			roles.add(role);
			user.setRoles(roles);
			
			userService.save(user);
			return true;
		}else{
			return false;
		}
		
	}
	
	@RequestMapping(value="admin/user/batchAdd", method = RequestMethod.GET)
	public ModelAndView userBatchAdd(){
		ModelAndView model = new ModelAndView();
		model.setViewName("admin/userBatchAdd");
		model.addObject("status", statusService.getAll());
		return model;
	}
	
	/**
	 * 批量新增
	 * @param json
	 * @return
	 */
	@RequestMapping(value="admin/user/batchAdd", method = RequestMethod.POST)
	public @ResponseBody boolean userBatchAddPost(@RequestBody JSONObject json){
	    int number = json.getInt("number");
	    int name = json.getInt("name");                //编号为001时，name为1
	    int len = json.getString("name").length();     //编号的位数
	    String zero = "";                              //编号有多少位就用有多少个“0”的字符
	    for(int i=0;i<len;i++){
	    	zero += "0";
	    };
	    
	    Status status = statusService.getByName(json.getString("statusName")).get(0);
	    
	    Role role = roleService.getByName("user").get(0);
		Set<Role> roles = new HashSet<Role>();
		roles.add(role);
		
	    //循环批量新增
	    for(int i=0; i<number; i++){
	    	User user = new User();
	    	
	    	String newname =  new DecimalFormat(zero).format(i+name);
	    	
	    	user.setName(newname);
	    	user.setPassword(newname);

	    	user.setStatus(status);
	    	
	    	user.setRoles(roles);
	    	
	    	userService.save(user);
	    }
		return true;
	}
	
	@RequestMapping(value="admin/bookadmin/list", method = RequestMethod.GET)
	public String bookAdminList(ModelMap model){
		model.addAttribute("bookadmins", userService.getUser("bookadmin"));
		return "admin/bookadminList";
	}
	
	@RequestMapping(value="admin/bookadmin/update" , method = RequestMethod.POST)
	public @ResponseBody boolean bookAdminUpdate(@RequestBody JSONObject json){
		
		if(userService.getByName(json.getString("name")).isEmpty()){
			User user = userService.getByName(json.getString("id")).get(0);
			
			user.setName(json.getString("name"));
			user.setPassword(json.getString("password"));
			
			userService.update(user);
			return true;
		}else{
			return false;
		}
		
	}
	@RequestMapping(value="admin/bookadmin/delete" , method = RequestMethod.POST)
	public @ResponseBody boolean bookAdminDelete(@RequestParam int id){
		userService.delete(userService.get(id));
		return true;
	}
	
	@RequestMapping(value="admin/bookadmin/add" , method = RequestMethod.GET)
	public String bookAdminAdd(){
		return "admin/bookadminAdd";
	}
	
	@RequestMapping(value="admin/bookadmin/add" , method = RequestMethod.POST)
	public @ResponseBody boolean bookAdminAddPost(@RequestBody JSONObject json){
		if(userService.getByName(json.getString("name")).isEmpty()){
			User user = new User();			
			user.setName(json.getString("name"));
			user.setPassword(json.getString("password"));
			
			Role role = roleService.getByName("bookadmin").get(0);
			Set<Role> roles = new HashSet<Role>();
			roles.add(role);
			
			user.setRoles(roles);
			
			userService.save(user);
			return true;
		}else{
			return false;
		}
		
	}
}
