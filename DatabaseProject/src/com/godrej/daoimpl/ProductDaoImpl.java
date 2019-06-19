package com.godrej.daoimpl;

import java.util.ArrayList;
import java.util.List;

import com.godrej.dao.ProductDao;
import com.godrej.model.Product;

public class ProductDaoImpl implements ProductDao{
	
	private static List<Product> pdtList = new ArrayList<Product>();
	private List<Product> tempList = new ArrayList<Product>();
	static int ctr=0;
	
	public List<Product> getPdtList() {
		return pdtList;
	}
	@Override
	public List<Product> search(int ch, String s) {
		tempList.clear();
		if(pdtList.isEmpty())
			System.out.println("\nList Empty");
		else {
			int ctr=0;
			switch (ch) {
			case 1:
				for(Product product:pdtList)
					if(product.getProduct_Name().contains(s)) {
						tempList.add(product);
						ctr=1;
					}
				break;
			case 2:
				for(Product product:pdtList)
					if(product.getProduct_Cat()==s) {
						tempList.add(product);
						ctr=1;
					}
				break;
			case 3:
				for(Product product:pdtList)
					if(product.getProduct_Price()==Integer.parseInt(s)) {
						tempList.add(product);
						ctr=1;
					}
				break;
			default: System.out.println("\nNot Found");
			}
			if(ctr==0)
				System.out.println("\nNo record found");
			else
				return tempList;
		}

		return null;
	}
	@Override
	public boolean insert(Product product) {
		if(!pdtList.isEmpty())
			for(Product i:pdtList) {
				if(i.getProduct_Name().equals(product.getProduct_Name())) { 
					System.out.println("\nNot Valid");
					return false;
				}
				else {
					System.out.println("Entry Successful in Dao");
					ctr+=1;
					product.setProduct_Id(ctr);
					pdtList.add(product);	
					return true;
				}
			}
			else {
				ctr+=1;
				product.setProduct_Id(ctr);
				pdtList.add(product);	
				return true;
			}
		return false;
	}
	@Override
	public List<Product> update(int id, String s, int option) {
		tempList.clear();
		for(Product product :pdtList) {
			if(product.getProduct_Id()==id) {
				switch(option)
				{
				case 1:
					product.setProduct_Name(s);
					break;
				case 2:
					product.setProduct_Cat(s);
					break;
				case 3:
					product.setProduct_Price(Integer.parseInt(s));
					break;
				}
				tempList.add(product);
				return tempList;
			}
		}
		return null;
	}
	@Override
	public boolean delete(int id) {
		for(Product product: pdtList)
			if(product.getProduct_Id()==id) 
			{
				pdtList.remove(product);
				//System.out.println("Transaction Complete");
				return true;
			}
		return false;
	}
	@Override
	public List<Product> display() {
		if(pdtList.isEmpty())
			System.out.print("No Rows found\n");
		else {
			System.out.println("Reached DaoImpl");
			return pdtList;
		}
		return null;
	}
}
