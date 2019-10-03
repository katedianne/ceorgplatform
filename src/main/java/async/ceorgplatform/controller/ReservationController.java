package async.ceorgplatform.controller;

import async.ceorgplatform.model.Reservation;
import async.ceorgplatform.model.MyUser;
import async.ceorgplatform.model.UserPrincipal;
import async.ceorgplatform.service.ReservationService;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {

    @Autowired
    ReservationService reservationService;

    
    
    @RequestMapping(value = "/reservation", method = RequestMethod.GET)
    public ModelAndView showReservation(){
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ModelAndView mav = new ModelAndView("reservation");
        mav.addObject("currentRoleId", currentUser.getUser().getRoleId());
        mav.addObject("currentUserId", currentUser.getUser().getUserId());
        mav.addObject("currentOrgId", currentUser.getUser().getOrgId());
        
        return mav;
    }

    @RequestMapping(value = "/addReservation", method = RequestMethod.POST)
    @ResponseBody
    public MyUser addReservation(@RequestBody Reservation reservation, HttpServletRequest request){
       UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
       MyUser user = new MyUser();
     
       reservation.setCreatedBy(currentUser.getUser().getUserId()); // set created by to user id from current logged in 
     
        Date date= new Date();
        long time = date.getTime();
	reservation.setDateCreated(new Timestamp(time)); // set date requested to current datetime

        reservation.setStatusId(3); // set status to pencil book
        
        int result = 0;
        if (reservation.getReservationId() == 0){
            result = reservationService.CreateReservation(reservation);
        }
        else {
            result = reservationService.UpdateReservation(reservation);
        }

        user.setUserId(result);

        return user;
     
    }
    
    @RequestMapping(value = "/getReservation", method = RequestMethod.GET)
    @ResponseBody
    public List<Reservation> getReservation( HttpServletRequest request){        
        List<Reservation> reservationList  = reservationService.getReservation();
        return reservationList;
    }
    
    
    @RequestMapping(value = "/deleteReservation", method = RequestMethod.POST)
    @ResponseBody
    public MyUser deleteReservation(@RequestBody Reservation reservation, HttpServletRequest request){
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        MyUser user = new MyUser();

        reservation.setCreatedBy(currentUser.getUser().getUserId()); // set created by to user id from cookie 
    
        int result = reservationService.DeleteReservation(reservation);

        user.setUserId(result);

        return user;
    }
    
    
    @RequestMapping(value = "/confirmReservation", method = RequestMethod.POST)
    @ResponseBody
    public MyUser confirmReservation(@RequestBody Reservation reservation, HttpServletRequest request){
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        MyUser user = new MyUser();
        
        reservation.setCreatedBy(currentUser.getUser().getUserId()); // set created by to user id from cookie 
 
        int result = reservationService.ConfirmReservation(reservation);

        user.setUserId(result);

        return user;     
    }
    
   
} // end of class controller 
