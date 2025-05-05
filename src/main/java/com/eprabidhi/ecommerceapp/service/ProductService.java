package com.eprabidhi.ecommerceapp.service;

import java.util.List;

import com.eprabidhi.ecommerceapp.entity.Product;

public interface ProductService {
	public void saveProduct(Product product);
	
	public List<Product> getAllProducts();
	
	public Product getProductById(int id);
	
	public Product getProductByName(String name);
	
	public List<Product> getProductByQuantity(int quantity);
	
	public List<Product> getProductByPrice(double price);
	
	public void updateProduct(Product product);
	
	public void deleteProduct(Product product);
}
