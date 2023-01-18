package com.gdj.music.goods.model.vo;

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
	private int gCode;
	private int memberNo;
	private int pCode;

}
