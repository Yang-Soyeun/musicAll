package com.gdj.music.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

	private int memberNo;
	private String memberId;
	private String memberName;
	private String memberPw;
	private String email;
	private String phone;
	private int point;
	private String play;
}
