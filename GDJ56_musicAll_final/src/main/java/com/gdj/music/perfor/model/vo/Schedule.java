package com.gdj.music.perfor.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Schedule {
	private int sCode;
	private String sStartTime;
	private String sEndTime;
	private String sDay;
	private int sNum;
	private int sTime;
	private int mCode;

}
