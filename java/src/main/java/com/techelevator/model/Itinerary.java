package com.techelevator.model;

public class Itinerary {

    private int itineraryPk;
    private int itineraryId;
    private String itineraryName = "";
    private String itineraryStart = "";
    private int landmarkId;
    private int userId;





//    Getters + Setters
    public int getItineraryPk() {
        return itineraryPk;
    }

    public void setItineraryPk(int itineraryPk) {
        this.itineraryPk = itineraryPk;
    }

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

    public int getLandmarkId() {
        return landmarkId;
    }

    public void setLandmarkId(int landmarkId) {
        this.landmarkId = landmarkId;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
