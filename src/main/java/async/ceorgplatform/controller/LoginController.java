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
    public String showHome(){
        return "home";
    }

    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
    public ModelAndView loginProcess(@ModelAttribute("login") Login login, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = null;

        User user = userService.validateUser(login);

        if (user != null) {
            mav = new ModelAndView("home");
            Cookie cookie1 = new Cookie("UserId", Integer.toString(user.getUserId()));
            Cookie cookie2 = new Cookie("RoleId", Integer.toString(user.getRoleId()));
            Cookie cookie3 = new Cookie("IsLogin", Integer.toString(1));
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.addCookie(cookie3);
        } else {
            mav = new ModelAndView("login");
            mav.addObject("message", "Username or Password is wrong!!");
        }
        return mav;
    }



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
