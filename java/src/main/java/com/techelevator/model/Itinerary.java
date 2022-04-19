package com.techelevator.model;

import java.lang.reflect.Array;

public class Itinerary {

    private int itineraryId;
    private String itineraryName = "";
    private String itineraryStart = "";
    private int[] landmarkList;
    private int userId;





//    Getters + Setters

    public int getItineraryId() {
        return itineraryId;
    }

    public void setItineraryId(int itineraryId) {
        this.itineraryId = itineraryId;
    }

    public String getItineraryName() {
        return itineraryName;
    }

    public void setItineraryName(String itineraryName) {
        this.itineraryName = itineraryName;
    }

    public String getItineraryStart() {
        return itineraryStart;
    }

    public void setItineraryStart(String itineraryStart) {
        this.itineraryStart = itineraryStart;
    }

    public int[] getLandmarkList() {
        return landmarkList;
    }

    public void setLandmarkList(String landmarkList) {
        this.landmarkList = landmarkList;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
