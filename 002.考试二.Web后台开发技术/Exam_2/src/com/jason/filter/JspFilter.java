package com.jason.filter;

import java.io.IOException;  

import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
public class JspFilter implements Filter {  
      
    @Override  
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {  
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;  
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;  
        String url = httpServletRequest.getRequestURI();  
        
        String header = httpServletRequest.getHeader("Referer");
        
        if(header == null && url != null && url.contains("do") && !url.contains("login.jsp")) {  
            httpServletResponse.sendRedirect("login.jsp");  
            return;
        }  
        chain.doFilter(request, response);  
    }  
  
    @Override  
    public void destroy() {  
          
    }  
  
    @Override  
    public void init(FilterConfig arg0) throws ServletException {  
          
    }  
  
}