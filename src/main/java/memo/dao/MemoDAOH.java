package memo.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import config.HibernateManager;
import memo.dto.MemoDTOH;

public class MemoDAOH {
	public List<MemoDTOH> listMemo(String searchkey, String search){
		// hibernate를 실행할 수 있는 세션 객체
		Session session=HibernateManager.getSessionFactory().openSession();
		// 검색처리(이름+내용,이름,내용)
		String sql="select idx,writer,memo,post_date from memo ";
		if(searchkey.equals("writer_memo")) {
			sql += " where writer like :search "
					+ "or memo like :search ";
		} else {
			sql += " where "+searchkey+" like :search ";
		}
		sql += " order by idx desc ";
		
		// createNativeQuery(sql, 매핑클래스)
		List<MemoDTOH> list=session.createNativeQuery(sql, MemoDTOH.class)
				.setParameter("search", "%"+search+"%").getResultList();
		session.close();
		
		return list;
	}
	public void deleteMemo(int idx) {
		Session session=HibernateManager.getSessionFactory().openSession();
		// 트랜잭션 시작
		session.beginTransaction();
		// 삭제할 레코드 조회
		MemoDTOH dto=(MemoDTOH)session.get(MemoDTOH.class, idx);
		// 삭제
		session.delete(dto);
		// 커밋
		session.getTransaction().commit();
		session.close();
	}
	public void insertMemo(MemoDTOH dto) {
		Session session=HibernateManager.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(dto);
		session.getTransaction().commit();
		session.close();
	}
	public void updateMemo(MemoDTOH dto) {
		Session session=HibernateManager.getSessionFactory().openSession();
		session.beginTransaction();
		dto.setPost_date(new Date());
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}
	public MemoDTOH viewMemo(int idx) {
		Session session=HibernateManager.getSessionFactory().openSession();
		MemoDTOH dto=(MemoDTOH)session.get(MemoDTOH.class, idx);
		session.close();
		return dto;
	}
}
