package com.gdj.music.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.goods.model.vo.MyGoods;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Reservation;
import com.gdj.music.reservation.model.vo.Seat;

@Repository
public class PayDaoImpl implements PayDao{

	@Override
	public int insertPay(SqlSessionTemplate session, Pay p) {
		// TODO Auto-generated method stub
		return session.insert("pay.insertPay",p);
	}

	@Override
	public int insertBooking(SqlSessionTemplate session, Reservation r) {
		// TODO Auto-generated method stub
		return session.insert("pay.insertBooking",r);
	}

	
	  @Override 
	  public int insertSeat(SqlSessionTemplate session,Seat s) { 
		  return session.insert("pay.insertSeat",s); }
	  
	  
	//굿즈
	@Override
	public int goodsPay(SqlSessionTemplate session, Pay p) {
		return session.insert("pay.insertPay", p);
	}

	//포인트 내역
	@Override
	public int insertPoint(SqlSessionTemplate session, Point p) {
		return session.insert("pay.insertPay", p);
	}

	//포인트 차감
	@Override
	public int minusPoint(SqlSessionTemplate session, Point p1) {
		return session.update("pay.minusPoint", p1);
	}

	//포인트 합산
	@Override
	public int addPoint(SqlSessionTemplate session, Point p2) {
		return session.update("pay.addPoint", p2);
	}
	 
	//굿즈 구매 저장
	@Override
	public int insertMygoods(SqlSessionTemplate session, MyGoods g) {
		return session.insert("pay.insertMygoods", g);
	}
	
}
