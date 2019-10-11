/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Payment;
import async.ceorgplatform.model.Payment.UpdateTrail;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Kate Dianne
 */
public class PaymentDaoImpl implements PaymentDao {
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public void CreatePayment(Payment payment) {

    String sql = "insert into payments (payment_balance, principal_amount, org_id, payment_name, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,?,8)";

    jdbcTemplate.update(sql, new Object[] { payment.getPaymentBalance(), payment.getPrincipalAmount(), payment.getOrgId(),
        payment.getPaymentName(), payment.getDateCreated(), payment.getCreatedBy(), payment.getRemarks()});
    }
    
    public int EditPayment(Payment request){
        String sql = "update payments set payment_balance = ?, principal_amount = ?, payment_name = ?, created_by = ?, remarks = ? where payment_id = ? ";
        int result = jdbcTemplate.update(sql, new Object[] {request.getPaymentBalance(), request.getPrincipalAmount(), request.getPaymentName(), request.getRemarks(), request.getPaymentId()});
        return result;
    }
    
    public void UpdatePayment(Payment payment) {
        double paymentAmount = 0;
        for(Payment.UpdateTrail _request : payment.updateTrail){
            String sqlInsert = "insert into update_trail (payment_id, status_from, status_to, payment_balance, payment_amount, date_created, created_by, remarks, status_id values (?,?,?,?,?,?,?,?,1)";
            jdbcTemplate.update(sqlInsert, new Object[] { _request.getPaymentId(), _request.getStatusFrom(), _request.getStatusTo(),_request.getPaymentBalance(),
                _request.getPaymentAmount(), payment.getDateCreated(), payment.getCreatedBy(), payment.getRemarks()});
            paymentAmount = _request.getPaymentAmount();
        }
        String sqlSelect = "select payment_balance from payments where payment_id = " + payment.getPaymentId();
        List<Payment> paymentList = jdbcTemplate.query(sqlSelect, new PaymentDaoImpl.PaymentMapper());
        
        double paymentBalance = 0;
        for(Payment _paymentBalance : paymentList){
            paymentBalance = _paymentBalance.getPaymentBalance();
        }
        
        String sql = "update payments set payment_balance = ?, created_by = ? , remarks = ? where payment_id = ?";
        jdbcTemplate.update(sql, new Object[] { paymentBalance - paymentAmount, payment.getCreatedBy(), payment.getRemarks(), payment.getPaymentId()});
        
        if (paymentAmount == paymentBalance){
            String sqlUpdateStatus = "update payments set status_id = 9 where payment_id = ?";
            jdbcTemplate.update(sqlUpdateStatus, new Object[] {payment.getPaymentId()});
        }
    
    }
    
    public List<Payment> getPayment(){
        String sql = "Select * from payments as p where p.status_id = 1";
        List<Payment> payment = jdbcTemplate.query(sql, new PaymentDaoImpl.PaymentMapper());
        return payment;
    }
    
    class PaymentMapper implements RowMapper<Payment>{
     
        public Payment mapRow(ResultSet rs, int arg1) throws SQLException{
            Payment payment = new Payment();
            
            payment.setPaymentId(rs.getInt("payment_id"));
            payment.setPaymentBalance(rs.getDouble("payment_balance"));
            payment.setPrincipalAmount(rs.getDouble("principal_amount"));
            payment.setOrgId(rs.getInt("org_id"));
            payment.setPaymentName(rs.getString("payment_name"));
            payment.setDateCreated(rs.getTimestamp("date_created"));
            payment.setCreatedBy(rs.getInt("created_by"));
            payment.setRemarks(rs.getString("remarks"));
            payment.setStatusId(rs.getInt("status_id"));
            return payment;
        }
    }
}
