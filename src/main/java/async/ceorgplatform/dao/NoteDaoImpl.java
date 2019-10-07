/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Note;
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
public class NoteDaoImpl implements NoteDao {
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public int UpdateNote(Note request){
        String sql = "update notes set note_title = ? , note = ? , remarks = ? where note_id = ?";
        int result = jdbcTemplate.update(sql, new Object[]{request.getNoteTitle(),request.getNote(), request.getRemarks(), request.getNoteId()});
        return result;
    }
    
    public int DeleteNote(Note request){
        String sql = "update note set status_id = 2 where note_id = ?";
        int result = jdbcTemplate.update(sql, new Object[]{request.getNoteId()});
        return result;
    }
    
    public int CreateNote(Note request) {

        String sql = "insert into notes (note_id, note_tile, note, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,1)";

        int result = jdbcTemplate.update(sql, new Object[] { request.getNoteId(), request.getNoteTitle(), request.getNote(), request.getDateCreated(),
            request.getCreatedBy(), request.getRemarks()});
        return result;
    }
    public List<Note> getNote(){
        String sql = "Select n.note_id, n.note_title, n.note, n.date_created, n.created_by, n.remarks, s.status_name from notes as n inner join statuses as s on n.status_id = s.status_id where s.status_id = 1";
        List<Note> notes = jdbcTemplate.query(sql, new NoteDaoImpl.NoteMapper());
        return notes;
    }
    
    class NoteMapper implements RowMapper<Note>{
     
        public Note mapRow(ResultSet rs, int arg1) throws SQLException{
            Note getDB = new Note();
            
            getDB.setNoteId(rs.getInt(1));
            getDB.setNoteTitle(rs.getString(2));
            getDB.setNote(rs.getString(3));
            getDB.setDateCreated(rs.getTimestamp(4));
            getDB.setCreatedBy(rs.getInt(5));
            getDB.setRemarks(rs.getString(6));
            getDB.setStatusId(rs.getInt(7));
            return getDB;
        }
    }
}
