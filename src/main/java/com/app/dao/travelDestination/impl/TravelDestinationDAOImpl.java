package com.app.dao.travelDestination.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.travelDestination.TravelDestinationDAO;
import com.app.dto.travelDestination.TravelDestination;

@Repository
public class TravelDestinationDAOImpl implements TravelDestinationDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<TravelDestination> findTravelList() {
		List<TravelDestination> travelList = sqlSessionTemplate.selectList("travelDestination_mapper.findTravelList");
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
}
