package com.godrej.dao;

import java.util.List;

import com.godrej.model.Product;

public interface ProductDao {
	List<Product> search(int ch,String s);
	boolean insert(Product pdt);
	List<Product> update(int id, String s, int option);
	boolean delete(int id);
	List<Product> display();
	List<Product> getPdtList();	
}
