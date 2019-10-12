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
public class PaymentServiceImpl implements PaymentService {
    @Autowired
    public PaymentDao paymentDao;
    
    public int CreatePayment(Payment payment){
       return paymentDao.CreatePayment(payment);
    }
    
    public int EditPayment(Payment request){
        return paymentDao.EditPayment(request);
    }
    
    public int UpdatePayment(Payment payment){
       return paymentDao.UpdatePayment(payment);
    }
    
    public List<Payment> getPayment(){
        return paymentDao.getPayment();
    }

    @Override
    public int DeletePayment(Payment payment) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
