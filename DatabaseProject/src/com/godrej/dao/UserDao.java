package com.godrej.dao;

import java.util.List;

import com.godrej.model.User;
/**
 * Interface that contains function declaration for DaoImpl and comes in between 
 * SeviceImpl and DaoImpl
 * @author akashdy
 *
 */
public interface UserDao{
	List<User> search(int ch,String s);
	boolean insert(User usr);
	List<User> update(int id, String s, int option);
	boolean delete(int id);
	List<User> display();
	List<User> getUserList();
	
}
