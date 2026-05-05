package com.eprabidhi.ecommerceapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.eprabidhi.ecommerceapp.entity.OrderDetail;
import com.eprabidhi.ecommerceapp.entity.UserDetail;
import com.eprabidhi.ecommerceapp.repository.OrderDao;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	private final OrderDao orderDao;

	public OrderServiceImpl(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public void saveOrder(OrderDetail orderDetail) {
		orderDao.save(orderDetail);
	}

	@Override
	public List<OrderDetail> getOrderByDetail(UserDetail userDetail) {
		return orderDao.findByUserDetail(userDetail);
	}

	@Override
	public List<OrderDetail> getAllOrder() {
		return orderDao.findAll();
	}
}