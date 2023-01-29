package com.gdj.music.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminQuestionService;
import com.gdj.music.common.interceptor.PageFactory;
import com.gdj.music.question.model.vo.Question;

@Controller
@RequestMapping("/adminq")
public class AdminQuestionController {
	
	private AdminQuestionService service;
	
	@Autowired
	public AdminQuestionController(AdminQuestionService service) {
		super();
		this.service = service;
	}

	   //1:1문의 리스트
	   @RequestMapping("questionList.do")
		public ModelAndView questionList(ModelAndView mv,
				@RequestParam(value="cPage", defaultValue="1")int cPage,
				@RequestParam(value="numPerpage", defaultValue="10")int numPerpage) {
			
			List<Question> question =  service.questionList(Map.of("cPage",cPage,"numPerpage",numPerpage));
			
			//페이징처리
			int totalData = service.totalData();
			mv.addObject("pageBar",PageFactory.getPage(cPage, numPerpage, totalData,"questionList.do" ));
			
			mv.addObject("question",question);
			mv.setViewName("admin/questionList");
			
			return mv;
			
		}
}
