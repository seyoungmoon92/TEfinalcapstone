package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcItineraryDao implements ItineraryDao{

    private JdbcTemplate jdbcTemplate;


    public JdbcItineraryDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public Itinerary createItinerary(Itinerary itinerary){

        String sql = "INSERT INTO itineraries (itineraryName, itineraryStart, user_id) " +
                "VALUES(?,?,?)";

        jdbcTemplate.update(sql, itinerary.getItineraryName(), itinerary.getItineraryStart(), itinerary.getUserId());

        return itinerary;
    }

    @Override
    public List<Itinerary> retrieveAllItineraries(Principal principal) {

        List<Itinerary> itineraries = new ArrayList<>();

        String sql = "SELECT * FROM itineraries JOIN users ON users.user_id = itineraries.user_id WHERE username = ?;";


        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, principal.getName());

        while (results.next()) {

            Itinerary itinerary = new Itinerary();

            itinerary.setItineraryId(results.getInt("itineraryId"));
            itinerary.setItineraryName(results.getString("itineraryName"));
            itinerary.setItineraryStart(results.getString("itineraryStart"));
            itinerary.setLandmarkList(results.getString("landmarkList"));
            itinerary.setUserId(results.getInt("user_id"));

            itineraries.add(itinerary);


        }
        return itineraries;
    }

    @Override
    public Itinerary retrieveItineraryById(int itineraryId) {

        Itinerary itinerary = new Itinerary();

        String sql = "SELECT * FROM itineraries WHERE itineraryId = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, itineraryId);

        while (results.next()) {

            itinerary.setItineraryId(results.getInt("itineraryId"));
            itinerary.setItineraryName(results.getString("itineraryName"));
            itinerary.setItineraryStart(results.getString("itineraryStart"));
            itinerary.setLandmarkList(results.getString("landmarkList"));
            itinerary.setUserId(results.getInt("user_id"));


        }
        return itinerary;

    }

    @Override
    public void updateItinerary(Itinerary itinerary, String landmarkList) {


        String sql = "UPDATE itineraries SET landmarkList = ? WHERE itineraryId = ?;";

        jdbcTemplate.update(sql, itinerary.getLandmarkList(), itinerary.getItineraryId());

    }

    @Override
    public void deleteItinerary(Itinerary itinerary) {

    }
}
