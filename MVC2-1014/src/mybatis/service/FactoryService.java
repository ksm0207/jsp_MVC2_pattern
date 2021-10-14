package mybatis.service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader r = Resources.getResourceAsReader("mybatis/config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//외부에서 SqlSessionFactory를 요청하여 받아갈 수 있도록 메서드를 준비한다.
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}




