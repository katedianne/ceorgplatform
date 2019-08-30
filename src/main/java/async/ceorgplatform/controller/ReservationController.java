package async.ceorgplatform.controller;

import async.ceorgplatform.model.Reservation;
import async.ceorgplatform.model.User;
import async.ceorgplatform.service.ReservationService;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReservationController {

    @Autowired
    ReservationService reservationService;

    @RequestMapping(value = "/reservation", method = RequestMethod.GET)
    public String showReservation(){
        return "reservation";
    }

    @RequestMapping(value = "/addReservation", method = RequestMethod.POST)
    @ResponseBody
    public User addReservation(@RequestBody Reservation reservation, HttpServletRequest request){

        User user = new User();
        
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("UserId")) {
                    reservation.setCreatedBy(Integer.parseInt(cookie.getValue())); // set created by to user id from cookie 
                }  
            }
        }
        
        Date date= new Date();
        long time = date.getTime();
	reservation.setDateRequested(new Timestamp(time)); // set date requested to current datetime
        
        reservation.setStatusId(1); // set status to 
        
        int result = reservationService.CreateReservation(reservation);
        user.setUserId(result);
        
        return user;
        
    }

}
