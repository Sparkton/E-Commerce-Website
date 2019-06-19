package com.godrej.service;
import java.util.List;

import com.godrej.model.User;

public interface UserService {
	void search(int ch,String s);
	void insert(User user);
	void update(int id, String s, int option);
	void delete(int id);
	void display();
	List<User> getList();
}
