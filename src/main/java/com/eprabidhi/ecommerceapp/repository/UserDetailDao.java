package com.eprabidhi.ecommerceapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eprabidhi.ecommerceapp.entity.UserDetail;

public interface UserDetailDao extends JpaRepository <UserDetail,Integer>{
	public UserDetail findByUsername(String username);
	public  UserDetail findByEmail(String email);

}
