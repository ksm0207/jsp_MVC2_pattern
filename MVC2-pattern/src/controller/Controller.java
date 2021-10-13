package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inter.Action;

/**
 * Servlet implementation class Controller
 */
@WebServlet( urlPatterns = {"/Controller"},
initParams = {
		@WebInitParam(name="param",value="/WEB-INF/prop/emp.properties")
}) 
public class Controller extends HttpServlet { 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */ 
	
	private Map<String, Action> mapAction;
	
    public Controller() {
        super();
        mapAction = new HashMap<String, Action>();
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	
    	Properties props = new Properties();
    	FileInputStream fis = null;
    	
    	String propsPath = getInitParameter("param");
    	ServletContext context = getServletContext();
    	
    	String realPath = context.getRealPath(propsPath);
    	
    	
    	try {
    		
    		fis = new FileInputStream(realPath);
    		props.load(fis);
    		
    		System.out.println("파일 내용 : " + props);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	Iterator<Object> iter = props.keySet().iterator();
    	
    	while(iter.hasNext()) {
    		
    		String key = (String)iter.next();
    		String value = props.getProperty(key);
    	
    		try {
				Object obj = Class.forName(value).newInstance();
				mapAction.put(key, (Action)obj);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("search");
		System.out.println("요청 파라미터 : "+param);
		if(param == null) {
			param = "total";
		}
		  
		Action action = mapAction.get(param);
		
		String location = action.execute(request, response);
		System.out.println("이동 페이지 : " + location);
		
		if(location == null) {
			response.sendRedirect("Controller");
		}else {
			RequestDispatcher dis = request.getRequestDispatcher(location);
			dis.forward(request, response);
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
