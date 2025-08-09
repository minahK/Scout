package com.app.dao.travelDestination.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.travelDestination.TravelDestinationDAO;
import com.app.dto.festival.FestivalDTO;
import com.app.dto.travelDestination.DetailComment;
import com.app.dto.travelDestination.HashTags;
import com.app.dto.travelDestination.TravelDestination;
import com.app.dto.travelDestination.TravelInfo;

@Repository
public class TravelDestinationDAOImpl implements TravelDestinationDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<TravelDestination> findTravelList(String sort) {
		List<TravelDestination> travelList = sqlSessionTemplate.selectList("travelDestination_mapper.findTravelList",sort);
		return travelList;
	}

	@Override
	public TravelDestination findTravelById(int travelId) {
		TravelDestination travelDestination = sqlSessionTemplate.selectOne("travelDestination_mapper.findTravelById",travelId);
		return travelDestination;
	}

	@Override
	public List<TravelDestination> findTravelGSList() {
		List<TravelDestination> travelList = sqlSessionTemplate.selectList("travelDestination_mapper.findTravelGSList");
		return travelList;
	}

	@Override
	public List<TravelDestination> findTravelMJList() {
		List<TravelDestination> travelList = sqlSessionTemplate.selectList("travelDestination_mapper.findTravelMJList");
		return travelList;
	}

	@Override
	public List<TravelDestination> findTravelHPList() {
		List<TravelDestination> travelList = sqlSessionTemplate.selectList("travelDestination_mapper.findTravelHPList");
		return travelList;
	}

	@Override
	public List<HashTags> findHashTags(int travelId) {
		List<HashTags> hashtag = sqlSessionTemplate.selectList("travelDestination_mapper.findHashTags",travelId);
		return hashtag;
	}

	@Override
	public int increaseView(int travelId) {
		int result = sqlSessionTemplate.update("travelDestination_mapper.increaseView",travelId);
		return result;
	}

	@Override
	public List<TravelDestination> findTravelTagList(String tag) {
		List<TravelDestination> result = sqlSessionTemplate.selectList("travelDestination_mapper.findTravelTagList",tag);
		return result;
	}

	@Override
	public List<TravelDestination> findTravelTagAndSortList(String tag, String sort) {
		Map<String, Object> tagSort = new HashMap<>();
		tagSort.put("tag", tag);
		tagSort.put("sort", sort);
		
		List<TravelDestination> result = sqlSessionTemplate.selectList("travelDestination_mapper.findTravelTagAndSortList", tagSort);
		return result;
	}

	@Override
	public TravelInfo findTravelInfo(int travelId) {
		TravelInfo result = sqlSessionTemplate.selectOne("travelDestination_mapper.findTravelInfo",travelId);
		return result;
	}

	@Override
	public List<FestivalDTO> findFestivalList() {
		List<FestivalDTO> result = sqlSessionTemplate.selectList("travelDestination_mapper.findFestivalList");
		return result;
	}

	@Override
	public List<DetailComment> findCommentList(int travelId) {
		List<DetailComment> result = sqlSessionTemplate.selectList("travelDestination_mapper.findCommentList",travelId);
		return result;
	}

	@Override
	public int insertComment(DetailComment dc) {
		int result = sqlSessionTemplate.insert("travelDestination_mapper.insertComment",dc);
		return result;
	}

	@Override
	public int countComments(int travelId) {
		return sqlSessionTemplate.selectOne("travelDestination_mapper.countComments", travelId);
	}
}
