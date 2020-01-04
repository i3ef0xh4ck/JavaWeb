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
@WebServlet("/SendMes")
public class SendMes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("login");
		
		String user1 = user.getUsername();
		String user2 = request.getParameter("user2");
		String mess = request.getParameter("mes");
		System.out.println(user1+" "+user2+" "+mess);
		
		MesDao mesDao = new MesDaoImpl();

		Mes mes = new Mes(user1,user2,mess);
		int result = mesDao.insertMes(mes);
		if(result == 1) {
			System.out.println("insert success!");
			pw.write(user1+":"+mess+"\n");
		}else {
			pw.write("[系统错误]发送失败！\n");
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
