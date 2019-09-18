/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import async.ceorgplatform.model.Letter;
import async.ceorgplatform.model.MyUser;
import async.ceorgplatform.service.LetterService;
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

/**
 *
 * @author JC
 */
@Controller
public class LetterController {
    
    @Autowired
    LetterService letterService;
    
    @RequestMapping(value = "/letter", method = RequestMethod.GET)
    public String showLetter(){
        return "letter";
    }
    
    @RequestMapping(value = "/addLetter", method = RequestMethod.POST)
    @ResponseBody
    public MyUser addReservation(@RequestBody Letter letter, HttpServletRequest request){
        MyUser user = new MyUser();

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("UserId")) {
                    letter.setCreatedBy(Integer.parseInt(cookie.getValue())); // set created by to user id from cookie 
                }  
            }
        }
        
        Date date= new Date();
        long time = date.getTime();
	letter.setDateCreated(new Timestamp(time)); // set date requested to current datetime

        letter.setStatusId(3); // set status to 
        
        int result = 0;
        if (letter.getLetterId()== 0){
            result = letterService.CreateLetter(letter);
        }
//        else {
//            result = letterService.UpdateLetter(letter);
//        }

        user.setUserId(result);

        return user;
     
    }
}
