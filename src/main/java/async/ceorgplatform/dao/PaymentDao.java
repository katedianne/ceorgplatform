/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Payment;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public interface PaymentDao {
    int EditPayment(Payment request);
    void CreatePayment(Payment payment);
    void UpdatePayment(Payment payment);
    List<Payment> getPayment();
}
