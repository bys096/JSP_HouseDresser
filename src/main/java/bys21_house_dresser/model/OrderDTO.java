package bys21_house_dresser.model;

import java.util.Date;

public class OrderDTO {
	private int order_number;
	private String delivery_status;
	private int product_number;
	private String user_email;
	private int quantity;
	private int i_number;
	private Date order_date;
	

	private String product_name;
	private int product_price;
	private String brand_name;
	private String i_thumbnail_name;
	private String i_file_name;
	private String user_name;
	private String user_zip;
	private String user_address1;
	private String user_address2;
	
	
	
	
	public OrderDTO() {
		super();
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getI_number() {
		return i_number;
	}
	public void setI_number(int i_number) {
		this.i_number = i_number;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getI_thumbnail_name() {
		return i_thumbnail_name;
	}
	public void setI_thumbnail_name(String i_thumbnail_name) {
		this.i_thumbnail_name = i_thumbnail_name;
	}
	public String getI_file_name() {
		return i_file_name;
	}
	public void setI_file_name(String i_file_name) {
		this.i_file_name = i_file_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_zip() {
		return user_zip;
	}
	public void setUser_zip(String user_zip) {
		this.user_zip = user_zip;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	
	
	
	
	
	
	
}
