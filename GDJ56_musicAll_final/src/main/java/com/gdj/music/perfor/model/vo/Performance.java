package com.gdj.music.perfor.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Performance {
	private int mCode;
	private String mTitle;//공연제목
	private String mAge;//공연관람연령
	private String mType;//공연타입
	private String mPeriod;//시작날짜
	private String mPeriodEnd;//종료날짜
	private int vipPrice;//vip석가격
	private int rPrice;//r석가격
	private int sPrice;//s석가격
	

	

	
}
