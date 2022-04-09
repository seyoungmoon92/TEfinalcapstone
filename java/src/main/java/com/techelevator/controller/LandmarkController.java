package com.techelevator.controller;


import com.techelevator.dao.LandmarkDao;
import com.techelevator.dao.PhotoDao;
import com.techelevator.model.Landmark;
import com.techelevator.model.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class LandmarkController {

    @Autowired
    private LandmarkDao landmarkDao;

    @Autowired
    private PhotoDao photoDao;


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





}
