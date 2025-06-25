package com.eprabidhi.ecommerceapp.service;

import java.util.List;

import com.eprabidhi.ecommerceapp.entity.Cart;
import com.eprabidhi.ecommerceapp.entity.UserDetail;

public interface CartService {
	public void saveCart(Cart cart);
	
	public List<Cart> getUserCart(UserDetail userDetail);
	public void updateCart(Cart cart);
	
	public void deleteCart(Cart cart);
	public void deleteUserCart(UserDetail userDetail);

	public Cart getCartById(int cid);

	
}
