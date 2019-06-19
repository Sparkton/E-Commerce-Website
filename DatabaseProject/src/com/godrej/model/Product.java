package com.godrej.model;
public class Product
{
	private int productId;
	private String productName;
	private String productCat;
	private int productPrice;

	public int getProduct_Id() {
		return productId;
	}
	public void setProduct_Id(int product_Id) {
		productId = product_Id;
	}
	public String getProduct_Name() {
		return productName;
	}
	public void setProduct_Name(String product_Name) {
		productName = product_Name;
	}
	public String getProduct_Cat() {
		return productCat;
	}
	public void setProduct_Cat(String product_Cat) {
		productCat = product_Cat;
	}
	public int getProduct_Price() {
		return productPrice;
	}
	public void setProduct_Price(int product_Price) {
		productPrice = product_Price;
	}
}