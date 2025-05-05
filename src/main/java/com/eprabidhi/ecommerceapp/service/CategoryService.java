package com.eprabidhi.ecommerceapp.service;



import java.util.List;

import com.eprabidhi.ecommerceapp.entity.Category;


public interface CategoryService {
	public void saveCategory(Category category);
	public List<Category> getAllCategories();
	public Category getCategoryById(int id);
	public Category getCategoryByName(String name);
	public void updateCategory(Category category);
	public void deleteCategory(Category category);

}
