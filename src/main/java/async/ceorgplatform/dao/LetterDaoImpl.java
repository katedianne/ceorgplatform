/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Letter;
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
public class LetterDaoImpl implements LetterDao {
    
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
  
    @Autowired
    HelperDao helper;
    
    public int CreateLetter(Letter letter) {

    String sqlLetter = "insert into letters (letter_number, letter_name, letter_type_id, control_number, date_released, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,?,?,?)";

    int result = jdbcTemplate.update(sqlLetter, new Object[] { 1, letter.getLetterName(), letter.getLetterTypeId(), helper.ControlNumber(letter.getCreatedBy(), letter.getLetterTypeId(), 1) /*"ORG-"+letter.getLetterTypeId()+"-ID"+"-LN"*/,
        letter.getDateReleased(), letter.getDateCreated(), letter.getCreatedBy(), letter.getRemarks(), 1});
    
//    String sqlLetterType = "insert into letter_types (letter_type_name, date_created, created_by, status_id ) values(?,?,?,?)";
//    
//    jdbcTemplate.update(sqlLetterType, new Object[] { letter.letterType.getLetterTypeName(), letter.getDateCreated(), letter.getCreatedBy(), letter.getStatusId()});
    return result;
    }
    
    public List<Letter> getLetter(){
        String sql = "Select * from letters as l inner join letter_types as lt on l.letter_type_id = lt.letter_type_id where l.status_id = 1";
        List<Letter> letter = jdbcTemplate.query(sql, new LetterDaoImpl.LetterMapper());
        return letter;
    }
    
    public int DeleteLetter(Letter letter){
        String sql = "update letters set status_id = 2 where letter_id = ?";
        int result = jdbcTemplate.update(sql, new Object[]{letter.getLetterId()});
        return result;
    }
    
    class LetterMapper implements RowMapper<Letter>{
     
        public Letter mapRow(ResultSet rs, int arg1) throws SQLException{
            Letter letter = new Letter();
            
            letter.setLetterId(rs.getInt("letter_id"));
            letter.setLetterNumber(rs.getString("letter_number"));
            letter.setLetterTypeId(rs.getInt("letter_type_id"));
            letter.setLetterTypeName(rs.getString("letter_type_name"));
            letter.setControlNumber(rs.getString("control_number"));
            letter.setDateReleased(rs.getDate("date_released"));
            letter.setDateCreated(rs.getDate("date_created"));
            letter.setCreatedBy(rs.getInt("created_by"));
            letter.setRemarks(rs.getString("remarks"));
            letter.setStatusId(rs.getInt("status_id"));
            letter.letterType.setLetterTypeId(rs.getInt("letter_type_id"));
            letter.letterType.setLetterTypeName(rs.getString("letter_type_name"));
            letter.letterType.setStatusId(rs.getInt("status_id"));
            return letter;
        }
    }
}
