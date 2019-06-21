package com.godrej.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import com.godrej.dao.ProductDao;
import com.godrej.daoimpl.ProductDaoImpl;
import com.godrej.model.Product;
import com.godrej.service.ProductService;

public class ProductServiceImpl implements ProductService {
	ProductDao productDao = new ProductDaoImpl();
	private List<Product> tempList= new ArrayList<Product>();

	@Override
	public void search(int ch,String s) {
		tempList = productDao.search(ch,s);
		intDisplay();
	}

	@Override
	public void insert(Product pdt) {
		boolean a = productDao.insert(pdt);
		if(a == true)
			System.out.println("Entry Successful");
		else
			System.out.println("Entry UnSucessful");
	}
	@Override
	public void update(int id, String s, int option) {
		productDao.update(id,s,option);
//		intDisplay();
	}
	@Override
	public void delete(int id) {
		boolean a = productDao.delete(id);
		if(a == true)
			System.out.println("Delete Successful");
		else
			System.out.println("Delete UnSucessful");
	}
	@Override
	public void display() {
//		if(pdtList.isEmpty())
//			System.out.print("No Rows found\n");
//		else
//		{
//			System.out.println("\nID \t Name \t Category \t Price");
//			for(Product i:pdtList)
//				displaySingle(i);
//		}
//		tempList = productDao.display();
//		intDisplay();
	}
	public void intDisplay() {
		if(tempList.isEmpty())
			System.out.print("No Rows found\n");
		else
		{
			System.out.println("Rows found");
			System.out.println("\nID \t Name \t Category \t Price");
			for(Product i:tempList)
				System.out.print(i.getProduct_Id()+"\t"+i.getProduct_Name()+"\t"+i.getProduct_Cat()+"\t"+i.getProduct_Price());
		}
	}


	@Override
	public List<Product> getList() {
		return productDao.getPdtList();
	}

}
