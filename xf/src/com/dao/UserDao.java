package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.User;
public interface UserDao  {
	public User getUserByUsername(String username);
	public List<User> queryAll();
	public int insertUser(User user);
	public int delete(Integer id);
	public int update(User user);
	public User queryOne(Integer id);
}
