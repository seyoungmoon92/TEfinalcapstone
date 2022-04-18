package com.techelevator.controller;


import com.techelevator.dao.ItineraryDao;
import com.techelevator.dao.LandmarkDao;
import com.techelevator.dao.PhotoDao;
import com.techelevator.model.Itinerary;
import com.techelevator.model.Landmark;
import com.techelevator.model.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class LandmarkController {

    @Autowired
    private LandmarkDao landmarkDao;

    @Autowired
    private PhotoDao photoDao;

    @Autowired
    private ItineraryDao itineraryDao;


    @RequestMapping(path = "/landmarks", method = RequestMethod.GET)
    public List<Landmark> getLandmarks() {
        return landmarkDao.retrieveLandmarks();
    }
    @RequestMapping(path = "/landmarks/{id}", method = RequestMethod.GET)
    public Landmark getLandMarkById(@PathVariable int id) {
        return landmarkDao.retrieveLandmarkById(id);
    }

    @RequestMapping(path = "/photos", method = RequestMethod.GET)
    public List<Photo> getPhotos() {
        return photoDao.retrievePhotos();
    }

    @RequestMapping(path = "/photos/{id}", method = RequestMethod.GET)
    public List<Photo> getPhotosById(@PathVariable int id) {
        return photoDao.retrievePhotosById(id);
    }





//      Itinerary Functions


    @RequestMapping(path = "/itineraries", method = RequestMethod.POST)
    public Itinerary createItinerary(@RequestBody Itinerary itinerary) { return itineraryDao.createItinerary(itinerary); }

    @RequestMapping(path = "/itineraries/{id}", method = RequestMethod.GET)
    public Itinerary getItinerary(@PathVariable int id) { return itineraryDao.retrieveItineraryById(id); }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/itineraries", method = RequestMethod.GET)
    public List<Itinerary> getAllItineraries(Principal principal) { return itineraryDao.retrieveAllItineraries(principal); }

    @RequestMapping(path = "/itineraries/{id}", method = RequestMethod.PUT)
    public void updateItinerary(@PathVariable int id, @RequestBody Itinerary itinerary) {
        itineraryDao.updateItinerary(id, itinerary.getLandmarkList());
    }

    @RequestMapping(path = "/itineraries/{id}", method = RequestMethod.DELETE)
    public void deleteItinerary(@PathVariable int id) { itineraryDao.deleteItinerary(id); }






}
