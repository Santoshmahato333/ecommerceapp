package com.eprabidhi.ecommerceapp.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="Order_tbl")

public class OrderDetail implements Serializable {
	
	private static final long serialVersionUID=1L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="order_id")
	private int id;
	
	@OneToMany(mappedBy="orderDetail", cascade=jakarta.persistence.CascadeType.ALL)
	private List<OrderProduct> orderedProducts;
	
	private LocalDate orderDate;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private UserDetail userDetail;
	
	private String  status;
	
	private double amount;
	
	private String modeOfPayment;
	
	
	
	

	public OrderDetail() {
		super();
	}

	public OrderDetail(int id, List<OrderProduct> orderedProducts, LocalDate orderDate, UserDetail userDetail,
			String status, double amount, String modeOfPayment) {
		super();
		this.id = id;
		this.orderedProducts = orderedProducts;
		this.orderDate = orderDate;
		this.userDetail = userDetail;
		this.status = status;
		this.amount = amount;
		this.modeOfPayment = modeOfPayment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<OrderProduct> getOrderedProducts() {
		return orderedProducts;
	}

	public void setOrderedProducts(List<OrderProduct> orderedProducts) {
		this.orderedProducts = orderedProducts;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	
	
	

}
