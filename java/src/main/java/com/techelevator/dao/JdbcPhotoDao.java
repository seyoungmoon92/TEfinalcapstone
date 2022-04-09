package com.techelevator.dao;


import com.techelevator.model.Photo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcPhotoDao implements PhotoDao {

    private JdbcTemplate jdbcTemplate;


    public JdbcPhotoDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    @Override
    public List<Photo> retrievePhotos() {

        List<Photo> photos = new ArrayList<>();

        String sql = "Select * FROM photos";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while(results.next()) {

            Photo photo = new Photo();

            photo.setPhotoId(results.getInt("photoId"));
            photo.setLandmarkId(results.getInt("landmarkId"));
            photo.setPhotoUrl(results.getString("photoUrl"));

            photos.add(photo);


        }



        return photos;
    }

    @Override
    public List<Photo> retrievePhotosById(int landmarkId) {
        List<Photo> photos = new ArrayList<>();

        String sql = "Select * FROM photos WHERE landmarkId = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, landmarkId);

        while(results.next()) {

            Photo photo = new Photo();

            photo.setPhotoId(results.getInt("photoId"));
            photo.setLandmarkId(results.getInt("landmarkId"));
            photo.setPhotoUrl(results.getString("photoUrl"));

            photos.add(photo);


        }



        return photos;
    }

    @Override
    public void addPhoto(Photo photo) {

    }

    @Override
    public boolean deletePhoto(String photoId) {
        return false;
    }
}
