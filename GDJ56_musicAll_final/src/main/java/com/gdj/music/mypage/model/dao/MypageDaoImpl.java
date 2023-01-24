package com.gdj.music.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.perfor.model.vo.Mlike;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;

@Repository
public class MypageDaoImpl implements MypageDao {

	
	//회원정보 수정 비번 확인
	@Override
	public Member checkPwd(SqlSessionTemplate session, Member m) {
		return session.selectOne("mypage.checkPwd",m);
	}
	//회원정보 수정위한 데이터 확인
	@Override
	public Member updateMember(SqlSessionTemplate session, int member_No) {
		return session.selectOne("mypage.updateMember",member_No);
	}
	




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
	
	//관심공연 리스트출력
	@Override
	public List<Map<String, Mlike>> selectMlikeList(SqlSessionTemplate session, int member_No,
			Map<String, Integer> param) {
		return session.selectList("mypage.selectMlikeList",member_No,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}
	//관심공연 페이징처리
	@Override
	public int selectMlikeCount(SqlSessionTemplate session, int member_No) {
		return session.selectOne("mypage.selectMlikeCount",member_No);
	}
	//관심공연 삭제
	@Override
	public int deleteMlike(SqlSessionTemplate session, Map<String,Mlike> ml) {
		return session.delete("mypage.deleteMlike",ml);
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
	
	
	
	//한줄평 리스트출력
	@Override
	public List<Map<String,Review>> selectRvListPage(SqlSessionTemplate session, int member_No, Map<String, Integer> param) {
		return session.selectList("mypage.selectRvListPage",member_No,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}
	//한줄평 페이징카운트
	@Override
	public int selectRvCount(SqlSessionTemplate session, int member_No) {
		return session.selectOne("mypage.selectRvCount",member_No);
	}
	//한줄평 정렬
	@Override
	public List<Map<String, Review>> orderReview(SqlSessionTemplate session, Map<String, Integer> order,Map<String,Integer> param) {
		return session.selectList("mypage.orderReview",order,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage")
				,param.get("numPerpage")));
	}
	//한줄평 정렬 페이징카운트
	@Override
	public int orderReviewCount(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectOne("mypage.orderReviewCount",param);
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
