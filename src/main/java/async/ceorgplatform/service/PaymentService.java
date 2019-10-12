/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.model.Payment;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public interface PaymentService {
    int CreatePayment(Payment payment);
    int EditPayment(Payment request);
    int UpdatePayment(Payment payment);
    int DeletePayment(Payment payment);
    List<Payment> getPayment();
}
