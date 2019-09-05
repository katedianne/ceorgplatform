/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import async.ceorgplatform.model.Announcement;
import async.ceorgplatform.model.Reservation;
import async.ceorgplatform.model.User;
import async.ceorgplatform.service.AnnouncementService;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Kate Dianne
 */
public class AnnouncementController {
    
    @Autowired
    AnnouncementService announcementService;
    
    @RequestMapping(value = "/addAnnouncement", method = RequestMethod.POST)
    @ResponseBody
    public User addAnnouncement(@RequestBody List<Announcement> _announcement, HttpServletRequest request){

        User user = new User();
        
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("UserId")) {
                    for(Announcement announcement : _announcement){
                        announcement.setCreatedBy(Integer.parseInt(cookie.getValue())); // set created by to user id from cookie 
                    }
                    
                }  
            }
        }
        
        Date date= new Date();
        long time = date.getTime();
        for(Announcement announcement : _announcement){
            announcement.setDateCreated(new Timestamp(time)); // set date requested to current datetime
        
            announcement.setStatusId(1); // set status to 
            
            
        }
            int result = announcementService.CreateAnnouncement(_announcement);
            user.setUserId(result);
	
        
        
        
        return user;
        
    }
}
