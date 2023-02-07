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
public class GReview {
	
	private int grNo;
	private String grContent;
	private Date grDate;
	private int grScore;
	private int memberNo;
	private int gdCode;

}
