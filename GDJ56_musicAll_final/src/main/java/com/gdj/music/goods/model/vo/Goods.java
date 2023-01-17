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
	
	private int g_code;
	private String g_name;
	private double g_price;
	private String g_content;
	private String g_com;
	private int f_num;
	private int m_code;
	private int g_count;
	private String g_tag;

}
