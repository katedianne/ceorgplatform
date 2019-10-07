/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import async.ceorgplatform.model.Activity;
import async.ceorgplatform.model.MyUser;
import async.ceorgplatform.model.UserPrincipal;
import async.ceorgplatform.service.ActivityService;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author JC
 */
@Controller
public class CalendarController {
    @Autowired
    ActivityService activityService;
    
    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public ModelAndView showCalendar(){
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ModelAndView mav = new ModelAndView("calendar");
        mav.addObject("currentRoleId", currentUser.getUser().getRoleId());
        mav.addObject("currentUserId", currentUser.getUser().getUserId());
        mav.addObject("currentOrgId", currentUser.getUser().getOrgId());
        
        return mav;
    }
    
    @RequestMapping(value = "/addCalendar", method = RequestMethod.POST)
    @ResponseBody
    public MyUser addCalendar(@RequestBody Activity activity, HttpServletRequest request){
       UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
       MyUser user = new MyUser();
     
       activity.setCreatedBy(currentUser.getUser().getUserId()); // set created by to user id from current logged in 
     
        Date date= new Date();
        long time = date.getTime();
	activity.setDateCreated(new Timestamp(time)); // set date requested to current datetime

        activity.setStatusId(1); // set status to pencil book
        
        int result = 0;
        if (activity.getActivityId() == 0){
            result = activityService.CreateActivity(activity);
        }
        else {
            result = activityService.UpdateActivity(activity);
        }

        user.setUserId(result);

        return user;
     
    }
}
