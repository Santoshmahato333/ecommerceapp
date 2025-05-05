package com.eprabidhi.ecommerceapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eprabidhi.ecommerceapp.entity.UserDetail;
import com.eprabidhi.ecommerceapp.repository.UserDetailDao;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDetailServiceImpl implements UserDetailService{

	
	@Autowired
	private UserDetailDao userDetailDao;
	
	@Override
	public void saveUserDetail(UserDetail userDetail) {
		// TODO Auto-generated method stub
		 userDetailDao.save(userDetail);
	}

	@Override
	public List<UserDetail> getAllUsers() {
		// TODO Auto-generated method stub
		return userDetailDao.findAll();
	}

	@Override
	public UserDetail getUserById(int id) {
		// TODO Auto-generated method stub
		return userDetailDao.findById(id).get();
	}

	@Override
	public UserDetail getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userDetailDao.findByUsername(username);
	}

	@Override
	public UserDetail getUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userDetailDao.findByEmail(email);
	}

	@Override
	public void updateUser(UserDetail userDetail) {
		// TODO Auto-generated method stub
		userDetailDao.save(userDetail);
		
	}

	@Override
	public void deleteUser(UserDetail userDetail) {
		// TODO Auto-generated method stub
		userDetailDao.delete(userDetail);
	}

}
