/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.model;

import java.util.Date;
import java.sql.Time;

/**
 *
 * @author Kate Dianne
 */
public class Reservation {
    
    private int reservationId;
    private Time scheduledStartTime;
    private Time scheduledEndTime;
    private int eventRoomId;
    private String eventName;
    private Date dateRequested;
    private Date dateCreated;
    private int createdBy;
    private int requestedBy;
    private String remarks;
    private int statusId;
    private String status;

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public Time getScheduledStartTime() {
        return scheduledStartTime;
    }

    public void setScheduledStartTime(Time scheduledStartTime) {
        this.scheduledStartTime = scheduledStartTime;
    }

    public Time getScheduledEndTime() {
        return scheduledEndTime;
    }

    public void setScheduledEndTime(Time scheduledEndTime) {
        this.scheduledEndTime = scheduledEndTime;
    }

    public int getEventRoomId() {
        return eventRoomId;
    }

    public void setEventRoomId(int eventRoomId) {
        this.eventRoomId = eventRoomId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }
    
       public int getRequestedBy() {
        return requestedBy;
    }

    public void setRequestedBy(int requestedBy) {
        this.requestedBy = requestedBy;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public Date getDateRequested() {
        return dateRequested;
    }

    public void setDateRequested(Date dateRequested) {
        this.dateRequested = dateRequested;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public Reservation.EventRooms eventRooms = new Reservation.EventRooms();

    public EventRooms getEventRooms() {
        return eventRooms;
    }

    public void setEventRooms(EventRooms eventRooms) {
        this.eventRooms = eventRooms;
    }

    public static class EventRooms{
        private int eventRoomId;
        private String eventRoomName;
        private Date dateCreated;
        private int createdBy;
        private int statusId;

        public int getEventRoomId() {
            return eventRoomId;
        }

        public void setEventRoomId(int eventRoomId) {
            this.eventRoomId = eventRoomId;
        }

        public String getEventRoomName() {
            return eventRoomName;
        }

        public void setEventRoomName(String eventRoomName) {
            this.eventRoomName = eventRoomName;
        }

        public Date getDateCreated() {
            return dateCreated;
        }

        public void setDateCreated(Date dateCreated) {
            this.dateCreated = dateCreated;
        }

        public int getCreatedBy() {
            return createdBy;
        }

        public void setCreatedBy(int createdBy) {
            this.createdBy = createdBy;
        }

        public int getStatusId() {
            return statusId;
        }

        public void setStatusId(int statusId) {
            this.statusId = statusId;
        }
        
    }
}