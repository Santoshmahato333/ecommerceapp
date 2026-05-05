package com.eprabidhi.ecommerceapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eprabidhi.ecommerceapp.entity.OrderDetail;
import com.eprabidhi.ecommerceapp.entity.UserDetail;

public interface OrderDao extends JpaRepository<OrderDetail, Integer> {

	public List<OrderDetail> findByUserDetail(UserDetail userDetail);
}