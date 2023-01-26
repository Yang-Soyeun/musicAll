package com.gdj.music.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.perfor.model.vo.Mlike;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;

public interface MypageDao {
	
	Member checkPwd(SqlSessionTemplate session,Member m);//비번체크
	Member updateMember(SqlSessionTemplate session,int member_No);//회원정보수정 위한 데이터확인
	
	List<Map<String,Object>> selectReservationList(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//예매정보 확인
	int selectReservationCount(SqlSessionTemplate session,int member_No);//예매정보 페이징처리
	
	
	
	List<Point> selectPointListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//포인트리스트 출력
	Point selectPoint(SqlSessionTemplate session,int member_No);//남은포인트 출력
	int selectPointCount(SqlSessionTemplate session,int member_No);//페이징처리
	
	
	List<Map<String,Mlike>> selectMlikeList(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//관심공연 리스트출력
	int selectMlikeCount(SqlSessionTemplate session,int member_No);//관심공연 페이징처리
	
	
	int deleteMlike(SqlSessionTemplate session,Map<String,Mlike> ml);//관심공연 삭제
	
	
	List<Question> selectQsListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//1대1문의내역
	int selectQsCount(SqlSessionTemplate session,int member_No);//1대1문의 페이징처리
	
	List<Question> searchQs(SqlSessionTemplate session,Map<String,Integer> search,Map<String,Integer> param);//1대1문의 검색
	int searchQsCount(SqlSessionTemplate session,Map<String,Integer> param);//1대1문의 검색결과 페이징처리
	
	
	List<Map<String,Review>> selectRvListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//한줄평내역
	int selectRvCount(SqlSessionTemplate session,int member_No);//한줄평 페이징처리
	
	List<Map<String,Review>> orderReview(SqlSessionTemplate session,Map<String,Integer> order,Map<String,Integer> param);//한줄평 정렬
	int orderReviewCount(SqlSessionTemplate session,Map<String,Integer> order);//한줄평 정렬 페이징처리
	
	
	List<Map<String,Goods>> selectSpListPage(SqlSessionTemplate session,int member_No,Map<String,Integer> param);//굿즈쇼핑내역
	int selectSpCount(SqlSessionTemplate session,int member_No);//굿즈쇼핑 페이징처리
	
}
