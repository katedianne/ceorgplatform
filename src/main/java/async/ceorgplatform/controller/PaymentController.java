package async.ceorgplatform.controller;

import async.ceorgplatform.model.MyUser;
import async.ceorgplatform.model.Payment;
import async.ceorgplatform.model.UserPrincipal;
import async.ceorgplatform.service.PaymentService;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
    
     @RequestMapping(value = "/addPayment", method = RequestMethod.POST)
    @ResponseBody
    public MyUser addPayment(@RequestBody Payment payment, HttpServletRequest request){
       UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
       MyUser user = new MyUser();
     
       payment.setCreatedBy(currentUser.getUser().getUserId()); // set created by to user id from current logged in 
     
        Date date= new Date();
        long time = date.getTime();
	payment.setDateCreated(new Timestamp(time)); // set date requested to current datetime

        payment.setStatusId(3); // set status to pencil book
        
        int result = 0;
        if (payment.getPaymentId() == 0){
            result = paymentService.CreatePayment(payment);
        }
        else {
            result = paymentService.UpdatePayment(payment);
        }

        user.setUserId(result);

        return user;
     
    }
    
    @RequestMapping(value = "/getPayment", method = RequestMethod.GET)
    @ResponseBody
    public List<Payment> getPayment( HttpServletRequest request){        
        List<Payment> reservationList  = paymentService.getPayment();
        return reservationList;
    }
    
    
    @RequestMapping(value = "/deletePayment", method = RequestMethod.POST)
    @ResponseBody
    public MyUser deletePayment(@RequestBody Payment payment, HttpServletRequest request){
        UserPrincipal currentUser = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        MyUser user = new MyUser();

        payment.setCreatedBy(currentUser.getUser().getUserId()); // set created by to user id from cookie 
    
        int result = paymentService.DeletePayment(payment);

        user.setUserId(result);

        return user;
    }
}
