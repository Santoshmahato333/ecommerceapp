package com.eprabidhi.ecommerceapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eprabidhi.ecommerceapp.entity.Category;
import com.eprabidhi.ecommerceapp.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping("/admin/category/add")
	public String addCategory(Model model) {
		model.addAttribute("category_list", categoryService.getAllCategories());
		return "admin/category";
	}

	@PostMapping("/admin/category/add")
	public String saveCategory(@RequestParam String name, @RequestParam String description,
			@RequestParam("parent_cat") int parentId) {
		Category category = new Category(name, description, parentId);
		categoryService.saveCategory(category);
		// call category services to process category data
		return "redirect:/admin/category/add";
	}

	@GetMapping("/admin/category/show")
	public String showCategory(Model model) {
		List<Category> categoryList = categoryService.getAllCategories();
		model.addAttribute("category_list", categoryList);
		model.addAttribute("coll", List.of(1, 2, 3, 4, 5));
		return "admin/category";
	}

	@GetMapping("/admin/category/edit/{id}")
	public String editCategory(@PathVariable("id") int id, Model model) {
		Category editCat = categoryService.getCategoryById(id);
		model.addAttribute("edit_cat", editCat);
		model.addAttribute("edit", true);
		model.addAttribute("category_list", categoryService.getAllCategories());

		return "admin/category";
	}

	@PostMapping("/admin/category/update")
	public String updateCategory(@ModelAttribute("category") Category category) {
		categoryService.updateCategory(category);
		return "redirect:/admin/category/show";
	}

	@GetMapping("/admin/category/delete/{id}")
	public String deleteCategories(@PathVariable int id) {
		Category category = categoryService.getCategoryById(id);
		if (category != null) {
			categoryService.deleteCategory(category);
		}
		return "redirect:/admin/category/show?delete_success=true";
	}

}
