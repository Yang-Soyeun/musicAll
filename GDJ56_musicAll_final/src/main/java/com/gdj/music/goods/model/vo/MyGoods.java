package com.gdj.music.goods.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyGoods {
	
	private int sbCode;
	private int sbCount;
	private int gdCode;
	private int memberNo;
	private String payCode;
	private Date sbDate;
	private String sbHall;

}
