package controller;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import inter.Action;

/**
 * Servlet implementation class Controller
 */
@WebServlet(
		urlPatterns = { "/Controller" }, 
		initParams = { 
		 @WebInitParam(name = "myParam", value = "/WEB-INF/"
		 		+ "props/action.properties")
		})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	Map<String,Action> mapAction;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        mapAction = new HashMap<String,Action>();
    }
    @Override
	public void init() throws ServletException {
    	
    	Properties props = new Properties();
    	FileInputStream fis = null;
    	
    	String propsPath = getInitParameter("myParam");
    	
    	ServletContext context = getServletContext();
    	
    	String realPath = context.getRealPath(propsPath);
    	
    	if (realPath != null) {
    		
    		try {
    			
    			fis = new FileInputStream(realPath);
    			props.load(fis);
    			System.out.println("File Name : " + props);
    		}catch(Exception err) {
    			err.printStackTrace();
    		}
    	}// end of reaPath
    	
    	Iterator<Object> iter = props.keySet().iterator();
    	
    	while (iter.hasNext()) {
    		
    		String key = (String) iter.next();
    		String value = props.getProperty(key);
    		
    		if(key != null && value != null) {
    			
    			try {
    				Object c = Class.forName(value).newInstance();
    				System.out.println("Class For name : " + c);
    				mapAction.put(key,(Action)c);
    			}catch(Exception err) {
    				err.printStackTrace();
    			}
    			
    		}
    	}
    	
    	
    
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("type");
		System.out.println("요청 파라미터 : " + param);
		if(param == null) {
			param = "index";
		}
		
		Action action = mapAction.get(param);
		
		String viewPath = action.execute(request, response);
		
		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		disp.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
