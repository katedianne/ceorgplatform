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

    String sql = "insert into payments (payment_balance, principal_amount, org_id, payment_name, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,?)";

    jdbcTemplate.update(sql, new Object[] { payment.getPaymentBalance(), payment.getPrincipalAmount(), payment.getOrgId(),
        payment.getPaymentName(), payment.getDateCreated(), payment.getCreatedBy(), payment.getRemarks(), payment.getStatusId()});
    }
    
    public void UpdatePayment(Payment payment) {
    
    String sqlInsert = "insert into update_trail (payment_id, status_from, status_to, payment_balance, payment_amount, date_created, created_by, remarks, status_id values (?,?,?,?,?,?,?,?,?)";
    
    jdbcTemplate.update(sqlInsert, new Object[] { payment.updateTrail.getPaymentId(), payment.updateTrail.getStatusFrom(), payment.updateTrail.getStatusTo(),
        payment.updateTrail.getPaymentBalance(), payment.updateTrail.getPaymentAmount(), payment.updateTrail.getDateCreated(), payment.updateTrail.getCreatedBy(), payment.updateTrail.getRemarks(), payment.getStatusId()});
    
    String sqlSelect = "select payment_balance from update_trail where update_trail_id = 1 ";
    
    String sql = "update payments set payment_balance = ?, created_by = ? , remarks = ";
    jdbcTemplate.update(sql, new Object[] { payment.getPaymentBalance(), payment.getCreatedBy(), payment.getRemarks()});
    }
    
    public List<Payment> getPayment(){
        String sql = "Select * from payments as p where p.status_id = 1";
        List<Payment> payment = jdbcTemplate.query(sql, new PaymentDaoImpl.PaymentMapper());
        return payment;
    }
    
    class PaymentMapper implements RowMapper<Payment>{
     
        public Payment mapRow(ResultSet rs, int arg1) throws SQLException{
            Payment payment = new Payment();
            
            payment.setPaymentBalance(rs.getDouble("payment_balance"));
            payment.setPrincipalAmount(rs.getInt("principal_amount"));
            payment.setOrgId(rs.getInt("org_id"));
            payment.setPaymentName(rs.getString("payment_name"));
            payment.setDateCreated(rs.getTimestamp("date_created"));
            payment.setCreatedBy(rs.getInt("created_by"));
            payment.setRemarks(rs.getString("remarks"));
            payment.setStatusId(rs.getInt("status_id"));
            payment.updateTrail.setPaymentBalance(rs.getDouble("payment_balance"));
            return payment;
        }
    }
}
