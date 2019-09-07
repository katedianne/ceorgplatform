/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;


import async.ceorgplatform.model.Reservation;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Kate Dianne
 */
public class ReservationDaoImpl implements ReservationDao {

    @Autowired
    DataSource datasource;

    @Autowired
    JdbcTemplate jdbcTemplate;

    public void UpdateReservation(Reservation request) {
        String sql = "update reservations set scheduled_start_time = ? , scheduled_end_time= ? , event_room_id= ?, event_name= ? where reservation_id = ?";
        jdbcTemplate.update(sql, new Object[]{request.getScheduledStartTime(), request.getScheduledEndTime(), request.getEventRoomId(), request.getEventName(), request.getDateRequested(), request.getCreatedBy(), request.getRequestedBy(), request.getRemarks(), request.getStatusId()});
    }

    public int CreateReservation(Reservation request) {

        String sql = "insert into reservations (scheduled_start_time, scheduled_end_time, event_room_id, event_name, date_requested, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,?,?,?)";

      int result = jdbcTemplate.update(sql, new Object[]{request.getScheduledStartTime(), request.getScheduledEndTime(), request.getEventRoomId(),
            request.getEventName(), request.getDateRequested(), request.getDateCreated(), request.getCreatedBy(), request.getRemarks(),request.getStatusId() });

      return result;
    }

    public void DeleteReservation(Reservation request) {
        String sql = "update reservations set status_id = 2 where reservation_id = ?";
        jdbcTemplate.update(sql, new Object[]{request.getReservationId()});
    }

    public List<Reservation> getReservation() {
        String sql = "Select r.*, s.status_name, er.event_room_name from reservations r "
                + "inner join statuses s on r.status_id = s.status_id "
                + "inner join event_rooms er on r.event_room_id=er.event_room_id "
                + "where r.status_id = 1";
        List<Reservation> reservation = jdbcTemplate.query(sql, new ReservationDaoImpl.ReservationMapper());
//        reservation = jdbcTemplate.query(sql, new ReservationDaoImpl.ReservationStatusMapper());
        return reservation;
    }

    
    class ReservationMapper implements RowMapper<Reservation>{
     
        public Reservation mapRow(ResultSet rs, int arg1) throws SQLException{
            Reservation reservation = new Reservation();
           // EventRooms eventRooms = reservation.new EventRooms();
            
            reservation.setReservationId(rs.getInt("reservation_id"));
            reservation.setScheduledStartTime(rs.getTime("scheduled_start_time"));
            reservation.setScheduledEndTime(rs.getTime("scheduled_end_time"));
            reservation.setEventRoomId(rs.getInt("event_room_id"));
            reservation.setEventName(rs.getString("event_name"));
            reservation.setDateRequested(rs.getTimestamp("date_requested"));
            reservation.setDateCreated(rs.getTimestamp("date_created"));
            reservation.setCreatedBy(rs.getInt("created_by"));
            reservation.setRequestedBy(rs.getInt("requested_by"));
            reservation.setRemarks(rs.getString("remarks"));
            reservation.setStatusId(rs.getInt("status_id"));
            reservation.setStatus(rs.getString("status_name"));
            reservation.eventRooms.setEventRoomName(rs.getString("event_room_name"));
//            reservation.eventRooms.setEventRoomId(rs.getInt("event_room_id"));
            
//            reservation.eventRooms.setDateCreated(rs.getTimestamp("date_created"));
//            reservation.eventRooms.setCreatedBy(rs.getInt("created_by"));
//            reservation.eventRooms.setStatusId(rs.getInt("status_id"));
            return reservation;
        }
    }
    
    class ReservationStatusMapper implements RowMapper<Reservation>{
     
        public Reservation mapRow(ResultSet rs, int arg1) throws SQLException{
            Reservation reservation = new Reservation();
            
            reservation.setStatus(rs.getString("status_name"));
            return reservation;
        }
    }
}