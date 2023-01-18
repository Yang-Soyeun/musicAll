package com.gdj.music.perfor.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Performance {
	private String perTitle;//공연제목
	private int perAge;//공연관람연령
	private int vipPrice;//vip석가격
	private int rPrice;//r석가격
	private int sPrice;//s석가격
	private String perType;//공연타입
	private Date startDate;//시작날짜
	private Date endDate;//종료날짜
	private String[] perDay;//요일
	private int turn;//1회차(15시),2회차(19시)
	private String perSpace;//공연장소
	
	
}
