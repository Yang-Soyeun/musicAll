package com.gdj.music.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.mypage.model.dao.MypageDao;
import com.gdj.music.perfor.model.vo.Mlike;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;

@Service
public class MypageServiceImpl implements MypageService {
	
	private MypageDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MypageServiceImpl(MypageDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	
	//회원정보 수정 비번 확인
	@Override
	public Member checkPwd(Member m) {
		return dao.checkPwd(session,m);
	}
	//회원정보 수정위한 데이터 확인
	@Override
	public Member updateMember(int member_No) {
		return dao.updateMember(session, member_No);
	}
	
	
	
	//예매정보
	@Override
	public List<Map<String, Object>> selectReservationList(int member_No, Map<String,Integer> param) {
		return dao.selectReservationList(session,member_No,param);
	}

	@Override
	public int selectReservationCount(int member_No) {
		return dao.selectReservationCount(session, member_No);
	}
	
	
	
	

	//포인트리스트출력
	@Override
	public List<Point> selectPointListPage(int member_No, Map<String,Integer> param) {
		return dao.selectPointListPage(session, member_No,param);
	}
	
	//남은 포인트 출력
	@Override
	public Point selectPoint(int member_No) {
		return dao.selectPoint(session,member_No);
	}
	//포인트 페이징카운트
	@Override
	public int selectPointCount(int member_No) {
		return dao.selectPointCount(session,member_No);
	}

	
	//관심공연 리스트출력
	@Override
	public List<Map<String, Mlike>> selectMlikeList(int member_No, Map<String, Integer> param) {
		return dao.selectMlikeList(session,member_No,param);
	}
	//관심공연 페이징처리
	@Override
	public int selectMlikeCount(int member_No) {
		return dao.selectMlikeCount(session,member_No);
	}
	
	//관심공연 삭제
	@Override
	public int deleteMlike(Map<String,Mlike> ml) {
		return dao.deleteMlike(session,ml);
	}
	


	//1대1문의 리스트 출력
	@Override
	public List<Question> selectQsListPage(int member_No, Map<String, Integer> param) {
		return dao.selectQsListPage(session,member_No,param);
	}
	//1대1문의 페이징카운트
	@Override
	public int selectQsCount(int member_No) {
		return dao.selectQsCount(session,member_No);
	}
	
	//1대1문의 검색
	@Override
	public List<Question> searchQs(Map<String,Integer> search,Map<String, Integer> param) {
		return dao.searchQs(session,search,param);
	}
	//1대1문의 검색 페이징처리
	@Override
	public int searchQsCount(Map<String,Integer> param) {
		return dao.searchQsCount(session,param);
	}

	
	
	
	//한줄평 리스트출력
	@Override
	public List<Map<String,Review>> selectRvListPage(int member_No, Map<String, Integer> param) {
		return dao.selectRvListPage(session,member_No,param);
	}
	//한줄평 페이징카운트
	@Override
	public int selectRvCount(int member_No) {
		return dao.selectRvCount(session,member_No);
	}
	//한줄평 정렬
	@Override
	public List<Map<String, Review>> orderReview(Map<String, Integer> order,Map<String,Integer> param) {
		return dao.orderReview(session, order, param);
	}
	//한줄평 정렬 페이징카운트
	@Override
	public int orderReviewCount(Map<String, Integer> order) {
		return dao.orderReviewCount(session, order);
	}
	
	
	
	


	//굿즈쇼핑내역
	@Override
	public List<Map<String,Goods>> selectSpListPage(int member_No, Map<String, Integer> param) {
		return dao.selectSpListPage(session,member_No,param);
	}
	//굿즈쇼핑 페이징처리
	@Override
	public int selectSpCount(int member_No) {
		return dao.selectSpCount(session,member_No);
	}
	
	
	
	
	
	
}
