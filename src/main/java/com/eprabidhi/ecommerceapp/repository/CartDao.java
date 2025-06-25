package com.eprabidhi.ecommerceapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eprabidhi.ecommerceapp.entity.Cart;
import com.eprabidhi.ecommerceapp.entity.UserDetail;

public interface CartDao extends JpaRepository<Cart,Integer> {
	public List<Cart> findByUserDetail(UserDetail userDetial);
	
}
