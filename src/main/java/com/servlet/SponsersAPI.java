package com.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SponserDAOImpl;
import com.model.Sponser;

/**
 * Servlet implementation class SponsersAPI
 */
@WebServlet("/SponsersAPI")
public class SponsersAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static Sponser sponserObj;
	private static SponserDAOImpl sponserDaoObject;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SponsersAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		sponserDaoObject = new SponserDAOImpl();
		 String result = sponserDaoObject.insertSponserData(Integer.parseInt(request.getParameter("sponserID")),Integer.parseInt(request.getParameter("productId")),
	    		 request.getParameter("firstName"),
	    		 request.getParameter("lastName"),
	    		 Float.parseFloat(request.getParameter("sAmount")),
	    		 request.getParameter("compName"));
	    		 response.getWriter().write(result);
		 
		}
	
	private static Map getParasMap(HttpServletRequest request)
    {
     Map<String, String> map = new HashMap<String, String>();
    try
     {
     Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
     String queryString = scanner.hasNext() ?
     scanner.useDelimiter("\\A").next() : "";
     scanner.close();
     String[] params = queryString.split("&");
     for (String param : params)
     { 
    
    String[] p = param.split("=");
     map.put(p[0], p[1]);
     }
     }
    catch (Exception e)
     {
     }
    return map;
    }

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
	 
	 sponserDaoObject = new SponserDAOImpl();
	 
	 Map paras = getParasMap(request);
	 String result = sponserDaoObject.updateSponserData(Integer.parseInt(paras.get("hidItemIDSave").toString()),
    		 Integer.parseInt(paras.get("sponserID").toString()),
    		 Integer.parseInt(paras.get("productId").toString()),
    		 paras.get("firstName").toString(),
    		 paras.get("lastName").toString(),
    		 Float.parseFloat(paras.get("sAmount").toString()),
    		 paras.get("compName").toString());
    		 response.getWriter().write(result);
    
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
	 sponserDaoObject = new SponserDAOImpl();
	 Map paras = getParasMap(request);
	 String output = sponserDaoObject.deleteSponserData(Integer.parseInt(paras.get("id").toString()));
	response.getWriter().write(output);
	}
	
	
	

}
