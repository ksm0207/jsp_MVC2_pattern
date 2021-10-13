package cbbs.action;

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

import cbbs.action.Action;

/**
 * Servlet implementation class Controller
 */
@WebServlet(
		urlPatterns = { "/Controller" }, 
		initParams = { 
		 @WebInitParam(name = "myParam", value = "/WEB-INF/action.properties")
		})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    // 초기 파라미터로 전달된 action.properties파일의 경로를 가지고
	// 그 파일의 내용(클래스의 경로)들을 가져와서 객체로 생성한 후 저장할 곳
	private Map<String, Action> actionMap;
	
    public Controller() {
        super();
        actionMap = new HashMap<String, Action>();
    }

	@Override
	public void init() throws ServletException {
		
		String props_path = getInitParameter("myParam");
	
		ServletContext application = getServletContext();
		
		String realPath = application.getRealPath(props_path);
	
		Properties props = new Properties();
	
		FileInputStream fis = null;
		try {
		
			fis = new FileInputStream(realPath);
			
			props.load(fis);
			System.out.println("파일내용 : " + props);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		Iterator<Object> it = props.keySet().iterator();
	
		while(it.hasNext()) {
	
			String key = (String)it.next();
			
			String value = props.getProperty(key); // "ex3.GreetAction"
			
			try {
				Object obj = Class.forName(value).newInstance();
				actionMap.put(key, (Action)obj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 한글처리
		request.setCharacterEncoding("utf-8");
		
		// type이라는 파라미터 값 받기
		String type = request.getParameter("type");
		System.out.println("파라미터 : " + type);
	
		if(type == null)
			type = "list";
		
		
		Action action = actionMap.get(type);
		
		String viewPath = action.execute(request, response);
		
		
		if(viewPath == null) {
			response.sendRedirect("Controller");
		} else {
		
			RequestDispatcher disp = 
					request.getRequestDispatcher(viewPath);
			disp.forward(request, response);
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
