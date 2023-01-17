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
	
	private int sb_code;
	private int sb_count;
	private int g_code;
	private int member_no;
	private int p_code;

}
