package com.jason.registration.dao;

import com.jason.registration.entity.User;

public interface UserDao {
	User findUserByName(String name);
	int countUserByName(String name);
	int resetPassword(User user,String newPassword);
	int insertUser(User user);
}
