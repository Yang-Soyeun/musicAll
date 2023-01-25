package com.gdj.music.perfor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Performance2 {
	private String mTitle;
	private String mType;
	private String mAge;
	private String perDay;
	private String sStartTime;
	private String sStartTime2;
	private String daterange;
	private String mPeriod;
	private String mPeriodEnd;
	private int sTime;
	private String perPlace;
	private int vipPrice;
	private int rPrice;
	private int sPrice;
	private int hCode;
	//private String upFile;
	//private String upFile2;
}
