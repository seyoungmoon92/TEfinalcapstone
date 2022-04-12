package com.techelevator.dao;

import com.techelevator.model.Landmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcLandmarkDao  implements LandmarkDao{

    private JdbcTemplate jdbcTemplate;


    public JdbcLandmarkDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Landmark> retrieveLandmarks() {


        List<Landmark> landmarks = new ArrayList<>();


        String sql = "SELECT * FROM landmarks";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);


        while (results.next()) {

            Landmark landmark = new Landmark();

            landmark.setDescription(results.getString("description"));
            landmark.setLocation(results.getString("address"));
            landmark.setRating(results.getInt("rating"));
            landmark.setActive(results.getBoolean("isActive"));
            landmark.setLandmarkId(results.getInt("landmarkId"));
            landmark.setName(results.getString("name"));
            
            landmarks.add(landmark);
        }
        return landmarks;
    }

    @Override
    public void addLandmark(Landmark landmark) {

    }

    @Override
    public boolean deleteLandmark(String landmarkId) {
        return false;
    }

    @Override
    public boolean updateLandmark(Landmark landmark, int landmarkId) {
        return false;
    }
}
