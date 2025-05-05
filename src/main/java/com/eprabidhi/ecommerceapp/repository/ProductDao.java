package com.eprabidhi.ecommerceapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eprabidhi.ecommerceapp.entity.Product;

public interface ProductDao  extends JpaRepository<Product,Integer>{
	public Product findByName(String name);
	
	public List<Product> findByPriceBetween(double priceA, double priceB);
	
	public List<Product> findByPriceLessThanEqual(double price);
	
	public List<Product> findByPriceGreaterThanEqual(double price);
	
	public List<Product> findByQuantity(int quantity);
	
	public List<Product> findByQuantityLessThanEqual(int quantity);
	
	public List<Product> findByQuantityGreaterThanEqual(int quantity);
	

}
