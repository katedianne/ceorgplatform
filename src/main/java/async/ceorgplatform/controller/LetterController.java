/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import async.ceorgplatform.model.Letter;
import async.ceorgplatform.model.MyUser;
import async.ceorgplatform.model.UserPrincipal;
import async.ceorgplatform.service.LetterService;
import async.ceorgplatform.service.ReservationService;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
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
public class LetterController {
    
    @Autowired
    LetterService letterService;
    
    @RequestMapping(value = "/letter", method = RequestMethod.GET)
    public ModelAndView showLetter(){
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ModelAndView mav = new ModelAndView("letter");
        mav.addObject("currentRoleId", currentUser.getUser().getRoleId());
        mav.addObject("currentUserId", currentUser.getUser().getUserId());
        mav.addObject("currentOrgId", currentUser.getUser().getOrgId());
        
        return mav;
    }
    
    @RequestMapping(value = "/addLetter", method = RequestMethod.POST)
    @ResponseBody
    public MyUser addLetter(@RequestBody Letter letter, HttpServletRequest request){
       UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
       MyUser user = new MyUser();
     
       letter.setCreatedBy(currentUser.getUser().getUserId()); // set created by to user id from current logged in 
     
        Date date= new Date();
        long time = date.getTime();
	letter.setDateCreated(new Timestamp(time)); // set date requested to current datetime

        letter.setStatusId(3); // set status to pencil book
        
        int result = 0;
        if (letter.getLetterId() == 0){
            result = letterService.CreateLetter(letter);
        }
        else {
            result = letterService.UpdateLetter(letter);
        }

        user.setUserId(result);

        return user;
     
    }
    
    @RequestMapping(value = "/getLetter", method = RequestMethod.GET)
    @ResponseBody
    public List<Letter> getLetter( HttpServletRequest request){        
        List<Letter> letterList  = letterService.getLetter();
        return letterList;
    }
    
    @RequestMapping(value = "/deleteLetter", method = RequestMethod.POST)
    @ResponseBody
    public MyUser deleteLetter(@RequestBody Letter letter, HttpServletRequest request){
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        MyUser user = new MyUser();

        letter.setCreatedBy(currentUser.getUser().getUserId()); // set created by to user id from cookie 
    
        int result = letterService.DeleteLetter(letter);

        user.setUserId(result);

        return user;
    }
}
