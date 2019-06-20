package com.godrej.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.godrej.dao.ProductDao;
import com.godrej.model.Product;
import com.godrej.util.DbConnection;

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
		ctr+=1;
		DbConnection util = new DbConnection();
		int check;
		Connection conn = util.getConn();
		Statement stmt = null;
		try {
			Class.forName(util.getJDBC_Driver());
			stmt = conn.createStatement();
			PreparedStatement ps = util.getConn().prepareStatement("insert into product values(?,?,?,?)");
			if(stmt.executeUpdate("Select * from Product WHERE PID = '"+ product.getProduct_Id()+"'")==0) {
				ps.setInt(1, ctr);
				ps.setString(2, product.getProduct_Name());
				ps.setString(3, product.getProduct_Cat());
				ps.setInt(4, product.getProduct_Price());
				check = ps.executeUpdate();
				if(check==1)
					return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
			ctr-=1;
			return false;
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				/*
				 * if(rs != null) { rs.close(); }
				 */
			} catch (Exception e) {
				e.printStackTrace();
			}
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
