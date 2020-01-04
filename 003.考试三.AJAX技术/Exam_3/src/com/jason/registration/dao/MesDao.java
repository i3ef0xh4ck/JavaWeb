package com.jason.registration.dao;

import com.jason.registration.entity.Mes;
import com.jason.registration.entity.User;

public interface MesDao {
	Mes findMesByUser(User user);
	
	int insertMes(Mes mes);
}
