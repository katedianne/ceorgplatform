package async.ceorgplatform.controller;

import async.ceorgplatform.model.Reservation;
import async.ceorgplatform.model.User;
import async.ceorgplatform.service.ReservationService;
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
    public User addReservation(@RequestBody Reservation request){

        User user = new User();
        
        int result = reservationService.CreateReservation(request);
        user.setUserId(result);
        
        return  user;
        
    }

}
