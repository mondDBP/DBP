package model;

public class Category {
	private String category_name;	//CATEGORY_NAME

	public Category() {}
	public Category(String category_name) {
		super();
		this.category_name = category_name;
	}
	@Override
	public String toString() {
		return "Category [category_name=" + category_name + "]";
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
}
