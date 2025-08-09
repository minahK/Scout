package com.app.dao.festival.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.festival.FestivalDAO;
import com.app.dto.festival.FestivalDTO;

@Repository
public class FestivalDAOImpl implements FestivalDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FestivalDTO> findFestivalList(Map<String, Object> params) {
		return sqlSession.selectList("com.app.mapper.festival.FestivalMapper.findFestivalList", params);
	}

	@Override
	public FestivalDTO findFestivalById(int id) {
		return sqlSession.selectOne("com.app.mapper.festival.FestivalMapper.findFestivalById", id);
	}

	@Override
	public void updateViewCount(int id) {
		sqlSession.update("com.app.mapper.festival.FestivalMapper.updateViewCount", id);
	}

}
