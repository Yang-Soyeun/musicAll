package com.gdj.music.perfor.model.vo;

import java.time.LocalTime;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
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
