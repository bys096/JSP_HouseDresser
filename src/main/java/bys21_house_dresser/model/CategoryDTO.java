package bys21_house_dresser.model;

public class CategoryDTO {

	private int category_number;
	private String category_name;
	private int product_number;
	
	
	
/*
	 Gender:		
		남		M
		여		W
		공통 	Pub
	 Parts:
	 	상의	T
	 	하의	P
	 	양말	S
	 Design:
	 	포멀	F
	 	캐쥬얼	C
	 	
 	각 세부카테고리를 _ 으로 분류
 	category_code를 만족하는 옷을 찾아냄
 */
	
	public CategoryDTO() {
		super();
	}



	public CategoryDTO(int category_number, String category_name, int product_number) {
		super();
		this.category_number = category_number;
		this.category_name = category_name;
		this.product_number = product_number;
	}



	public int getCategory_number() {
		return category_number;
	}



	public void setCategory_number(int category_number) {
		this.category_number = category_number;
	}



	public String getCategory_name() {
		return category_name;
	}



	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}



	public int getProduct_number() {
		return product_number;
	}



	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	
	
	
	
	
	
	
}
