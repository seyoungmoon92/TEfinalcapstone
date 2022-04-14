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


    @RequestMapping(path = "/photos", method = RequestMethod.GET)
    public List<Photo> getPhotos() {
        return photoDao.retrievePhotos();
    }

    @RequestMapping(path = "/photos/{id}", method = RequestMethod.GET)
    public List<Photo> getPhotosById(@PathVariable int id) {
        return photoDao.retrievePhotosById(id);
    }

    @RequestMapping(path = "/itineraries/{name}", method = RequestMethod.GET)
    public List<Itinerary> getItineraries(@PathVariable String name) { return itineraryDao.retrieveItinerariesByName(name); }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/itineraries", method = RequestMethod.POST)
    public Itinerary addItinerary(@RequestBody Itinerary itinerary) { return itineraryDao.addItinerary(itinerary); }






}
