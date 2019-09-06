/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.model;

import java.util.List;

/**
 *
 * @author JC
 */
public class ReservationDataTable {
    private List<Reservation> aaData;
    private int iTotalRecords;
    private int iTotalDisplayRecords;
    private String sEcho;

    public List<Reservation> getAaData() {
        return aaData;
    }

    public void setAaData(List<Reservation> aaData) {
        this.aaData = aaData;
    }

    public int getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public int getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public String getsEcho() {
        return sEcho;
    }

    public void setsEcho(String sEcho) {
        this.sEcho = sEcho;
    }
}
