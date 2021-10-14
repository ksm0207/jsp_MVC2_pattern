package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.LocationsVO;

public class LocationsDAO {

	
	// 카운트 기능
	public static int selectCount(String searchType , String searchValue) {

		SqlSession sql = FactoryService.getFactory().openSession();
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		int cnt = sql.selectOne("locations.selectCount",map);
		
		sql.close();
		
		return cnt;
	}
	
	// 목록기능
	public static LocationsVO[] selectList(String searchType , String searchValue) {
		
		SqlSession sql = FactoryService.getFactory().openSession();
		LocationsVO[] ar_vo = null;		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		List<LocationsVO> list = sql.selectList("locations.selectList",map);
		
		if(!list.isEmpty()) {
			ar_vo = new LocationsVO[list.size()];
			list.toArray(ar_vo); // list의 요소를 ar_vo에 복사
		}
		
		sql.close();
		
		return ar_vo;
	}
}
