package memo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import memo.dto.MemoDTO;
import sqlmap.MybatisManager;

public class MemoDAO {
	public List<MemoDTO> listMemo(String searchkey, String search){
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MemoDTO> list=null;
		try {
			if(searchkey.equals("writer_memo")) {//이름+메모로 검색
				list=session.selectList("memo.listAll", search);
			}else {
				Map<String,String> map=new HashMap<>();
				map.put("searchkey", searchkey);
				map.put("search", search);
				list=session.selectList("memo.list", map);
			}
			//특수문자,공백문자 처리는 insert때보다는 select때 처리가 더 좋다.
			for(MemoDTO dto : list) {//for문으로 처리해야 한다.
				String memo=dto.getMemo();
				memo=memo.replace("  ", "&nbsp;&nbsp;");//공백 문자
				memo=memo.replace("<", "&lt;"); //Less Than ~보다 작다
				memo=memo.replace(">", "&gt;"); //Greater Than 
				//키워드에 색상 처리(태그 문자 처리 코드아래에 처리해야 태그무력화 영향을 안받는다.)
				if(searchkey.equals("memo")) {
					if(memo.indexOf(search) != -1) {
						memo=memo.replace(search, "<font color='red'>"+search+"</font>");
					}
				}
				dto.setMemo(memo);
			}
			
			//selectList("memo.listAll"): selectList(namespace.id)
			//list=session.selectList("memo.listAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();//mybatis 객체 닫기
		}
		return list;
	}

	public void insertMemo(MemoDTO dto) {
		//mybatis 실행 객체 생성
		SqlSession session=MybatisManager.getInstance().openSession();
		//태그 문자 처리
//		String memo=dto.getMemo();
//		memo=memo.replace("  ", "&nbsp;&nbsp;");//공백 문자
//		
//		memo=memo.replace("<", "&lt;"); //Less Than ~보다 작다
//		memo=memo.replace(">", "&gt;"); //Greater Than 
//		dto.setMemo(memo);
		
		session.insert("memo.insert", dto);
		//레코드추가, insert 메소드는 파라미터가 1개밖에 허용안한다.
		session.commit();//수동커밋, mybatis는 자동커밋을 막았다.
		session.close();//mybatis 세션 닫기
	}
	
	public MemoDTO viewMemo(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		MemoDTO dto=session.selectOne("memo.view", idx);
		//selectOne : 레코드 1개만 가져올때
		//selectList() : 레코드 2개이상 가져올때(목록 가져올때)
		session.close();
		return dto;
	}

	public void updateMemo(MemoDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("memo.update", dto);
		session.commit();
		session.close();
		
	}

	public void deleteMemo(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("memo.delete", idx);
		session.commit();
		session.close();
		
	}

}
