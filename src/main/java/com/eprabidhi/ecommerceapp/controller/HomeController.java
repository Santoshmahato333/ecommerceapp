package com.eprabidhi.ecommerceapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.eprabidhi.ecommerceapp.entity.UserDetail;
import com.eprabidhi.ecommerceapp.entity.UserRole;
import com.eprabidhi.ecommerceapp.entity.Product;
import com.eprabidhi.ecommerceapp.service.ProductService;
import com.eprabidhi.ecommerceapp.service.UserDetailService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserDetailService userDetailService;

    @GetMapping({"/home", "/"})
    public String openHome() {
    	System.out.println(passwordEncoder.encode("12345"));
        return "index";  // maps to index.jsp
    }

    @GetMapping("/about")
    public String openAbout() {
        return "about";  // maps to about.jsp
    }

    @GetMapping("/contact")
    public String openContact() {
 
        return "contact";  // maps to contact.jsp
    }

    @GetMapping("/product")
	public String openProduct(Model model) {
		model.addAttribute("popular_products", productService.getAllProducts());
        return "product";  // maps to product.jsp
    }
    @GetMapping("/shop")
    public String openShop(Model model) {
		model.addAttribute("popular_products",productService.getAllProducts());
		return "shop";  // maps to shop.jsp
    } 

	@GetMapping("/product_detail/{id}")
	public String openProductDetail(@org.springframework.web.bind.annotation.PathVariable int id, Model model) {
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		model.addAttribute("related_products", productService.getAllProducts().stream()
				.filter(p -> p.getCategory() != null && product.getCategory() != null
						&& p.getCategory().getId() == product.getCategory().getId()
						&& p.getId() != product.getId())
				.limit(4)
				.toList());
		return "product-detail";
	}

    @GetMapping("/register")
    public String openRegister() {
        return "register";  // maps to product.jsp
    }
    
    @GetMapping("/welcome")
    public String welcomeUser( Authentication auth) {
    	String role= auth.getAuthorities().toString();
    	System.out.println(role);
    	if(auth.isAuthenticated()) {
    		if(role.contains("ADMIN")) {
    			return "redirect:/admin/home";
    		}else if(role.contains("USER")) {
    			return "redirect:/user/profile";
    		}
    	}
    	
    	return "index";
    }

    
    @PostMapping("/register")
    public String registerUser(@ModelAttribute UserDetail userDetail) {
    	
    	if(!userDetail.getPassword().equals(userDetail.getCpassword())) {
    		return "redirct:/register?password_mismatch=true";
    	}
        userDetail.setPassword(passwordEncoder.encode(userDetail.getPassword()));
    	
    	
    	UserRole userRole=new UserRole();
    	if(userDetail.getAuthority().equals("ADMIN")) {
    		userDetail.setActive("0");
    		userRole.setRole("ROLE_ADMIN");
    	}else {
    		userDetail.setActive("0");
    		userRole.setRole("ROLE_USER");
    	}
    	userRole.setUserDetail(userDetail);
    	userDetail.setUserRole(userRole);
    	//send userDetail objedt to save its content to database table
    	userDetailService.saveUserDetail(userDetail);
    	return"redirect:/login";
    }
}
