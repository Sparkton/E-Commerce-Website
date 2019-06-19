package com.godrej.daoimpl;

import java.util.ArrayList;
import java.util.List;
import com.godrej.dao.UserDao;
import com.godrej.model.User;


public class UserDaoImpl implements UserDao{

	public static List<User> userList = new ArrayList<User>();
	private List<User> tempList = new ArrayList<User>();
	static int ctr=0;
	final String JDBC_Driver = "oracle.jdbc.driver.OracleDriver";
    final String USER = "system";
    final String PASS = "seema@2019";

	public List<User> getUserList() {
		return userList;
	}

	@Override
	public List<User> search(int ch, String s) {
		tempList.clear();
		
			if(userList.isEmpty())
				System.out.println("List Empty");
			else {
				int ctr=0;
				switch (ch) {
				case 1:
					for(User user:userList)
						if(user.getuName().equals(s)) {
							tempList.add(user);
							ctr=1;
						}
					break;
				case 2:
					for(User user:userList)
						if(user.getAddress().getState()==s || user.getAddress().getCity()==s) {
							tempList.add(user);
							ctr=1;
						}
					break;
				case 3:
					for(User user:userList)
						if(user.getAddress().getPinCode()==Integer.parseInt(s)) {
							tempList.add(user);
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
	public boolean insert(User user) {
		if(!userList.isEmpty()) {
			for(User i:userList) {
				if(i.getuName().equals(user.getuName())) {
					System.out.println("\nNot Valid");
					return false;
				}
				else {
					System.out.println("Entry Successful in Dao");
					ctr+=1;
					user.setUserId(ctr);
					userList.add(user);	
					return true;
				}
			}
		}
		else {
			ctr+=1;
			user.setUserId(ctr);
			System.out.println("UserDao Entry Normal");
			userList.add(user);	
			return true;
		}
		return false;
	}
	@Override
	public List<User> update(int id, String s, int option) {
		tempList.clear();
		for(User user :userList) {
			if(user.getUserId()==id) {
				switch(option)
				{
				case 1:
					user.setuName(s);
					break;
				case 2:
					user.setuPass(s);
					break;
				case 3:
					user.getAddress().setState(s);
					break;
				case 4:
					user.getAddress().setCity(s);
					break;
				case 5:
					user.getAddress().setPinCode(Integer.parseInt(s));
					break;
				}
				tempList.add(user);
				return tempList;
			}
		}
		return null;
	}
	@Override
	public boolean delete(int id) {
		for(User user: userList)
			if(user.getUserId()==id) 
			{
				userList.remove(user);
				return true;
			}
		return false;
	}
	@Override
	public List<User> display() {
		if(userList.isEmpty())
			System.out.print("No Rows found\n");
		else {
			return userList;
		}
		return null;
	}
}
