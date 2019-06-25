package com.godrej.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.godrej.dao.UserDao;
import com.godrej.model.Address;
import com.godrej.model.User;
import com.godrej.util.DbConnection;

public class UserDaoImpl implements UserDao{

	private static List<User> userList = new ArrayList<User>();
	private List<User> tempList = new ArrayList<User>();
	static int ctr=0;
	public List<User> getUserList() {
		return userList;
	}

	@Override
	public List<User> search(int ch, String s) {
		tempList.clear();
		Connection conn = null;
		Statement stmt = null;
		try {
			DbConnection util = new DbConnection();
			conn = util.getConn();
			stmt = conn.createStatement();
			if(stmt.executeUpdate("select count(1) where exists (select * from Users)") == 1)
				System.out.println("List Empty");
			else {
				int flag1=0;
				ResultSet rs;
				switch (ch) {
				case 1:
					rs = stmt.executeQuery("select * from Users Where EMAIL ='"+s+"'");
					while(rs.next()) {
						User user = new User();
						Address address = new Address();
						user.setUserId(rs.getInt("USERID"));
						user.setuName(rs.getString("EMAIL"));
						user.setuPass(rs.getString("Pass"));
						address.setState(rs.getString("State"));
						address.setCity(rs.getString("City"));
						address.setPinCode(rs.getInt("Pin"));
						user.setAddress(address);
						tempList.add(user);
						flag1=1;
					}
					break;
					//					for(User user:userList)
					//						if(user.getuName().equals(s)) {
					//							tempList.add(user);
					//							ctr=1;
					//						}
				case 2:
					rs = stmt.executeQuery("select * from Users Where State ='"+s+"'");
					while(rs.next()) {
						User user = new User();
						Address address = new Address();
						user.setUserId(rs.getInt("USERID"));
						user.setuName(rs.getString("EMAIL"));
						user.setuPass(rs.getString("Pass"));
						address.setState(rs.getString("State"));
						address.setCity(rs.getString("City"));
						address.setPinCode(rs.getInt("Pin"));
						user.setAddress(address);
						tempList.add(user);
						flag1=1;
					}
					break;
					//					for(User user:userList)
					//						if(user.getAddress().getState()==s || user.getAddress().getCity()==s) {
					//							tempList.add(user);
					//							ctr=1;
					//						}
				case 3:
					rs = stmt.executeQuery("select * from Users Where Pin ='"+Integer.parseInt(s)+"'");
					while(rs.next()) {
						User user = new User();
						Address address = new Address();
						user.setUserId(rs.getInt("USERID"));
						user.setuName(rs.getString("EMAIL"));
						user.setuPass(rs.getString("Pass"));
						address.setState(rs.getString("State"));
						address.setCity(rs.getString("City"));
						address.setPinCode(rs.getInt("Pin"));
						user.setAddress(address);
						tempList.add(user);
						flag1=1;
					}
					break;
					//					for(User user:userList)
					//						if(user.getAddress().getPinCode()==Integer.parseInt(s)) {
					//							tempList.add(user);
					//							ctr=1;
					//						}
				default: System.out.println("\nNot Found");
				}
				if(flag1==0)
					System.out.println("\nNo record found");
				else
					return tempList;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
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
		return null;
	}
	@Override
	public boolean insert(User user) {
		ctr+=1;
		int check;
		Connection conn = null;
		Statement stmt = null;
		try {
			DbConnection util = new DbConnection();
			conn = util.getConn();
			stmt = conn.createStatement();
			while(true) {
				String sql = "select USERID from Users where userid = "+ctr;
				int flag = stmt.executeUpdate(sql);
				if(flag==0)
					break;
				else
					ctr++;
			}
			stmt = null;
			stmt = conn.createStatement();
			PreparedStatement ps = conn.prepareStatement("insert into Users values(?,?,?,?,?,?,?,?)");
			if(stmt.executeUpdate("Select * from Users WHERE EMAIL = '"+ user.getuName()+"'")==0) {
				ps.setInt(1, ctr);
				ps.setString(2, user.getuName());
				ps.setString(3, user.getuPass());
				ps.setString(4, user.getAddress().getState());
				ps.setString(5, user.getAddress().getCity());
				ps.setInt(6, user.getAddress().getPinCode());
				ps.setInt(7, 0);
				ps.setNull(8, java.sql.Types.INTEGER);
				check = ps.executeUpdate();
				if(check==1) {
					String sql = "insert into Login values('"+user.getuName()+"','"+user.getuPass()+"')";
					stmt.executeQuery(sql);
					return true;
				}
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
	//		if(!userList.isEmpty()) {
	//			for(User i:userList) {
	//				if(i.getuName().equals(user.getuName())) {
	//					System.out.println("\nNot Valid");
	//					return false;
	//				}
	//				else {
	//					System.out.println("Entry Successful in Dao");
	//					ctr+=1;
	//					user.setUserId(ctr);
	//					userList.add(user);	
	//					return true;
	//				}
	//			}
	//		}
	//		else {
	//			ctr+=1;
	//			user.setUserId(ctr);
	//			System.out.println("UserDao Entry Normal");
	//			userList.add(user);	
	//			return true;
	//		}
	//		return false;
	@Override
	public List<User> update(int id, String s, int option) {
		tempList.clear();
		Connection conn = null;
		Statement stmt = null;
		try {
			DbConnection util = new DbConnection();
			conn = util.getConn();
			stmt = conn.createStatement();
			if(stmt.executeUpdate("select * from Users") >0)
			{
				PreparedStatement ps = conn.prepareStatement("UPDATE USERS SET ? = ? WHERE USERID = ?");
				switch(option)
				{
				case 1:
					ps.setString(1, "EMAIL");
					ps.setString(2, s);
					break;
				case 2:
					ps.setString(1, "PASS");
					ps.setString(2, s);
					break;
				case 3:
					ps.setString(1, "State");
					ps.setString(2, s);
					break;
				case 4:
					ps.setString(1, "CITY");
					ps.setString(2, s);
					break;
				case 5:
					ps.setString(1, "PIN");
					ps.setInt(2, Integer.parseInt(s));
					break;
				}
				ps.setInt(3, id);
				ps.executeUpdate();
			}
			else
				return null;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null && option == 5) {
					conn.close();
				}
				if(stmt != null && option == 5) {
					stmt.close();
				}
				/*
				 * if(rs != null) { rs.close(); }
				 */
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
		//		for(User user :userList) {
		//			if(user.getUserId()==id) {
		//				switch(option)
		//				{
		//				case 1:
		//					user.setuName(s);
		//					break;
		//				case 2:
		//					user.setuPass(s);
		//					break;
		//				case 3:
		//					user.getAddress().setState(s);
		//					break;
		//				case 4:
		//					user.getAddress().setCity(s);
		//					break;
		//				case 5:
		//					user.getAddress().setPinCode(Integer.parseInt(s));
		//					break;
		//				}
		//				tempList.add(user);
		//				return tempList;
		//			}
		//		}
	}
	@Override
	public boolean delete(int id) {
		Connection conn = null;
		Statement stmt = null;
		try {
			DbConnection util = new DbConnection();
			conn = util.getConn();
			stmt = conn.createStatement();
			String sql = "DELETE from USERS where USERID ="+id;
			int i = stmt.executeUpdate(sql);
			if(i == 1)
				return true;
		}catch(Exception e) {
			e.printStackTrace();
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
//		for(User user: userList)
//			if(user.getUserId()==id) 
//			{
//				userList.remove(user);
//				return true;
//			}
		return false;
	}
	@Override
	public List<User> display() {
		tempList.clear();
		Connection conn = null;
		Statement stmt = null;
		try {
			DbConnection util = new DbConnection();
			conn = util.getConn();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from Users");
			while(rs.next()) {
				User user = new User();
				Address address = new Address();
				user.setUserId(rs.getInt("USERID"));
				user.setuName(rs.getString("EMAIL"));
				user.setuPass(rs.getString("Pass"));
				address.setState(rs.getString("State"));
				address.setCity(rs.getString("City"));
				address.setPinCode(rs.getInt("Pin"));
				user.setAddress(address);
				tempList.add(user);
			}
			if(tempList.isEmpty())
				return null;
			else
				return tempList;
		}catch(Exception e) {
			e.printStackTrace();
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
		return null;
//		if(userList.isEmpty())
//			System.out.print("No Rows found\n");
//		else 
//			return userList;
	}
}
