package com.eprabidhi.ecommerceapp.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eprabidhi.ecommerceapp.entity.Cart;
import com.eprabidhi.ecommerceapp.entity.Product;
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
        if (p == null) {
            return "redirect:/login";
        }
        UserDetail userDetail = userDetailService.getUserByUsername(p.getName());
        Product product = productService.getProductById(pid);
        if (product == null || product.getQuantity() <= 0) {
            return "redirect:/shop?stock=unavailable";
        }

        List<Cart> existingCart = cartService.getUserCart(userDetail);
        for (Cart cartItem : existingCart) {
            if (cartItem.getProduct().getId() == pid) {
                int updatedQuantity = cartItem.getQuantity() + 1;
                if (updatedQuantity > product.getQuantity()) {
                    return "redirect:/shop?stock=limit";
                }
                cartItem.setQuantity(updatedQuantity);
                cartService.updateCart(cartItem);
                return "redirect:/user/cart/show";
            }
        }

        Cart cart = new Cart();
        cart.setAddedDate(LocalDate.now());
        cart.setQuantity(1);
        cart.setProduct(product);
        cart.setUserDetail(userDetail);
        cartService.saveCart(cart);
       return "redirect:/user/cart/show";
    }

    
    @GetMapping("/user/cart/show")
    public String showCart(Model model, Principal p) {
	    if (p == null) {
	        return "redirect:/login";
	    }

    	UserDetail userDetail= userDetailService.getUserByUsername(p.getName());
    	model.addAttribute("cart_list",cartService.getUserCart(userDetail));
        return "cart";
    }

    @PostMapping("/user/cart/update/{cid}")
    public String updateCart(@PathVariable int cid,@RequestParam("quantity") int quantity) {
    	Cart cart=cartService.getCartById(cid);
	    if (cart != null && quantity > cart.getProduct().getQuantity()) {
	        return "redirect:/user/cart/show?stock=limit";
	    }
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
