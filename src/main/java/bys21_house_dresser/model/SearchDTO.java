package bys21_house_dresser.model;


import java.sql.Date;

public class SearchDTO {

	private int product_number;
	private String user_email;
	private String product_name;
	private int product_price;
	private int product_stock;
	private Date product_regdate;
	private int product_hits;
	private String brand_name;
	private int i_number;
	private String i_thumbnail_name;
	private String i_file_name;
	private String product_desc;
	private String product_gender;
	private int quantity;
	
	public SearchDTO() {
		super();
	}


	public SearchDTO(int product_number, String user_email, String product_name, int product_price, int product_stock,
			Date product_regdate, int product_hits, String brand_name, int i_number, String i_thumbnail_name,
			String i_file_name, String product_desc) {
		super();
		this.product_number = product_number;
		this.user_email = user_email;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_regdate = product_regdate;
		this.product_hits = product_hits;
		this.brand_name = brand_name;
		this.i_number = i_number;
		this.i_thumbnail_name = i_thumbnail_name;
		this.i_file_name = i_file_name;
		this.product_desc = product_desc;
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


	public int getProduct_stock() {
		return product_stock;
	}


	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}


	public Date getProduct_regdate() {
		return product_regdate;
	}


	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}


	public int getProduct_hits() {
		return product_hits;
	}


	public void setProduct_hits(int product_hits) {
		this.product_hits = product_hits;
	}


	public String getBrand_name() {
		return brand_name;
	}


	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}


	public int getI_number() {
		return i_number;
	}


	public void setI_number(int i_number) {
		this.i_number = i_number;
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


	public String getProduct_desc() {
		return product_desc;
	}


	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}


	public String getProduct_gender() {
		return product_gender;
	}


	public void setProduct_gender(String product_gender) {
		this.product_gender = product_gender;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
	
	
	
	
	
}
