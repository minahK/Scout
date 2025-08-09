package com.app.service.travelDestination.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.travelDestination.TravelDestinationDAO;
import com.app.dto.festival.FestivalDTO;
import com.app.dto.travelDestination.HashTags;
import com.app.dto.travelDestination.TravelDestination;
import com.app.dto.travelDestination.TravelInfo;
import com.app.service.travelDestination.TravelDestinationService;

@Service
public class TravelDestinationServiceImpl implements TravelDestinationService {
	
	@Autowired
	TravelDestinationDAO travelDestinationDAO;

	@Override
	public List<TravelDestination> findTravelList(String sort) {
		List<TravelDestination> travelList = travelDestinationDAO.findTravelList(sort);
		return travelList;
	}

	@Override
	public TravelDestination findTravelById(int travelId) {
		TravelDestination travelDestination = travelDestinationDAO.findTravelById(travelId);
		return travelDestination;
	}

	@Override
	public List<TravelDestination> findTravelGSList() {
		List<TravelDestination> travelList = travelDestinationDAO.findTravelGSList();
		return travelList;
	}

	@Override
	public List<TravelDestination> findTravelMJList() {
		List<TravelDestination> travelList = travelDestinationDAO.findTravelMJList();
		return travelList;
	}

	@Override
	public List<TravelDestination> findTravelHPList() {
		List<TravelDestination> travelList = travelDestinationDAO.findTravelHPList();
		return travelList;
	}

	@Override
	public List<HashTags> findHashTags(int travelId) {
		List<HashTags> hashtag = travelDestinationDAO.findHashTags(travelId);
		return hashtag;
	}

	@Override
	public void increaseView(int travelId) {
		int result = travelDestinationDAO.increaseView(travelId);
	}

	@Override
	public List<TravelDestination> findTravelTagList(String tag) {
		List<TravelDestination> result = travelDestinationDAO.findTravelTagList(tag);
		return result;
	}

	@Override
	public List<TravelDestination> findTravelTagAndSortList(String tag, String sort) {
		List<TravelDestination> result = travelDestinationDAO.findTravelTagAndSortList(tag, sort);
		return result;
	}

	@Override
	public TravelInfo findTravelInfo(int travelId) {
		TravelInfo result = travelDestinationDAO.findTravelInfo(travelId);
		return result;
	}

	@Override
	public List<FestivalDTO> findFestivalList() {
		List<FestivalDTO> result = travelDestinationDAO.findFestivalList();
		return result;
	}
}
