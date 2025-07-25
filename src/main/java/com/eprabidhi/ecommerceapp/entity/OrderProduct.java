package com.eprabidhi.ecommerceapp.entity;

import java.io.Serializable;

import org.springframework.data.annotation.Id;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name="order_product_tbl")
public class OrderProduct  implements Serializable{
	private static final long serialVersionUID=1L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="order_product_id")
	private int id;
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="product_id")
	private Product product;
	private int quantity;
	@ManyToOne
	@JoinColumn(name="order_id")
	private OrderDetail orderDetail;
	
	
	
	public OrderProduct() {
		super();
	}



	public OrderProduct(int id, Product product, int quantity, OrderDetail orderDetail) {
		super();
		this.id = id;
		this.product = product;
		this.quantity = quantity;
		this.orderDetail = orderDetail;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public OrderDetail getOrderDetail() {
		return orderDetail;
	}



	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	

	
}
