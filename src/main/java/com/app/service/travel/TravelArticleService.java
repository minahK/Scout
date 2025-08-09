package com.app.service.travel;

import java.util.List;
import java.util.Map;
import com.app.dto.travel.TravelArticleDTO;

public interface TravelArticleService {
	
    List<TravelArticleDTO> findTravelList(Map<String, Object> params);
    
    TravelArticleDTO findTravelById(int id);
    
    List<TravelArticleDTO> findRecommendedTravels(int id);
    
    void updateViewCount(int id);
    
    int getTravelCount(Map<String, Object> params);
}