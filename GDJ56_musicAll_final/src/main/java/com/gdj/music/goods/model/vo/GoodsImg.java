package com.gdj.music.goods.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GoodsImg {
	
	private int flNum;
	private String sumImage;
	private String imName;
	private int mCode;
	private int gdCode;

}
