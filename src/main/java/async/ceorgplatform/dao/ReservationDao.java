/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Reservation;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public interface ReservationDao {
    void UpdateReservation(Reservation request);
    int CreateReservation(Reservation request);
    void DeleteReservation(Reservation request);
    List<Reservation> getReservation();
}
