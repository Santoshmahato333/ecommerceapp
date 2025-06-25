package com.eprabidhi.ecommerceapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eprabidhi.ecommerceapp.entity.Cart;
import com.eprabidhi.ecommerceapp.entity.UserDetail;
import com.eprabidhi.ecommerceapp.repository.CartDao;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    @Override
    public void saveCart(Cart cart) {
        cartDao.save(cart);
    }

    @Override
    public List<Cart> getUserCart(UserDetail userDetail) {
        return cartDao.findByUserDetail(userDetail);
    }

    @Override
    public void updateCart(Cart cart) {
        cartDao.save(cart);
    }

    @Override
    public void deleteCart(Cart cart) {
        cartDao.delete(cart);
    }

    @Override
    public void deleteUserCart(UserDetail userDetail) {
        cartDao.findByUserDetail(userDetail);
    }

    @Override
    public Cart getCartById(int cid) {
        return cartDao.findById(cid).orElse(null);
    }
}
