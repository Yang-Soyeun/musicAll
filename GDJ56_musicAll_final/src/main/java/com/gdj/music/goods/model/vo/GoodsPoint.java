package com.gdj.music.goods.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GoodsPoint {
	
	private int mpCode;
	private int mpPrice;
	private String mpType;
	private int memberNo;
	private Date mpDate;
	private String mpHistory;
	private int mpPoint;
	

}
