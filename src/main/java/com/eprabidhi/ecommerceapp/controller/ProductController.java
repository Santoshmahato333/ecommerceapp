package com.eprabidhi.ecommerceapp.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.eprabidhi.ecommerceapp.entity.Product;
import com.eprabidhi.ecommerceapp.service.CategoryService;
import com.eprabidhi.ecommerceapp.service.ProductService;
import com.eprabidhi.ecommerceapp.service.UploadService;

@Controller
public class ProductController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UploadService uploadService;
    
    @Autowired
    private ProductService productService;

    @GetMapping("/admin/product/add")
    public String addProduct(Model model) {
        model.addAttribute("category_list", categoryService.getAllCategories());
        return "admin/product";
    }
    
    @PostMapping("/admin/product/save")
    public String saveProduct(@ModelAttribute Product product) {
        product.setImageName(product.getImage().getOriginalFilename());
        product.setAddedDate(LocalDate.now());
        
        if (uploadService.uploadProductImage(product.getImage())) {
            productService.saveProduct(product);
            return "redirect:/admin/product/add?save=success";
        }
        return "redirect:/admin/product/add?save=failure";
    }

    @GetMapping("/admin/product/show")
    public String showProduct(Model model) {
        model.addAttribute("category_list", categoryService.getAllCategories());
        model.addAttribute("product_list", productService.getAllProducts());
        return "admin/product";
    }
    @GetMapping("/admin/product/edit/{id}")
    	public String editProduct(@PathVariable("id") int id, Model model) {
    	Product editProduct=productService.getProductById(id);
    	model.addAttribute("edit_product",editProduct);
    	model.addAttribute("edit",true);
    	  model.addAttribute("category_list", categoryService.getAllCategories());
          model.addAttribute("product_list", productService.getAllProducts());
    	return "admin/product";
    }
    @PostMapping("/admin/product/update")
    public String updateProduct(@ModelAttribute Product product) {
    	productService.updateProduct(product);
    	return "redirect:/admin/category/show";
    	
    }
    @GetMapping("/admin/product/delete/{id}")
    public String deleteProduct(@PathVariable int id) {
    	Product product =productService.getProductById(id);
    	if(product!=null) {
    		productService.deleteProduct(product);
    	}
    	return "redirect:/admin/product/show?delete_success=true";
    }
}
