package com.app.service;

import java.util.List;

import com.app.dto.TravelPlaceDTO;

public interface TravelPlaceService {
    List<TravelPlaceDTO> getAllPlaces();
    TravelPlaceDTO getPlaceById(int placeId);
    void addPlace(TravelPlaceDTO place);
    void updatePlace(TravelPlaceDTO place);
    void deletePlace(int placeId);
}