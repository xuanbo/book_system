package com.uml.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uml.book.dao.StatusDao;
import com.uml.book.entity.Status;
import com.uml.book.service.StatusService;

@Service("statusService")
public class StatusServiceImpl implements StatusService {

	@Autowired
	@Qualifier("statusDao")
	private StatusDao statusDao;
	
	@Override
	public List<Status> getAll() {
		return statusDao.getAll();
	}

	@Override
	public void update(Status status) {
		Status newstatus = statusDao.get(status.getId());
		newstatus.setName(status.getName());
		newstatus.setBorrowBookTime(status.getBorrowBookTime());
		newstatus.setBorrowNumber(status.getBorrowNumber());
		newstatus.setOrderNumber(status.getOrderNumber());
	}

	@Override
	public void save(Status status) {
		statusDao.save(status);
	}

	@Override
	public List<Status> getByName(String name) {
		return statusDao.getByName(name);
	}

}
