package com.gdj.music.pay.model.service;

import com.gdj.music.goods.model.vo.MyGoods;
import com.gdj.music.pay.model.vo.Pay;
import com.gdj.music.reservation.model.vo.Point;
import com.gdj.music.reservation.model.vo.Reservation;
import com.gdj.music.reservation.model.vo.Seat;

public interface PayService {
	int insertPay(Pay p,Reservation r);
	int insertSeat(Seat s);
	
	
	
	
	
	//굿즈
	int goodsPay(Pay p);
	
	//포인트 내역
	int insertPoint(Point p);

	//포인트 차감
	int minusPoint(Point p1);
	
	//포인트 합산
	int addPoint(Point p2);
	
	//구매 내역 저장
	int insertMygoods(MyGoods g);
	
}
