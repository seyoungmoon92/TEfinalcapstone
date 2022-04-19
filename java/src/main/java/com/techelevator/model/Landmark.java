package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Landmark {
    //Variable Declaration
    private int landmarkId;
    private String name = "";
    private String location = "";
    private String description = "";
    private String funFact1 = "";
    private String funFact2 = "";
    private String funFact3 = "";
    private int rating = 0;
    private boolean isActive = false;



    //Default Constructor




    //Methods








    //Getters and Setters
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public int getLandmarkId() {
        return landmarkId;
    }

    public void setLandmarkId(int landmarkId) {
        this.landmarkId = landmarkId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFunFact1() {
        return funFact1;
    }

    public void setFunFact1(String funFact1) {
        this.funFact1 = funFact1;
    }

    public String getFunFact2() {
        return funFact2;
    }

    public void setFunFact2(String funFact2) {
        this.funFact2 = funFact2;
    }

    public String getFunFact3() {
        return funFact3;
    }

    public void setFunFact3(String funFact3) {
        this.funFact3 = funFact3;
    }
}
