/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Helper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Kate Dianne
 */
public class HelperDao {
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    public String ControlNumber (int userId, int typeId, int number ){

        
        String orgName = "Select o.code_name from users as u inner join organizations as o on u.org_id = o.org_id where u.user_id = " + userId;
        List<Helper.OrgName> orgCodeNameList =jdbcTemplate.query(orgName, new HelperDao.OrgNameMapper());
        
        String typeCodeName = "Select code_name from letter_types where letter_type_id = " + typeId;
        List<Helper.LetterType> letterTypeList =jdbcTemplate.query(typeCodeName, new HelperDao.TypeIdMapper());
        
        String sqlLetterId = "select MAX(letter_id) as letter_id from letters";
        List<Helper.LetterId> letterIdList =jdbcTemplate.query(sqlLetterId, new HelperDao.LetterIdMapper());
        
        String letterTypeCodeName = "";
        for(Helper.LetterType _letterType : letterTypeList){
            letterTypeCodeName = _letterType.getLetterType();
        }
        
        String orgCodeName = "";
        for(Helper.OrgName _orgName : orgCodeNameList){
            orgCodeName = _orgName.getCodeName();
        }
        
        String letterIdValue = "";
        for(Helper.LetterId _letterId : letterIdList){
            letterIdValue = StringUtils.leftPad(Integer.toString(_letterId.getLetterId()+1), 5, "0");
        }
         
        
        String ctrlNumber = orgCodeName + "-" + letterTypeCodeName + "-" + letterIdValue + "-" + StringUtils.leftPad(Integer.toString(number), 2, "0");
        
        return ctrlNumber;
    }
    
    class OrgNameMapper implements RowMapper<Helper.OrgName>{
     
        public Helper.OrgName mapRow(ResultSet rs, int arg1) throws SQLException{
            Helper.OrgName dbGet = new Helper.OrgName();
            
            dbGet.setCodeName(rs.getString("code_name"));
            
            return dbGet;
        }
    }
    
    class TypeIdMapper implements RowMapper<Helper.LetterType>{
     
        public Helper.LetterType mapRow(ResultSet rs, int arg1) throws SQLException{
            Helper.LetterType dbGet = new Helper.LetterType();
            dbGet.setLetterType(rs.getString("code_name"));
            
            return dbGet;
        }
    }
    
    class LetterIdMapper implements RowMapper<Helper.LetterId>{
     
        public Helper.LetterId mapRow(ResultSet rs, int arg1) throws SQLException{
            Helper.LetterId dbGet = new Helper.LetterId();
            dbGet.setLetterId(rs.getInt("letter_id"));
            
            return dbGet;
        }
    }
}
