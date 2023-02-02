package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.admin.model.vo.Comment;
import com.gdj.music.question.model.vo.Question;

public interface AdminQuestionDao {

	int totalData(SqlSessionTemplate session);

	List<Question> questionList(SqlSessionTemplate session, Map<String, Integer> param);

	Question answerQ(SqlSessionTemplate session, Question q);

	int comment(SqlSessionTemplate session, Comment c);

	int commentYN(SqlSessionTemplate session, Comment c);

	Comment commnetList(SqlSessionTemplate session, Question q);

	int updateComment(SqlSessionTemplate session, Comment cm);

}
