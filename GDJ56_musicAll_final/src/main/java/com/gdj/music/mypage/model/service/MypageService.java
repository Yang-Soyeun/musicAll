package com.gdj.music.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.goods.model.vo.Goods;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.perfor.model.vo.Mlike;
import com.gdj.music.perfor.model.vo.Review;
import com.gdj.music.question.model.vo.Question;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Reservation;

public interface MypageService {
	
	Member checkPwd(Member m);//비번체크
	Member updateMember(int member_No);//회원정보수정 위한 데이터확인
	
	List<Map<String,Object>> selectReservationList(int member_No,Map<String,Integer> param);//예매정보 확인
	int selectReservationCount(int member_No);//예매정보 페이징처리
	
	Map<String, Reservation> selectRvView(Map<String,Integer> r);//예매세부내역상단
	Map<String, Reservation> selectRsview(Map<String,Integer> r);//예매세부내역하단
	
	
	
	List<Point> selectPointListPage(int member_No,Map<String,Integer> param);//페이징처리,포인트리스트 출력
	Point selectPoint(int member_No);//남은포인트 출력
	int selectPointCount(int member_No);//포인트 페이징처리
	
	List<Map<String,Mlike>> selectMlikeList(int member_No,Map<String,Integer> param);//관심공연 리스트출력
	int selectMlikeCount(int member_No);//관심공연 페이징처리
	
	
	int deleteMlike(Map<String,Mlike> ml);//관심공연 삭제
	
	
	List<Question> selectQsListPage(int member_No,Map<String,Integer> param);//1대1문의내역
	int selectQsCount(int member_No);//1대1문의 페이징처리
	
	List<Question> searchQs(Map<String,Integer> search,Map<String,Integer> param);//1대1문의 검색
	int searchQsCount(Map<String,Integer> param);//1대1문의 검색결과 페이징처리
	
	
	List<Map<String,Review>> selectRvListPage(int member_No,Map<String,Integer> param);//한줄평내역
	int selectRvCount(int member_No);//한줄평 페이징처리
	
	List<Map<String,Review>> orderReview(Map<String,Integer> order,Map<String,Integer> param);//한줄평 정렬
	int orderReviewCount(Map<String,Integer> order);//한줄평 정렬 페이징처리
	
	
	List<Map<String,Goods>> selectSpListPage(int member_No,Map<String,Integer> param);//굿즈쇼핑내역
	int selectSpCount(int member_No);//굿즈쇼핑 페이징처리
	
}
