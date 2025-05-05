package com.eprabidhi.ecommerceapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eprabidhi.ecommerceapp.entity.Category;

@Repository
public interface CategoryDao extends JpaRepository <Category,Integer> {
	
	public Category findByName(String name);

}
