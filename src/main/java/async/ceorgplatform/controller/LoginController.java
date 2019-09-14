/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import async.ceorgplatform.model.Login;
import async.ceorgplatform.model.User;
import async.ceorgplatform.service.UserService;
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
    public String showHome(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("UserId")) {
                 //   .setCreatedBy(Integer.parseInt(cookie.getValue())); // set created by to user id from cookie 
                }  
            }
        }
        return "home";
    }

    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
    @ResponseBody
    public User loginProcess(@RequestBody Login login, HttpServletRequest request, HttpServletResponse response) {
       
        User user = userService.validateUser(login);

        if (user != null) {
           
            Cookie cookie1 = new Cookie("UserId", Integer.toString(user.getUserId()));
            Cookie cookie2 = new Cookie("RoleId", Integer.toString(user.getRoleId()));
            Cookie cookie3 = new Cookie("IsLogin", Integer.toString(1));
            cookie1.setMaxAge(60 * 60 * 24); // expire in 86400 secs
            cookie2.setMaxAge(60 * 60 * 24); // expire in 1 day
            cookie3.setMaxAge(60 * 60 * 24); // expire in 1 day
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.addCookie(cookie3);
             return user;
        }
        else {
            return  new User();
        }
        
        
             
    }
    
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
