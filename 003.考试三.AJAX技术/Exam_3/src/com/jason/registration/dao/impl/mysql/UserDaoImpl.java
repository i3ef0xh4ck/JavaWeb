package com.jason.registration.dao.impl.mysql;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jason.dao.BaseDao;
import com.jason.dao.ResultSetProcessor;
import com.jason.registration.dao.UserDao;
import com.jason.registration.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public User findUserByName(String name) {
		String sql = "select * from user where username = ?";
		User user = (User)executeQuery(new ResultSetProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				if(rs.next()) {
					int id = rs.getInt("id");
					String username = rs.getString("username");
					String password = rs.getString("password");
					
					return new User(id, username, password);
				} else {
					return null;
				}
			}
		}, sql, name);
		return user;
	}

	@Override
	public int countUserByName(String name) {
		String sql = "select count(1) user_count from user where username = ?";
		int user_count = (Integer)executeQuery((rs)->{
			rs.next();
			int count = rs.getInt("user_count");
			
			return new Integer(count);
		}, sql, name);
		return user_count;
	}

	@Override
	public int insertUser(User user) {
		String sql = "insert into user (username, password) values (?, ?)";
		return executeUpdate(sql, user.getUsername(), user.getPassword());
	}

}
