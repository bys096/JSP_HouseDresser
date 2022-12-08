package bys21_house_dresser.model;

public class ImageDTO {

	private int i_number;
	private int product_number;
	private String i_thumbnail_name;
	private String i_original_name;
	private String i_file_name;
	private String i_file_type;
	private long i_file_size;
	
	public ImageDTO() {
		super();
	}

	public ImageDTO(int i_number, int product_number, String i_thumbnail_name, String i_original_name,
			String i_file_name, String i_file_type, long i_file_size) {
		super();
		this.i_number = i_number;
		this.product_number = product_number;
		this.i_thumbnail_name = i_thumbnail_name;
		this.i_original_name = i_original_name;
		this.i_file_name = i_file_name;
		this.i_file_type = i_file_type;
		this.i_file_size = i_file_size;
	}

	public int getI_number() {
		return i_number;
	}

	public void setI_number(int i_number) {
		this.i_number = i_number;
	}

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public String getI_thumbnail_name() {
		return i_thumbnail_name;
	}

	public void setI_thumbnail_name(String i_thumbnail_name) {
		this.i_thumbnail_name = i_thumbnail_name;
	}

	public String getI_original_name() {
		return i_original_name;
	}

	public void setI_original_name(String i_original_name) {
		this.i_original_name = i_original_name;
	}

	public String getI_file_name() {
		return i_file_name;
	}

	public void setI_file_name(String i_file_name) {
		this.i_file_name = i_file_name;
	}

	public String getI_file_type() {
		return i_file_type;
	}

	public void setI_file_type(String i_file_type) {
		this.i_file_type = i_file_type;
	}

	public long getI_file_size() {
		return i_file_size;
	}

	public void setI_file_size(long i_file_size) {
		this.i_file_size = i_file_size;
	}
	
	
}
