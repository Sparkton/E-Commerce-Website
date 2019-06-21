package com.godrej.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import com.godrej.dao.UserDao;
import com.godrej.daoimpl.UserDaoImpl;
import com.godrej.model.User;
import com.godrej.service.UserService;

public class UserServiceImpl implements UserService 
{
	private List<User> tempList = new ArrayList<User>();
	UserDao userDao = new UserDaoImpl();
	
	public List<User> getList(){
		return userDao.getUserList();
	}

	@Override
	public void search(int ch, String s) {
		tempList = userDao.search(ch,s);
		intDisplay();
	}

	@Override
	public void insert(User user) {
		boolean a = userDao.insert(user);
		if(a == true)
			System.out.println("Entry Successful");
		else
			System.out.println("Entry UnSucessful");
	}

	@Override
	public void update(int id, String s, int option) {
		/* tempList = */userDao.update(id,s,option);
		//intDisplay();
	}

	@Override
	public void delete(int id) {
		boolean a = userDao.delete(id);
		if(a == true)
			System.out.println("Delete Successful");
		else
			System.out.println("Delete UnSucessful");
	}

	@Override
	public void display() {
		//tempList = new ArrayList<User>(userDao.display());
		System.out.println("Reached SeviceImpl");
		//intDisplay();
	}
	private void intDisplay() {
		if(tempList.isEmpty())
			System.out.print("No Rows found\n");
		else
		{
			System.out.println("Rows found");
			System.out.println("\nID \t Name \t Category \t Price");
			for(User i:tempList)
				System.out.println(i.getUserId()+"\t"+i.getuName()+"\t"+i.getuPass()+"\t"+i.getAddress().getState()+"\t"+i.getAddress().getCity()+"\t"+i.getAddress().getPinCode());

		}
//		tempList.clear();
	}
}
