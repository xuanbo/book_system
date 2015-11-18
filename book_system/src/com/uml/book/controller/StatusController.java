package com.uml.book.controller;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uml.book.entity.Status;
import com.uml.book.service.StatusService;

@Controller
public class StatusController {
	
	@Autowired
	@Qualifier("statusService")
	private StatusService statusService;
	
	@RequestMapping(value="/admin/status/list", method = RequestMethod.GET)
	public ModelAndView statusList(){
		ModelAndView model = new ModelAndView();
		model.addObject("statusList", statusService.getAll());
		model.setViewName("admin/statusList");
		return model;
	}
	
	@RequestMapping(value="/admin/status/update", method = RequestMethod.POST)
	public @ResponseBody boolean statusUpdate(@RequestBody JSONObject json){
		//修改的借阅证身份改变了
		if(json.getBoolean("flag")){
			//改变的不存在才能修改
			if(statusService.getByName(json.getString("name")).isEmpty()){
				Status status = new Status();
				status.setId(Integer.parseInt(json.getString("id")));
				status.setName(json.getString("name"));
				status.setBorrowBookTime(json.getString("borrowBookTime"));
				status.setBorrowNumber(Integer.parseInt(json.getString("borrowNumber")));
				status.setOrderNumber(Integer.parseInt(json.getString("orderNumber")));
				statusService.update(status);
				return true;
			}else{
				return false;
			}
		}else{
			//修改的借阅证身份未改变，那么可以修改
			Status status = new Status();
			status.setId(Integer.parseInt(json.getString("id")));
			status.setName(json.getString("name"));
			status.setBorrowBookTime(json.getString("borrowBookTime"));
			status.setBorrowNumber(Integer.parseInt(json.getString("borrowNumber")));
			status.setOrderNumber(Integer.parseInt(json.getString("orderNumber")));
			statusService.update(status);
			return true;
		}
		
		
	}
	
	@RequestMapping(value="admin/status/add",method = RequestMethod.GET)
	public String statusAdd(){
		return "admin/statusAdd";
	}
	
	@RequestMapping(value="admin/status/add",method = RequestMethod.POST)
	public @ResponseBody boolean statusAddPost(@RequestBody JSONObject json){
		if(statusService.getByName(json.getString("name")).isEmpty()){
			Status status = new Status();
			status.setName(json.getString("name"));
			status.setBorrowBookTime(json.getString("borrowBookTime"));
			status.setBorrowNumber(Integer.parseInt(json.getString("borrowNumber")));
			status.setOrderNumber(Integer.parseInt(json.getString("orderNumber")));
			statusService.save(status);
			return true;
		}else{
			return false;
		}
	}
	
}
