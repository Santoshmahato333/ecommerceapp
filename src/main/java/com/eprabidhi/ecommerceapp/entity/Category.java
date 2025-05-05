package com.eprabidhi.ecommerceapp.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
@Entity //hivernate generate
@Table(name="category_tbl")
public class Category implements Serializable{
	private static final long serialVersionUID=1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="category_id")
	private int id;
	@Column(unique=true)
	private String name;
	private String description;
	private int parentCat;
	
	 
    @OneToMany(mappedBy="category")
    private List<Product> productList;
	
	public Category() {
		
	}
	
	
	public Category(String name, String description, int parentCat) {
		super();
		this.name = name;
		this.description = description;
		this.parentCat = parentCat;
	}


	public Category(int id, String name, String description, int parentCat, List<Product> productList) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.parentCat = parentCat;
		this.productList=productList;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getParentCat() {
		return parentCat;
	}
	public void setParentCat(int parentCat) {
		this.parentCat = parentCat;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	

	
	

}
