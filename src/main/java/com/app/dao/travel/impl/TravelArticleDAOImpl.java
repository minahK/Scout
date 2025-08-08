package com.app.dao.travel.impl;

import com.app.dao.travel.TravelArticleDAO;
import com.app.dto.travel.TravelArticleDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class TravelArticleDAOImpl implements TravelArticleDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<TravelArticleDTO> findTravelList(Map<String, Object> params) {
        return sqlSessionTemplate.selectList("com.app.mapper.travel.TravelArticle_mapper.findTravelList", params);
    }

    @Override
    public TravelArticleDTO findTravelById(int id) {
        return sqlSessionTemplate.selectOne("com.app.mapper.travel.TravelArticle_mapper.findTravelById", id);
    }

    @Override
    public List<TravelArticleDTO> findRecommendedTravels(int id) {
        return sqlSessionTemplate.selectList("com.app.mapper.travel.TravelArticle_mapper.findRecommendedTravels", id);
    }

    @Override
    public void updateViewCount(int id) {
        sqlSessionTemplate.update("com.app.mapper.travel.TravelArticle_mapper.updateViewCount", id);
    }

	@Override
	public int getTravelCount(Map<String, Object> params) {
		return sqlSessionTemplate.selectOne("com.app.mapper.travel.TravelArticle_mapper.getTravelCount", params);
	}
    
    
}