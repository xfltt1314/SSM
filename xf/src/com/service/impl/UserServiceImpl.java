package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public User checkLogin(String username, String password) {
		User user = userDao.getUserByUsername(username);
		if(user != null && user.getPassWord().equals(password)){
			return user; //登录成功
		}
		
		return null;//登录失败
	}
	@Override
	public List<User> queryAll() {
		// TODO Auto-generated method stub
		return userDao.queryAll();
	}
	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}
	@Override
	public int delete(Integer id) {
		return userDao.delete(id);
	}
	@Override
	public int update(User user) {
		return userDao.update(user);
	}
	@Override
	public User queryOne(Integer id) {
		return userDao.queryOne(id);
	}
	@Override
	public int checkExist(String username) {
		return userDao.getUserByUsername(username)==null? 0:1;
	}

}
