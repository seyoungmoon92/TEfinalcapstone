package com.techelevator.dao;

import com.techelevator.model.Itinerary;

import java.security.Principal;
import java.util.List;

public interface ItineraryDao {

    Itinerary createItinerary(Itinerary itinerary);

    List<Itinerary> retrieveAllItineraries(Principal principal);

    Itinerary retrieveItineraryById(int itineraryId);

    void updateItinerary (int itineraryId, String landmarkList);
    void deleteItinerary (int itineraryId);
}
