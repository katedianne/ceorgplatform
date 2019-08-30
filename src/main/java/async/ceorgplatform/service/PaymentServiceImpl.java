/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.dao.PaymentDao;
import async.ceorgplatform.model.Payment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Kate Dianne
 */
public class PaymentServiceImpl {
    @Autowired
    public PaymentDao paymentDao;
    
    public void CreatePayment(Payment payment){
        paymentDao.CreatePayment(payment);
    }
    
    public void UpdatePayment(Payment payment){
        paymentDao.UpdatePayment(payment);
    }
    
    public List<Payment> getPayment(){
        return paymentDao.getPayment();
    }
}
