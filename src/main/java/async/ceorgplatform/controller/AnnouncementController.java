/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import async.ceorgplatform.model.Announcement;
import async.ceorgplatform.model.Reservation;
import async.ceorgplatform.model.MyUser;
import async.ceorgplatform.model.UserPrincipal;
import async.ceorgplatform.service.AnnouncementService;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Kate Dianne
 */
@Controller
public class AnnouncementController {
    
    @Autowired
    AnnouncementService announcementService;
    
    @RequestMapping(value = "/addAnnouncement", method = RequestMethod.POST)
    @ResponseBody
    public MyUser addAnnouncement(@RequestBody Announcement announcement, HttpServletRequest request){
        
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        MyUser user = new MyUser();
        
        announcement.setCreatedBy(currentUser.getUser().getUserId());
        announcement.setAuthor(currentUser.getUser().getUserId());// set created by to user id from spring security current logged in
                    
        Date date= new Date();
        long time = date.getTime();
        announcement.setDateCreated(new Timestamp(time)); // set date requested to current datetime

        announcement.setStatusId(1);
        announcement.setRemarks("Sample Remarks");// set status to 
            
        int result = announcementService.CreateAnnouncement(announcement);
        user.setUserId(result);
        return user;
        
    }
    
    @RequestMapping(value = "/announcement", method = RequestMethod.GET)
    public String showAnnouncement(){
        return "announcement";
    }
    
}
    
