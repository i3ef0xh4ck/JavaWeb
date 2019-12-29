package com.jason.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.johnzon.mapper.Mapper;
import org.apache.johnzon.mapper.MapperBuilder;

import com.jason.dao.ProductDao;
import com.jason.dao.impl.mysql.ProductDaoImpl;
import com.jason.entity.Product;

/**
 * Servlet implementation class ShowProductList
 */
@WebServlet("/ShowProductList")
public class ShowProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter pw=response.getWriter();
		boolean result = false;
		
		String typeStr = (String)request.getParameter("type");
		
		if(typeStr != null) {
			try {
				int type = Integer.parseInt(typeStr);
				
				ProductDao productDao = new ProductDaoImpl();
				List<Product> productList = productDao.findProductByType(type);
				result = true;
				
				Mapper mapper = new MapperBuilder().build();
				mapper.writeObject(productList, pw);
				
				pw.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(!result) {
			JsonGenerator generator = Json.createGenerator(pw);
			generator.writeStartObject().write("message", "The products cannot be obtained!").writeEnd();
			pw.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
