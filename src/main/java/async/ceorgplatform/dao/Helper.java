/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Letter;
import async.ceorgplatform.model.Organization;
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
public class Helper {
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    public String ControlNumber (int userId, int typeId, int letterId, int number ){
        Organization org = new Organization();
        Letter letter = new Letter();
        
        String orgName = "Select o.org_name from users as u inner join organizations as o on u.org_id = o.org_id where u.user_id = " + userId;
        jdbcTemplate.query(orgName, new Helper.OrgNameMapper());
        
        String typeCodeName = "Select code_name from letter_types where letter_type_id = " + typeId;
        jdbcTemplate.query(typeCodeName, new Helper.TypeIdMapper());
        
        String ctrlNumber = "";
        ctrlNumber = org.getOrgName().toUpperCase() + "-" + letter.getCodeName().toUpperCase() + "-" + letterId + number;
        
        return ctrlNumber;
    }
    
    class OrgNameMapper implements RowMapper<Organization>{
     
        public Organization mapRow(ResultSet rs, int arg1) throws SQLException{
            Organization dbGet = new Organization();
            
            dbGet.setOrgName(rs.getString("org_name"));
            return dbGet;
        }
    }
    
    class TypeIdMapper implements RowMapper<Letter>{
     
        public Letter mapRow(ResultSet rs, int arg1) throws SQLException{
            Letter dbGet = new Letter();
            dbGet.setCodeName(rs.getString("code_name"));
            return dbGet;
        }
    }
}
