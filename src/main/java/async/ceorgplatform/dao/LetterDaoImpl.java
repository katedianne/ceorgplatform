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
    
    public void CreateLetter(Letter letter) {

    String sqlLetter = "insert into letter (letter_number, letter_type_id, control_number, date_released, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,?)";

    jdbcTemplate.update(sqlLetter, new Object[] { letter.getLetterNumber(), letter.getLetterTypeId(), letter.getControlNumber(),
        letter.getDateReleased(), letter.getDateCreated(), letter.getCreatedBy(), letter.getRemarks(), letter.getStatusId()});
    
    String sqlLetterType = "insert into letter_types (letter_type_name, date_created, created_by, status_id ) values(?,?,?,?)";
    
    jdbcTemplate.update(sqlLetterType, new Object[] { letter.letterType.getLetterTypeName(), letter.getDateCreated(), letter.getCreatedBy(), letter.getStatusId()});
    }
    
    public List<Letter> getLetter(){
        String sql = "Select * from letters as ltt inner join letter_types where ltt.status_id = 1";
        List<Letter> letter = jdbcTemplate.query(sql, new LetterDaoImpl.LetterMapper());
        return letter;
    }
    
    class LetterMapper implements RowMapper<Letter>{
     
        public Letter mapRow(ResultSet rs, int arg1) throws SQLException{
            Letter letter = new Letter();
            
            letter.setLetterId(rs.getInt("letter_id"));
            letter.setLetterNumber(rs.getString("letter_number"));
            letter.setLetterTypeId(rs.getInt("letter_type_id"));
            letter.setControlNumber(rs.getString("control_number"));
            letter.setDateReleased(rs.getTimestamp("date_released"));
            letter.setDateCreated(rs.getTimestamp("date_created"));
            letter.setCreatedBy(rs.getInt("created_by"));
            letter.setRemarks(rs.getString("remarks"));
            letter.setStatusId(rs.getInt("status_id"));
            letter.letterType.setLetterTypeId(rs.getInt("letter_type_id"));
            letter.letterType.setLetterTypeName(rs.getString("letetr_type_name"));
            letter.letterType.setStatusId(rs.getInt("status_id"));
            return letter;
        }
    }
}
