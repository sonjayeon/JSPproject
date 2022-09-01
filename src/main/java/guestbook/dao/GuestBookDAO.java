package guestbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import guestbook.dto.GuestBookDTO;
import sqlmap.MybatisManager;

public class GuestBookDAO {
	
	public List<GuestBookDTO> getList(String searchkey, String search){
		//mybatis
		SqlSession session=MybatisManager.getInstance().openSession();
		//mybatis에서는 반드시 List를 사용(ArrayList 사용 금지)
		//selectList("네임스페이스.아이디") - 네임스페이스는 생략가능
		List<GuestBookDTO> list=null;
		if(searchkey.equals("name_content")) {//이름+내용
			list=session.selectList("gbListAll", "%"+search+"%");
		}else {
			Map<String,String> map=new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			list=session.selectList("gbList",map);
		}
	    
		//줄바꿈 및 특수문자 처리기능 추가
		for(GuestBookDTO dto : list) {
			String content=dto.getContent();
			content=content.replace("<", "&lt;");
			content=content.replace(">", "&gt;");
			content=content.replace("\n", "<br>");//줄바꿈
			content=content.replace("  ", "&nbsp;&nbsp;");//공백문자
			//키워드 색상 처리
			if(!searchkey.equals("name")) {//이름으로만 검색시 제외
				content=content.replace(search, "<span style='color:red'>"
			+search+"</span>");
			}
			
			dto.setContent(content);
		}
		session.close();
		return list;
	}

	public void gbInsert(GuestBookDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.insert("gbInsert", dto);
		session.commit();
		session.close();
	}

	public boolean passwdCheck(int idx, String passwd) {
		boolean result=false;
		SqlSession session=MybatisManager.getInstance().openSession();
		GuestBookDTO dto=new GuestBookDTO();
		dto.setIdx(idx);
		dto.setPasswd(passwd);
		//레코드가 1개가 리턴될 경우 selectOne
		int count=session.selectOne("passwdCheck", dto);
		session.close();
		if(count==1) {
			result=true;
		}
		return result;
	}
	
	//게시물의 상세정보
	public GuestBookDTO gbDetail(int idx) {
		GuestBookDTO dto=new GuestBookDTO();
		SqlSession session=MybatisManager.getInstance().openSession();
		dto = session.selectOne("gbDetail", idx);
		session.close();
		return dto;
	}

	//게시물 수정
	public void gbUpdate(GuestBookDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("guestbook.gbUpdate", dto);
		session.commit();
		session.close();
	}

	//게시물 삭제
	public void gbDelete(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("guestbook.gbDelete", idx);
		session.commit();
		session.close();
	}

}
