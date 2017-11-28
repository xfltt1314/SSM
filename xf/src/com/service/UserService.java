package com.service;

import java.util.List;

import com.entity.User;


public interface UserService {
	public User checkLogin(String username,String password); 
	public List<User> queryAll();
	public int insertUser(User user);
	public int delete(Integer id);
	public int update(User user);
	public User queryOne(Integer id);
	public int checkExist(String username);
}
