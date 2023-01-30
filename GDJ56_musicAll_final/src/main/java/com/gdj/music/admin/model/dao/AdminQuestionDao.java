package com.gdj.music.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.gdj.music.question.model.vo.Question;

public interface AdminQuestionDao {

	int totalData(SqlSessionTemplate session);

	List<Question> questionList(SqlSessionTemplate session, Map<String, Integer> param);

}
