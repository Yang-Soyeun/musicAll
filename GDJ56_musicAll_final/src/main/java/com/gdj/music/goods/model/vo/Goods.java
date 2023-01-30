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
	
	private int gdCode;
	private String gdName;
	private int gdPrice;
	private String gdContent;
	private String gdCom;
	private int mCode;
	private int gdCount;
	private String gdTag;

}
