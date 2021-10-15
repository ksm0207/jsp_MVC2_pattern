package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.CountriesVO;

public class CountriesDAO {
	
	public static CountriesVO[] selectCountry() {
		
		SqlSession sql = FactoryService.getFactory().openSession();

		CountriesVO[] cvo = null;
		List<CountriesVO> list = sql.selectList("selectCountry");
		
		if(!list.isEmpty()) {
			cvo = new CountriesVO[list.size()];
			list.toArray(cvo);
		}
		
		
		return cvo;
		
	}

}
