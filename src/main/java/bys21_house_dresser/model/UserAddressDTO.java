package bys21_house_dresser.model;

public class UserAddressDTO {

	private String user_email;
	private String user_zip;
	private String user_address1;
	private String user_address2;
	
	public UserAddressDTO() {
		super();
	}

	public UserAddressDTO(String user_email, String user_zip, String user_address1, String user_address2) {
		super();
		this.user_email = user_email;
		this.user_zip = user_zip;
		this.user_address1 = user_address1;
		this.user_address2 = user_address2;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
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

	@Override
	public String toString() {
		return "UserAddressDTO [user_email=" + user_email + ", user_zip=" + user_zip + ", user_address1="
				+ user_address1 + ", user_address2=" + user_address2 + "]";
	}
	
	
	
}
