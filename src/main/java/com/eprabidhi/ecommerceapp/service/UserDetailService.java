package com.eprabidhi.ecommerceapp.service;

import java.util.List;

import com.eprabidhi.ecommerceapp.entity.UserDetail;

public interface UserDetailService {
	public void saveUserDetail(UserDetail userDetail);
	public List<UserDetail> getAllUsers();
	public UserDetail getUserById(int id);
	public UserDetail getUserByUsername(String username);
	public UserDetail getUserByEmail(String email);
	public void updateUser(UserDetail userDetail);
	public void deleteUser(UserDetail userDetail);
}
