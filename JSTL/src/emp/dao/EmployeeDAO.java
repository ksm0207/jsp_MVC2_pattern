package emp.dao;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import emp.vo.EmployeeVO;
import mybatis.service.FactoryService;

public class EmployeeDAO {
	
	
	public static EmployeeVO[] empTotal() {
		
		EmployeeVO[] ar = null;
		SqlSession sql = FactoryService.getFactory().openSession();
		
		List<EmployeeVO> list = sql.selectList("empTotal");
		
		if(!list.isEmpty()) {
			ar = new EmployeeVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
		
	}

}
