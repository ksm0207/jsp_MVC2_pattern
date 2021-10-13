package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;

public class EmpDAO {
	
	public static EmpVO[] getList() {
		
		EmpVO[] arr = null;
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		List<EmpVO> list = sql.selectList("emp.total");
		
		if(list.size() > 0 && list != null) {
			
			arr = new EmpVO[list.size()];
			list.toArray(arr);
		}
		
		return arr;
	}
	
	public static int add(String employee_id, String first_name,
			              String last_name , String email,
			              String job_id, String hire_date,
			              String department_id) {
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("employee_id", employee_id);
		map.put("first_name", first_name);
		map.put("last_name", last_name);
		map.put("email", email);
		map.put("job_id", job_id);
		map.put("hire_date", hire_date);
		map.put("department_id", department_id);
		
		int insert = sql.insert("emp.add",map);
		
		if(insert > 0) {
			sql.commit();
		}else {
			sql.rollback();
		}
		
		return insert;
	}

}
