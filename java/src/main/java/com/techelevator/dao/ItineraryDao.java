package com.techelevator.dao;

import com.techelevator.model.Itinerary;

import java.util.List;

public interface ItineraryDao {

    List<Itinerary> retrieveItinerariesById(int itineraryId);
    void addItinerary (Itinerary itinerary);
    void deleteItinerary (Itinerary itinerary);
}
