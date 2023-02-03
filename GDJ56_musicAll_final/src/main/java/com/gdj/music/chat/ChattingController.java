package com.gdj.music.chat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {

	@RequestMapping("/chatting/chattingpage.do")
	public String chattingPage(HttpServletRequest request, Model model) {
		
		//방번호를 모델에 담았음!!
		String roomNo = request.getParameter("roomNo");
		System.out.println(" roomNo L " + roomNo);
		
		model.addAttribute("roomNo", roomNo);
		return "chatting/chat";
	}
}
