package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.BbsVO;
import mybatis.vo.CommVO;

public class BbsDAO {

	//총 게시물 수 - 총페이지 값을 구할 수 있다.
	public static int getTotalCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("bbs.totalCount");
		ss.close();
		
		return cnt;
	}
	
	//목록
	public static BbsVO[] getList(int begin, int end) {
		BbsVO[] ar = null;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("bbs.bbsList", map);
		if(list != null && list.size() > 0 && !list.isEmpty()) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
	public static int add(String title, String writer, String content,
			String fname, String pwd, String ip) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", title);
		map.put("writer", writer);
		map.put("content", content);
		map.put("file_name", fname);
		map.put("pwd", pwd);
		map.put("ip", ip);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("bbs.add", map);
		System.out.println("Cnt : "+cnt);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		
		ss.close();
		return cnt;
	}
	
	public static BbsVO getBbs(String b_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		BbsVO vo = ss.selectOne("bbs.getBbs", b_idx);
		ss.close();
		
		return vo;
	}
	
	public static int addAns(CommVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("bbs.addAns", vo);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		
		return cnt;
	}
	
	public static int delBbs(String b_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("bbs.delBbs", b_idx);
		
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		
		return cnt;
	}
	
	public static int updateHit(String b_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("bbs.hit", b_idx);
		
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		
		return cnt;
	}
	
	public static int editBbs(String b_idx, String subject, String content,
			String fname, String oname, String pwd, String ip) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("b_idx", b_idx);
		map.put("subject", subject);
		map.put("content", content);
		map.put("pwd", pwd);
		map.put("ip", ip);
		
		//파일첨부가 되었을 때만 파일명들을 DB에 저장한다. 만약!
		//파일첨부가 안되었다면 기존 파일이 유지되어야 하기 때문이다.
		if(fname != null) {
			map.put("fname", fname);
			map.put("oname", oname);
		}
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.update("bbs.edit", map);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		return cnt;
	}
}






