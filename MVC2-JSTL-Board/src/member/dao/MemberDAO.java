package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import member.vo.MemberVO;
import mybatis.service.FactoryService;

public class MemberDAO {

	public static int add(String id, String pw, String name, String phone) {
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("member_id", id);
		map.put("member_pw", pw);
		map.put("member_name", name);
		map.put("member_phone", phone);
		
		int status = sql.insert("member.add",map);
		
		if(status > 0) {
			sql.commit();
		}else {
			sql.rollback();
		}
		
		sql.close();
		
		return status;	
	}
	
	public static MemberVO login(String id, String pw) {
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", id);
		map.put("member_pw", pw);
		
		MemberVO vo = sql.selectOne("member.login",map);
	
		sql.close();
	
		return vo;
		
	}
}
