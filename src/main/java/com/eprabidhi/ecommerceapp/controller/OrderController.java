package com.eprabidhi.ecommerceapp.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eprabidhi.ecommerceapp.entity.Cart;
import com.eprabidhi.ecommerceapp.entity.OrderDetail;
import com.eprabidhi.ecommerceapp.entity.OrderProduct;
import com.eprabidhi.ecommerceapp.entity.UserDetail;
import com.eprabidhi.ecommerceapp.service.CartService;
import com.eprabidhi.ecommerceapp.service.OrderService;
import com.eprabidhi.ecommerceapp.service.UserDetailService;

@Controller
public class OrderController {
	
	@Autowired
	UserDetailService userDetailService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	OrderService orderService;

	// for cod: use url in button: /user/order/add?payment_mode=cod
	// for khalti: use url in button: /user/order/add?payment_mode=khalti
	@GetMapping("/user/order/add") // convert all user cart items to an order
	public String addOrder(Principal p, @RequestParam("payment_mode") String paymentMode) {
		UserDetail userDetail = userDetailService.getUserByUsername(p.getName());
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setModeOfPayment(paymentMode);
		orderDetail.setUserDetail(userDetail);
		orderDetail.setOrderDate(LocalDate.now());
		orderDetail.setStatus("PROCESSING");
		
		List<Cart> userCart = cartService.getUserCart(userDetail);
		ArrayList<OrderProduct> orderedProducts = new ArrayList<>();
		double amount = 0.0;
		for (Cart item : userCart) {
			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setPrdouct(item.getProduct()); // Note: Typo in method name (Prdouct), assuming it's setProduct
			orderProduct.setQuantity(item.getQuantity());
			orderProduct.setOrderDetail(orderDetail);
			orderedProducts.add(orderProduct);
			amount += (item.getProduct().getPrice() - item.getProduct().getDiscount()) * item.getQuantity();
		}
		orderDetail.setOrderedProduct(orderedProducts);
		orderDetail.setAmount(amount);
		orderService.saveOrder(orderDetail);
		cartService.deleteUserCart(userDetail); // Clear cart after order
		return "redirect:/user/order/show";
	}
	
	@GetMapping("/user/order/show")
	public String showAllOrders(Principal p, Model model) {
		UserDetail userDetail = userDetailService.getUserByUsername(p.getName());
		model.addAttribute("userOrder", orderService.getOrderByDetail(userDetail));
		return "user_order";
	}
	
	@GetMapping("/admin/order/show")
	public String showAllOrders(Model model) {
		model.addAttribute("all_order", orderService.getAllOrder());
		return "admin/all_orders";
	}
}