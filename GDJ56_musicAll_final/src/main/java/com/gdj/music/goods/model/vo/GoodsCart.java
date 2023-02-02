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
public class GoodsCart {
	
	private int ctCode;
	private int ctCount;
	private int gdCode;
	private int memberNo;
	private Date ctDate;

}
