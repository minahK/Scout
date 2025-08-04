package com.app.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dto.TravelPlaceDTO;
import com.app.mapper.TravelPlaceMapper;
import com.app.service.TravelPlaceService;

@Service
public class TravelPlaceServiceImpl implements TravelPlaceService {
    @Autowired
    private TravelPlaceMapper travelPlaceMapper;

    public List<TravelPlaceDTO> getAllPlaces() {
        return travelPlaceMapper.selectAll();
    }
    public TravelPlaceDTO getPlaceById(int placeId) {
        return travelPlaceMapper.selectById(placeId);
    }
    public void addPlace(TravelPlaceDTO place) {
        travelPlaceMapper.insert(place);
    }
    public void updatePlace(TravelPlaceDTO place) {
        travelPlaceMapper.update(place);
    }
    public void deletePlace(int placeId) {
        travelPlaceMapper.delete(placeId);
    }
}