package com.gdj.music.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;

@Repository
public class MypageDaoImpl implements MypageDao {

	//포인트리스트 출력
	@Override
	public List<Point> selectPointListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param) {
		return session.selectList("mypage.selectPointListPage",member_No,
						new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
						,param.get("numPerpage")));
	}

	//남은 포인트 출력
	@Override
	public Point selectPoint(SqlSessionTemplate session, int member_No) {
		return session.selectOne("mypage.selectPoint",member_No);
	}
	//포인트 페이징카운트
	@Override
	public int selectPointCount(SqlSessionTemplate session,int member_No) {
		return session.selectOne("mypage.selectPointCount",member_No);
	}
	

	
	
	
	
	
	//1대1문의내역
	@Override
	public List<Question> selectQsListPage(SqlSessionTemplate session, int member_No, Map<String, Integer> param) {
		return session.selectList("mypage.selectQsListPage",member_No,
						new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
						,param.get("numPerpage")));
	}
	//1대1문의 페이징카운트
	@Override
	public int selectQsCount(SqlSessionTemplate session, int member_No) {
		return session.selectOne("mypage.selectQsCount",member_No);
	}
	
	//1대1문의 검색
	@Override
	public List<Question> searchQs(SqlSessionTemplate session,Map<String,Integer> search, Map<String, Integer> param) {
		return session.selectList("mypage.searchQs",search,
						new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
						,param.get("numPerpage")));
	}
	//1대1문의 검색 페이징처리
	@Override
	public int searchQsCount(SqlSessionTemplate session, Map<String,Integer> param) {
		return session.selectOne("mypage.searchQsCount",param);
	}
	
	
	
	

	//굿즈쇼핑내역
	@Override
	public List<Map<String,Goods>> selectSpListPage(SqlSessionTemplate session, int member_No, Map<String, Integer> param) {
		return session.selectList("mypage.selectSpListPage",member_No,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}
	//굿즈쇼핑 페이징처리
	@Override
	public int selectSpCount(SqlSessionTemplate session, int member_No) {
		return session.selectOne("mypage.selectSpCount",member_No);
	}
	
	
	
	
	
	
}
