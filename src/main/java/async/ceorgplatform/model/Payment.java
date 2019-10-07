/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.model;

import java.util.Date;


/**
 *
 * @author Kate Dianne
 */
public class Payment {
    private double paymentBalance;
    private double principalAmount;
    private int orgId;
    private String paymentName;
    private Date dateCreated;
    private int createdBy;
    private String remarks;
    public Payment.UpdateTrail updateTrail = new Payment.UpdateTrail();    

    public UpdateTrail getUpdateTrail() {
        return updateTrail;
    }

    public void setUpdateTrail(UpdateTrail updateTrail) {
        this.updateTrail = updateTrail;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    private int statusId;

    public double getPaymentBalance() {
        return paymentBalance;
    }

    public void setPaymentBalance(double paymentBalance) {
        this.paymentBalance = paymentBalance;
    }

    public double getPrincipalAmount() {
        return principalAmount;
    }

    public void setPrincipalAmount(double principalAmount) {
        this.principalAmount = principalAmount;
    }

    public int getOrgId() {
        return orgId;
    }

    public void setOrgId(int orgId) {
        this.orgId = orgId;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
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
    
    
    public static class UpdateTrail{

        public int getPaymentId() {
            return paymentId;
        }

        public void setPaymenId(int paymentId) {
            this.paymentId = paymentId;
        }

        public String getStatusFrom() {
            return statusFrom;
        }

        public void setStatusFrom(String statusFrom) {
            this.statusFrom = statusFrom;
        }

        public String getStatusTo() {
            return statusTo;
        }

        public void setStatusTo(String statusTo) {
            this.statusTo = statusTo;
        }

        public double getPaymentBalance() {
            return paymentBalance;
        }

        public void setPaymentBalance(double paymentBalance) {
            this.paymentBalance = paymentBalance;
        }

        public double getPaymentAmount() {
            return paymentAmount;
        }

        public void setPaymentAmount(double paymentAmount) {
            this.paymentAmount = paymentAmount;
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
        private int paymentId;
        private String statusFrom;
        private String statusTo;
        private double paymentBalance;
        private double paymentAmount;
        private Date dateCreated;
        private int createdBy;
        private String remarks;
        private int statusId;
    }
}
