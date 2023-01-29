package com.gdj.music.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminMemberService;
import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.member.model.vo.Member;
import com.gdj.music.question.model.vo.Question;

@Controller
@RequestMapping("/member")
public class AdminMemberController {

	private AdminMemberService service;
	
	@Autowired
	public AdminMemberController(AdminMemberService service) {
		super();
		this.service = service;
	}


	@RequestMapping("memberList.do")
	public ModelAndView memberList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="10")int numPerpage) {
		
		List<Member> member =  service.memberList(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//페이징처리
		int totalData = service.totalData();
		mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"memberList.do" ));
		
		mv.addObject("member",member);
		mv.setViewName("admin/memberList");
		return mv;
		
	}
	
	
   @RequestMapping("deleteMember.do")
   public String deleteMember(int memberNo, Model model) {
	   
	   int result = service.deleteMember(memberNo);
	   model.addAttribute("loc","/member/memberList.do");
	   model.addAttribute("msg",result>0?"회원삭제성공":"회원삭제실패");
	   
	   return "common/msg";
   }
   

	
}
