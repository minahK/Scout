package com.app.service.travel.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.travel.TravelArticleDAO;
import com.app.dto.travel.TravelArticleDTO;
import com.app.service.travel.TravelArticleService;

@Service
public class TravelArticleServiceImpl implements TravelArticleService {

    @Autowired
    private TravelArticleDAO travelArticleDAO;

    @Override
    public List<TravelArticleDTO> findTravelList(Map<String, Object> params) {
        return travelArticleDAO.findTravelList(params);
    }

    @Override
    public TravelArticleDTO findTravelById(int id) {
        return travelArticleDAO.findTravelById(id);
    }

    @Override
    public List<TravelArticleDTO> findRecommendedTravels(int id) {
        return travelArticleDAO.findRecommendedTravels(id);
    }

    @Transactional
    @Override
    public void updateViewCount(int id) {
        travelArticleDAO.updateViewCount(id);
    }

	@Override
	public int getTravelCount(Map<String, Object> params) {
		return travelArticleDAO.getTravelCount(params);
	}
}