package com.jason.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jason.registration.dao.MesDao;
import com.jason.registration.dao.impl.mysql.MesDaoImpl;
import com.jason.registration.entity.Mes;
import com.jason.registration.entity.User;

/**
 * Servlet implementation class SendMes
 */
@WebServlet("/ReciveMes")
public class ReciveMes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReciveMes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
			
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("login");
		
		MesDao mesDao = new MesDaoImpl();
		Mes mes = mesDao.findMesByUser(user);
		
		if(mes!=null) {
			pw.write(mes.getUser1()+":"+mes.getMes()+"\n");
		}else {
			pw.write("");
		}
		
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
