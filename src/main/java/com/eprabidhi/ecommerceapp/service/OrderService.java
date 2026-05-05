package com.eprabidhi.ecommerceapp.service;

import java.util.List;

import com.eprabidhi.ecommerceapp.entity.OrderDetail;
import com.eprabidhi.ecommerceapp.entity.UserDetail;

public interface OrderService {
	public void saveOrder(OrderDetail orderDetail);

	public List<OrderDetail> getOrderByDetail(UserDetail userDetail);

	public List<OrderDetail> getAllOrder();
}