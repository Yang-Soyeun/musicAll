package com.gdj.music.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.goods.model.vo.MyGoods;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Reservation;
import com.gdj.music.reservation.model.vo.Seat;

public interface PayDao {
	int insertPay(SqlSessionTemplate session, Pay p);
	int insertBooking(SqlSessionTemplate session, Reservation r);
	int insertSeat(SqlSessionTemplate session,Seat s);
	
	
	//굿즈
	int goodsPay(SqlSessionTemplate session, Pay p);
	
	//포인트 내역
	int insertPoint(SqlSessionTemplate session, Point p);
	
	//포인트 차감
	int minusPoint(SqlSessionTemplate session, Point p1);
	
	//포인트 합산
	int addPoint(SqlSessionTemplate session, Point p2);
	
	//굿즈 구매 내역 저장
	int insertMygoods(SqlSessionTemplate session, MyGoods g);
}
