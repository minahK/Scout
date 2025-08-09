package com.app.service.travelDestination;

import java.util.List;

import com.app.dto.festival.FestivalDTO;
import com.app.dto.travelDestination.DetailComment;
import com.app.dto.travelDestination.HashTags;
import com.app.dto.travelDestination.TravelDestination;
import com.app.dto.travelDestination.TravelInfo;

public interface TravelDestinationService {

	List<TravelDestination> findTravelList(String sort);

	TravelDestination findTravelById(int travelId);

	List<TravelDestination> findTravelGSList();

	List<TravelDestination> findTravelMJList();

	List<TravelDestination> findTravelHPList();

	List<HashTags> findHashTags(int travelId);

	void increaseView(int travelId);

	List<TravelDestination> findTravelTagList(String tag);

	List<TravelDestination> findTravelTagAndSortList(String tag, String sort);

	TravelInfo findTravelInfo(int travelId);

	List<FestivalDTO> findFestivalList();

	List<DetailComment> findCommentList(int travelId);

	int insertComment(DetailComment dc);

	int countComments(int travelId);

	
}
