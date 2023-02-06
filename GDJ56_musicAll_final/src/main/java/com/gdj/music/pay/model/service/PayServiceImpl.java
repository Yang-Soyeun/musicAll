package com.gdj.music.pay.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.gdj.music.goods.model.vo.MyGoods;
import com.gdj.music.pay.model.dao.PayDao;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Reservation;
import com.gdj.music.reservation.model.vo.Seat;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class PayServiceImpl implements PayService {

	private PayDao dao;
	private SqlSessionTemplate session;
	
	public PayServiceImpl(PayDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	
	}

	@Override
	public int insertPay(Pay p,Reservation r) {
		int result= dao.insertPay(session, p);
		if(result>0) {
			result=dao.insertBooking(session, r);
		}
		return result;
		
	}

	@Override
	public int insertSeat(Seat s) {
		// TODO Auto-generated method stub
		return dao.insertSeat(session, s);
	}

	
	//굿즈
	@Override
	public int goodsPay(Pay p) {
		return dao.goodsPay(session, p);
	}

	@Override
	public int insertPoint(Point p) {
		return dao.insertPoint(session, p);
	}

	//포인트 차감
	@Override
	public int minusPoint(Point p1) {
		return dao.minusPoint(session, p1);
	}

	//포인트 합산
	@Override
	public int addPoint(Point p2) {
		return dao.minusPoint(session, p2);
	}
	
	//굿즈 구매 내역 저장
	@Override
	public int insertMygoods(MyGoods g) {
		return dao.insertMygoods(session, g);
	}
	
	
	
	

}	