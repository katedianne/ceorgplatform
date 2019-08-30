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
public class Letter {
    private int letterId;
    private String letterNumber;
    private int letterTypeId;
    private String controlNumber;
    private Timestamp dateReleased;
    private Timestamp dateCreated;
    private int createdBy;
    private String remarks;
    private int statusId;
    public LetterType letterType;
    
    public class LetterType{
        private int letterTypeId;
        private String letterTypeName;
        private int statusId;
        
        public int getLetterTypeId() {
            return letterTypeId;
        }

        public void setLetterTypeId(int letterTypeId) {
            this.letterTypeId = letterTypeId;
        }

        public String getLetterTypeName() {
            return letterTypeName;
        }

        public void setLetterTypeName(String letterTypeName) {
            this.letterTypeName = letterTypeName;
        }

        public int getStatusId() {
            return statusId;
        }

        public void setStatusId(int statusId) {
            this.statusId = statusId;
        }
        
    }
    
    public int getLetterId() {
        return letterId;
    }
    
    public void setLetterId(int letterId) {
        this.letterId = letterId;
    }

    public String getLetterNumber() {
        return letterNumber;
    }

    public void setLetterNumber(String letterNumber) {
        this.letterNumber = letterNumber;
    }

    public int getLetterTypeId() {
        return letterTypeId;
    }

    public void setLetterTypeId(int letterTypeId) {
        this.letterTypeId = letterTypeId;
    }

    public String getControlNumber() {
        return controlNumber;
    }

    public void setControlNumber(String controlNumber) {
        this.controlNumber = controlNumber;
    }

    public Timestamp getDateReleased() {
        return dateReleased;
    }

    public void setDateReleased(Timestamp dateReleased) {
        this.dateReleased = dateReleased;
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
    
}
