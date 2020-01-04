package com.jason.registration.dao.impl.mysql;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jason.dao.BaseDao;
import com.jason.dao.ResultSetProcessor;
import com.jason.registration.dao.MesDao;
import com.jason.registration.entity.Mes;
import com.jason.registration.entity.User;

public class MesDaoImpl extends BaseDao implements MesDao {

	@Override
	public Mes findMesByUser(User user) {
		String sql = "select * from mes where user2 = ? order by mid desc LIMIT 1";
		Mes mes = (Mes)executeQuery(new ResultSetProcessor() {
			
			@Override
			public Object process(ResultSet rs) throws SQLException {
				if(rs.next()) {
					int mid = rs.getInt("mid");
					String user1 = rs.getString("user1");
					String user2 = rs.getString("user2");
					String mes = rs.getString("mes");
					
					return new Mes(mid,user1, user2, mes);
				} else {
					return null;
				}
			}
		}, sql, user.getUsername());
		return mes;
	}

	@Override
	public int insertMes(Mes mes) {
		String sql = "insert into mes (user1, user2, mes) values (?, ?, ?)";
		return executeUpdate(sql, mes.getUser1(), mes.getUser2(), mes.getMes());
	}

}
