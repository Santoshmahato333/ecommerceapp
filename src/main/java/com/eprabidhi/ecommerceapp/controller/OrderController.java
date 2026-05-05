package com.eprabidhi.ecommerceapp.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eprabidhi.ecommerceapp.entity.Cart;
import com.eprabidhi.ecommerceapp.entity.OrderDetail;
import com.eprabidhi.ecommerceapp.entity.OrderProduct;
import com.eprabidhi.ecommerceapp.entity.Product;
import com.eprabidhi.ecommerceapp.entity.UserDetail;
import com.eprabidhi.ecommerceapp.service.CartService;
import com.eprabidhi.ecommerceapp.service.OrderService;
import com.eprabidhi.ecommerceapp.service.ProductService;
import com.eprabidhi.ecommerceapp.service.UserDetailService;

@Controller
public class OrderController {
	
    @Autowired
    private UserDetailService userDetailService;
	
    @Autowired
    private CartService cartService;
	
    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @GetMapping("/user/order/checkout")
    public String checkoutPage(Principal p, Model model) {
        if (p == null) {
            return "redirect:/login";
        }
        UserDetail userDetail = userDetailService.getUserByUsername(p.getName());
        List<Cart> userCart = cartService.getUserCart(userDetail);
        double total = 0.0;
        for (Cart item : userCart) {
            total += (item.getProduct().getPrice() - item.getProduct().getDiscount()) * item.getQuantity();
        }
        model.addAttribute("cart_list", userCart);
        model.addAttribute("order_total", total);
        return "checkout";
    }

    // for COD: /user/order/add?payment_mode=cod
    // for Khalti: /user/order/add?payment_mode=khalti
    @PostMapping("/user/order/add") 
    public String addOrder(Principal p, @RequestParam("payment_mode") String paymentMode) {
        if (p == null) {
            return "redirect:/login"; // safeguard against null principal
        }

        UserDetail userDetail = userDetailService.getUserByUsername(p.getName());

        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setModeOfPayment(paymentMode);
        orderDetail.setUserDetail(userDetail);
        orderDetail.setOrderDate(LocalDate.now());
        orderDetail.setStatus("PROCESSING");
		
        List<Cart> userCart = cartService.getUserCart(userDetail);
        List<OrderProduct> orderedProducts = new ArrayList<>();
        double amount = 0.0;	

        for (Cart item : userCart) {
            Product product = item.getProduct();
            if (product.getQuantity() < item.getQuantity()) {
                return "redirect:/user/cart/show?stock=limit";
            }

            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setProduct(product);
            orderProduct.setQuantity(item.getQuantity());
            orderProduct.setOrderDetail(orderDetail);
            orderedProducts.add(orderProduct);

            amount += (product.getPrice() - product.getDiscount()) 
                      * item.getQuantity();

		    product.setQuantity(product.getQuantity() - item.getQuantity());
		    productService.updateProduct(product);
        }

        orderDetail.setOrderedProducts(orderedProducts);
        orderDetail.setAmount(amount);

        orderService.saveOrder(orderDetail);

        // Clear cart after order
        cartService.deleteUserCart(userDetail); 
		
        return "redirect:/user/order/show";
    }
	
    @GetMapping("/user/order/show")
    public String showAllOrders(Principal p, Model model) {
        if (p == null) {
            return "redirect:/login";
        }

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
