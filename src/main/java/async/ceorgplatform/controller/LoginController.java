/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import async.ceorgplatform.model.Login;
import async.ceorgplatform.model.MyUser;
import async.ceorgplatform.model.UserPrincipal;
import async.ceorgplatform.service.UserService;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author JC
 */
@Controller
public class LoginController {

    @Autowired
    UserService userService;
    
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("login");
        mav.addObject("login", new Login());
        return mav;
    }
    
     @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView showHome( HttpServletRequest request, HttpServletResponse response){
 
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
  
        ModelAndView mav = new ModelAndView("home");
        mav.addObject("currentRoleId", currentUser.getUser().getRoleId());
        mav.addObject("currentUserId", currentUser.getUser().getUserId());
        mav.addObject("currentOrgId", currentUser.getUser().getOrgId());
        mav.addObject("currentOrgName", currentUser.getUser().getOrg());
        
        return mav;
    }

//    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
//    @ResponseBody
//    public User loginProcess(@RequestBody Login login, HttpServletRequest request, HttpServletResponse response) {
//       
//       
//        
//        
//             
//    }
    
//    @RequestMapping(value="/logout", method = RequestMethod.GET)
//    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
//       Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//       if (auth != null){    
//          new SecurityContextLogoutHandler().logout(request, response, auth);
//       }
//       return "login";
//    }
    


//   @RequestMapping(value = "/login", method = RequestMethod.GET)
//   public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
//        ModelAndView mav = new ModelAndView("login");
//        mav.addObject("login", new Login());
//        return mav;
//    }
//  @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
//  public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
//  @ModelAttribute("login") Login login) {
//        ModelAndView mav = null;
//        
//        User user = userService.validateUser(login);
//        
//        if (null != user) {
//        mav = new ModelAndView("welcome");
//        mav.addObject("firstname", user.getFirstName());
//        } 
//        else {
//        mav = new ModelAndView("login");
//        mav.addObject("message", "Username or Password is wrong!!");
//        }
//        return mav;
//    }
}
