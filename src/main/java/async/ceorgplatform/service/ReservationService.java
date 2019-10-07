/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.model.Reservation;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public interface ReservationService {
    int UpdateReservation(Reservation request);
    int CreateReservation(Reservation request);
    int DeleteReservation(Reservation request);
    int ConfirmReservation(Reservation request);
    List<Reservation> getReservation();
}
