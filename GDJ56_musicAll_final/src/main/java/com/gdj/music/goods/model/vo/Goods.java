package com.gdj.music.goods.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Goods {
	
	private int gCode;
	private String gName;
	private double gPrice;
	private String gContent;
	private String gCom;
	private int fNum;
	private int mCode;
	private int gCount;
	private String gTag;

}
