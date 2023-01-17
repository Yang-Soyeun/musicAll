package com.gdj.music.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

	private int member_No;
	private String member_Id;
	private String name;
	private String password;
	private String email;
	private String phone;
}
