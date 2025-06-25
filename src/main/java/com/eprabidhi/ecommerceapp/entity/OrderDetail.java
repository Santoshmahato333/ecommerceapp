package com.eprabidhi.ecommerceapp.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.annotation.Id;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
	
	@OneToMany(mappedBy="orderDetail")
	private List<OrderProduct> orderProduct;
	
	private LocalDate orderDate;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private UserDetail userDetail;
	
	private String  status;
	
	private String amount;
	
	private String modeOfPayment;
	
	
	
	

	public OrderDetail() {
		super();
	}

	public OrderDetail(int id, List<OrderProduct> orderProduct, LocalDate orderDate, UserDetail userDetail,
			String status, String amount, String modeOfPayment) {
		super();
		this.id = id;
		this.orderProduct = orderProduct;
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

	public List<OrderProduct> getOrderProduct() {
		return orderProduct;
	}

	public void setOrderProduct(List<OrderProduct> orderProduct) {
		this.orderProduct = orderProduct;
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

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	
	
	

}
