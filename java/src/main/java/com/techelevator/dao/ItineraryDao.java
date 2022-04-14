package com.techelevator.dao;

import com.techelevator.model.Itinerary;

import java.util.List;

public interface ItineraryDao {

    List<Itinerary> retrieveItinerariesByName(String itineraryName);
    Itinerary addItinerary (Itinerary itinerary);
    void deleteItinerary (Itinerary itinerary);
}
