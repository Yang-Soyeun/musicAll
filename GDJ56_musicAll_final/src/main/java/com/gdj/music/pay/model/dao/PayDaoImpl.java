package com.gdj.music.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.gdj.music.pay.model.vo.Pay;
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
	 
	
}
