package com.app.dao.travel;

import com.app.dto.travel.TravelArticleDTO;
import java.util.List;
import java.util.Map;

public interface TravelArticleDAO {
    
	List<TravelArticleDTO> findTravelList(Map<String, Object> params);
    
    TravelArticleDTO findTravelById(int id);
    
    List<TravelArticleDTO> findRecommendedTravels(int id);
    
    void updateViewCount(int id);
    
    int getTravelCount(Map<String, Object> params);
}