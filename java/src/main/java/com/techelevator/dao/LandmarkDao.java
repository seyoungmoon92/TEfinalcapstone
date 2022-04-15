package com.techelevator.dao;

import com.techelevator.model.Landmark;

import java.util.List;

public interface LandmarkDao {
    Landmark retrieveLandmarkById(int landmarkId);
    List<Landmark> retrieveLandmarks();
    void addLandmark(Landmark landmark);
    boolean deleteLandmark(String landmarkId);
    boolean updateLandmark(Landmark landmark, int landmarkId);


}
