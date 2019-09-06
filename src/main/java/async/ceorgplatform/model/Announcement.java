/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.model;

import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public class Announcement {

    public int getAnnouncementId() {
        return announcementId;
    }

    public void setAnnouncementId(int announcementId) {
        this.announcementId = announcementId;
    }

    public String getAnnouncementName() {
        return announcementName;
    }

    public void setAnnouncementName(String announcementName) {
        this.announcementName = announcementName;
    }

    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
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
    private int announcementId = 1;
    private String announcementName;
    private int author;
    private String announcement;
    private Timestamp dateCreated;
    private int createdBy;
    private String remarks;
    private int statusId;
    public Recipient recipient;
    
    public class Recipient{
        
        public String getAnnouncedTo() {
            return announcedTo;
        }

        public void setAnnouncedTo(String announcedTo) {
            this.announcedTo = announcedTo;
        }
        
        private String announcedTo = "haha";
    }
}
