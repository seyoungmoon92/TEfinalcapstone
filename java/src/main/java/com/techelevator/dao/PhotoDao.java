package com.techelevator.dao;

import com.techelevator.model.Photo;

import java.util.List;

public interface PhotoDao {
    List<Photo> retrievePhotos();
    List<Photo> retrievePhotosById(int landmarkId);
    void addPhoto(Photo photo);
    boolean deletePhoto(String photoId);

}
