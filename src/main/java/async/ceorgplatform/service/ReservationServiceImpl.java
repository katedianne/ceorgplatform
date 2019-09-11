/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.dao.ReservationDao;
import async.ceorgplatform.model.Reservation;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Kate Dianne
 */
public class ReservationServiceImpl implements ReservationService {
    @Autowired
    public ReservationDao reservationDao;
    
    public int UpdateReservation(Reservation request) {
        int result = reservationDao.UpdateReservation(request);
        return result;
    }
    
    public int CreateReservation(Reservation request) {
        int result = reservationDao.CreateReservation(request);
        return result;
    }
    
    public int DeleteReservation(Reservation request) {
        int result = reservationDao.DeleteReservation(request);
        return result;
    }
    
    public int ConfirmReservation(Reservation request){
        int result = reservationDao.ConfirmReservation(request);
        return result;
    }
    
    public List<Reservation> getReservation(){
        return reservationDao.getReservation();
    }
}
