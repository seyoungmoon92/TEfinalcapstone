package com.techelevator.dao;

import com.techelevator.model.Itinerary;

import java.security.Principal;
import java.util.List;

public interface ItineraryDao {

    Itinerary createItinerary(Itinerary itinerary);

    List<Itinerary> retrieveAllItineraries(Principal principal);

    Itinerary retrieveItineraryById(int itineraryId);

    void updateItinerary (Itinerary itinerary, String landmarklist);
    void deleteItinerary (Itinerary itinerary);
}
