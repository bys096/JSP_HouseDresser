package bys21_house_dresser.model;

import java.util.Date;

public class ProductDTO {

//	product_number  | int(11)       | NO   | PRI | NULL      | auto_increment |
//	| category_code   | varchar(30)   | YES  | MUL | NULL      |                |
//	| seller_email    | varchar(40)   | YES  | MUL | NULL      |                |
//	| product_name    | varchar(200)  | NO   |     | NULL      |                |
//	| product_price   | int(11)       | NO   |     | NULL      |                |
//	| product_stock   | int(11)       | NO   |     | NULL      |                |
//	| product_desc    | varchar(1000) | YES  |     | NULL      |                |
//	| product_regdate | date          | YES  |     | curdate() |                |
//	| product_hits
	
	private int product_number;
	private String category_code;
	private String user_email;
	private String product_name;
	private int product_price;
	private int product_stock;
	private String prodocut_desc;
	private Date product_regdate;
	private int product_hits;
	private String gender;
	private String size;
	private String color;
	
	public ProductDTO() {
		super();
	}

	public ProductDTO(int product_number, String category_code, String user_email, String product_name,
			int product_price, int product_stock, String prodocut_desc, Date product_regdate, int product_hits) {
		super();
		this.product_number = product_number;
		this.category_code = category_code;
		this.user_email = user_email;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.prodocut_desc = prodocut_desc;
		this.product_regdate = product_regdate;
		this.product_hits = product_hits;
	}

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
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

	public String getProdocut_desc() {
		return prodocut_desc;
	}

	public void setProdocut_desc(String prodocut_desc) {
		this.prodocut_desc = prodocut_desc;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	
	
	
	
	
	
}
