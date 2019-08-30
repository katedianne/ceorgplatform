/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.model;

import java.sql.Timestamp;

/**
 *
 * @author Kate Dianne
 */
public class Activity {

    public int getActivityId() {
        return activityId;
    }

    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public Timestamp getActivityStartDate() {
        return activityStartDate;
    }

    public void setActivityStartDate(Timestamp activityStartDate) {
        this.activityStartDate = activityStartDate;
    }

    public Timestamp getActivityEndDate() {
        return activityEndDate;
    }

    public void setActivityEndDate(Timestamp activityEndDate) {
        this.activityEndDate = activityEndDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
    
    private int activityId;
    private String activityName;
    private Timestamp activityStartDate;
    private Timestamp activityEndDate;
    private String description;
    private Timestamp dateCreated;
    private int createdBy;
    private String remarks;
    private int statusId;
}
