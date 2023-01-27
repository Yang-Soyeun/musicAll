package com.gdj.music.goods.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GoodsImg {
	
	private int fNum;
	private String sumImage;
	private String iName;
	private int mCode;
	private int gCode;

}
