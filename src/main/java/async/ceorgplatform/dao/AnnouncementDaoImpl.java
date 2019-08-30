/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Announcement;
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
public class AnnouncementDaoImpl implements AnnouncementDao {
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public void UpdateAnnouncement(Announcement request){
        String sql = "update announcement set announcement_name = ? , author = ? , announcement =? , date_created = ?, remarks = ? where announcement_id = ?";
        jdbcTemplate.update(sql, new Object[]{request.getAnnouncementName(),request.getAuthor(), request.getAnnouncement(), request.getDateCreated(), request.getRemarks(), request.getAnnouncementId()});
    }
    
    public void UpdateRecipient(List<Announcement> request){
        for(Announcement _request: request){
            String sqlDelete = "delete from recipient where announcement_id = ?";
            jdbcTemplate.update(sqlDelete, new Object[]{_request.recipient.getAnnouncementId()});
            
            String sqlInsert = "insert into recipient (announcement_id, announced_to, date_created, created_by, status_id values(?,?,?,?,?)";
            jdbcTemplate.update(sqlInsert, new Object[]{_request.recipient.getAnnouncementId(), _request.recipient.getAnnouncedTo(), });
        }
    }
    
    public void DeleteAnnouncement(List<Announcement> request){
        for(Announcement _request : request){
            String sql = "update announcement set status_id = 2 where announcement_id = ?";
            jdbcTemplate.update(sql, new Object[]{_request.getAnnouncementId()});
        }
        
        for(Announcement _request : request){
            String sqlRecipient = "update recipent set status_id = 2 where announcement_id = ?";
            jdbcTemplate.update(sqlRecipient, new Object[]{_request.getAnnouncementId()});
        }
    }
    
    public void CreateAnnouncement(List<Announcement> _request) {

    for(Announcement request : _request){
        String sql = "insert into announcement (announcement_name, author, announcement, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, new Object[] { request.getAnnouncementName(), request.getAuthor(), request.getAnnouncement(), request.getDateCreated(),
        request.getCreatedBy(), request.getRemarks(), request.getStatusId()});
    }
    
    for(Announcement request : _request){
        String sql = "insert  into recipient (announcement_id, announced_to, date_created, created_by, status_id) values(?,?,?,?,?)";
        jdbcTemplate.update(sql, new Object[]{request.recipient.getAnnouncementId(), request.recipient.getAnnouncedTo(), request.recipient.getDateCreated(), request.recipient.getCreatedBy(), request.recipient.getStatusId()});
    }
    }
    public List<Announcement> getAnnouncement(){
        String sql = "Select * from announcement as a inner join recipient as r on a.announcement_id=r.announcement_id where a.status_id = 1";
        List<Announcement> announcement = jdbcTemplate.query(sql, new AnnouncementDaoImpl.AnnouncementMapper());
        return announcement;
    }
    
    class AnnouncementMapper implements RowMapper<Announcement>{
     
        public Announcement mapRow(ResultSet rs, int arg1) throws SQLException{
            Announcement announcement = new Announcement();
            
            announcement.setAnnouncementId(rs.getInt("announcement_id"));
            announcement.setAnnouncementName(rs.getString("announcement_name"));
            announcement.setAuthor(rs.getInt("author"));
            announcement.setAnnouncement(rs.getString("announcement"));
            announcement.setCreatedBy(rs.getInt("created_by"));
            announcement.setDateCreated(rs.getTimestamp("date_created"));
            announcement.setRemarks(rs.getString("remarks"));
            announcement.setStatusId(rs.getInt("status_id"));
            announcement.recipient.setRecipientId(rs.getInt("recipient_id"));
            announcement.recipient.setAnnouncementId(rs.getInt("announcement_id"));
            announcement.recipient.setAnnouncedTo(rs.getInt("announced_to"));
            announcement.recipient.setDateCreated(rs.getTimestamp("date_created"));
            announcement.recipient.setCreatedBy(rs.getInt("created_by"));
            announcement.recipient.setStatusId(rs.getInt("status_id"));
            return announcement;
        }
    }
}
