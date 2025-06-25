package com.eprabidhi.ecommerceapp.controller;

import java.security.Principal;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eprabidhi.ecommerceapp.entity.Cart;
import com.eprabidhi.ecommerceapp.entity.UserDetail;
import com.eprabidhi.ecommerceapp.service.CartService;
import com.eprabidhi.ecommerceapp.service.ProductService;
import com.eprabidhi.ecommerceapp.service.UserDetailService;



@Controller
public class CartController {

    @Autowired
    private CartService cartService;
    
    @Autowired
    private ProductService productService;
    @Autowired
    private UserDetailService userDetailService;



    @GetMapping("/user/cart/add/{pid}")
    public String saveCart(@PathVariable int pid, Principal p) {
    	Cart cart=new Cart();
    	cart.setAddedDate(LocalDate.now());
    	cart.setQuantity(1);
    	cart.setProduct(productService.getProductById(pid));
    	cart.setUserDetail(userDetailService.getUserByUsername(p.getName()));
    	cartService.saveCart(cart);
       return "redirect:/user/cart/show";
    }

    
    @GetMapping("/user/cart/show")
    public String showCart(Model model, Principal p) {
    	UserDetail userDetail= userDetailService.getUserByUsername(p.getName());
    	model.addAttribute("cart_list",cartService.getUserCart(userDetail));
        return "cart";
    }

    @PostMapping("/user/cart/update/{cid}")
    public String updateCart(@PathVariable int cid,@RequestParam("quantity") int quantity) {
    	Cart cart=cartService.getCartById(cid);
        cart.setQuantity(quantity);
        cartService.updateCart(cart);
        return "redirect:/user/cart/show";
    }
    
    @GetMapping("/user/cart/delete/{cid}")
    public String deleteCart(@PathVariable int cid) {
    	Cart cart =cartService.getCartById(cid);
    	if(cart!=null) {
    		cartService.deleteCart(cart);
    	}
    	return "redirect:/user/cart/show?delete_success=true";
    }
//
//    // Clear entire cart
//    @GetMapping("/user/cart/clear")
//    public String clearUserCart() {
//        cartService.deleteUserCart(getCurrentUser());
//        return "redirect:/user/cart";
//    }
}
