package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.Landmark;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcItineraryDao implements ItineraryDao{

    private JdbcTemplate jdbcTemplate;


    public JdbcItineraryDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Itinerary> retrieveItinerariesByName(String itineraryName) {

        List<Itinerary> itineraries = new ArrayList<>();

        String sql = "SELECT * FROM itineraries WHERE itineraryName = ?";


        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, itineraryName);

        while (results.next()) {

            Itinerary itinerary = new Itinerary();

            itinerary.setItineraryPk(results.getInt("itineraryPk"));
            itinerary.setItineraryId(results.getInt("itineraryId"));
            itinerary.setItineraryName(results.getString("itineraryName"));
            itinerary.setItineraryStart(results.getString("itineraryStart"));
            itinerary.setLandmarkId(results.getInt("landmarkId"));
            itinerary.setUserId(results.getInt("userId"));


            itineraries.add(itinerary);
        }
        return itineraries;

    }

    @Override
    public Itinerary addItinerary(Itinerary itinerary) {


        String sql = "INSERT INTO itineraries(itineraryName, itineraryStart, landmarkId) " +
                "VALUES(?, ?, ?)";

        jdbcTemplate.update(sql, itinerary.getItineraryName(), itinerary.getItineraryStart(), itinerary.getLandmarkId());

        return itinerary;
    }

    @Override
    public void deleteItinerary(Itinerary itinerary) {

    }
}
