package bys21_house_dresser.model;

import java.sql.Date;

public class UserDTO {

	private String user_email;
	private String user_pwd;
	private String user_name;
	private String user_phone;
	private String email_check = "n";
	private Date user_regdate;
	private String user_class;
	private String user_zip;
	private String user_address1;
	private String user_address2;
	private String brand_name;
	
	public UserDTO() {
		super();
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getEmail_check() {
		return email_check;
	}

	public void setEmail_check(String email_check) {
		this.email_check = email_check;
	}

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	public String getUser_class() {
		return user_class;
	}

	public void setUser_class(String user_class) {
		this.user_class = user_class;
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

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	@Override
	public String toString() {
		return "UserDTO [user_email=" + user_email + ", user_pwd=" + user_pwd + ", user_name=" + user_name
				+ ", user_phone=" + user_phone + ", email_check=" + email_check + ", user_regdate=" + user_regdate
				+ ", user_class=" + user_class + ", brand_name=" + brand_name + "]";
	}
	
	
	
	
	
	
}
