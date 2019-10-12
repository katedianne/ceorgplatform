package async.ceorgplatform.controller;

import async.ceorgplatform.model.UserPrincipal;
import async.ceorgplatform.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Kate Dianne
 */
@Controller 
public class PaymentController {
    
    @Autowired
    PaymentService paymentService;
    
    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public ModelAndView showPayment(){
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ModelAndView mav = new ModelAndView("payment");
        mav.addObject("currentRoleId", currentUser.getUser().getRoleId());
        mav.addObject("currentUserId", currentUser.getUser().getUserId());
        mav.addObject("currentOrgId", currentUser.getUser().getOrgId());
        
        return mav;
    }
}
