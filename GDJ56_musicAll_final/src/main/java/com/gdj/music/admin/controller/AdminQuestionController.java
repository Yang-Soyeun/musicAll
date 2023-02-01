package com.gdj.music.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj.music.admin.model.service.AdminQuestionService;
import com.gdj.music.admin.model.vo.Comment;
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
	   
	   //1:1문의 답변하기
	   @RequestMapping("/answerQ.do")
	   public String answerQ(Question q,Model model) throws IOException {
		   
		   Question qt = service.answerQ(q);
		   
		   
		   model.addAttribute("qt",qt);
		   
		   //댓글 목록 불러와서 출력
		   Comment cm = service.commentList(q);
		   System.out.println(cm);
		   
		   model.addAttribute("cm",cm);
		   
		   return "admin/answerQuestion";
	   }
	   
	   //댓글구현
	   @RequestMapping("/comment.do")
	   public void comment(Comment c, HttpServletResponse response) throws IOException {
		   

		   int num = service.comment(c);
		   
		   //댓글완료시 댓글결과 변형
		   int yn = service.commentYN(c);
		   
		   
		   System.out.println(num);
		   System.out.println(c);
		   
		   response.getWriter().print(num);
	   }
	   
	   
	   
	   
}
