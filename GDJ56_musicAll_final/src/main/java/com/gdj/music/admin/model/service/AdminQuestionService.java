package com.gdj.music.admin.model.service;

import java.util.List;
import java.util.Map;

import com.gdj.music.admin.model.vo.Comment;
import com.gdj.music.question.model.vo.Question;

public interface AdminQuestionService {

	int totalData();

	List<Question> questionList(Map<String, Integer> param);

	Question answerQ(Question q);

	int comment(Comment c);

	int commentYN(Comment c);

	Comment commentList(Question q);

	int updateComment(Comment cm);
	
	
}
