package com.eprabidhi.ecommerceapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eprabidhi.ecommerceapp.entity.Category;
import com.eprabidhi.ecommerceapp.repository.CategoryDao;


@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public void saveCategory(Category category) {
		// TODO Auto-generated method stub
		categoryDao.save(category);
	}

	@Override
	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		return categoryDao.findAll();
	}

	@Override
	public Category getCategoryById(int id) {
		// TODO Auto-generated method stub
		return categoryDao.findById(id).get();
	}

	@Override
	public Category getCategoryByName(String name) {
		// TODO Auto-generated method stub
		return categoryDao.findByName(name);
	}

	@Override
	public void updateCategory(Category category) {
		// TODO Auto-generated method stub
		categoryDao.save(category);
	}

	@Override
	public void deleteCategory(Category category) {
		// TODO Auto-generated method stub
		categoryDao.delete(category);
		
	}

}
