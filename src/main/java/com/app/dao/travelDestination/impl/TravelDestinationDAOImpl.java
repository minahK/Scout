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
}
