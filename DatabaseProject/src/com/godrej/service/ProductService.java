package com.godrej.service;
import com.godrej.model.Product;
import java.util.List;

public interface ProductService{

	void search(int ch,String s);
	void insert(Product pdt);
	void update(int id, String s, int option);
	void delete(int id);
	void display();
	List<Product> getList();
}