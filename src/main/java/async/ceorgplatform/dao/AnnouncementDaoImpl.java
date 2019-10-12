/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Announcement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
public class AnnouncementDaoImpl implements AnnouncementDao {
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    Date date= new Date();
    long time = date.getTime();
    
    public int UpdateAnnouncement(Announcement request){
        int result = 0;
        String sql = "update announcement set announcement_name = ? , author = ? , announcement =? , date_created = ?, remarks = ? where announcement_id = ?";
        result = jdbcTemplate.update(sql, new Object[]{request.getAnnouncementName(),request.getAuthor(), request.getAnnouncement(), request.getDateCreated(), request.getRemarks(), request.getAnnouncementId()});
        
        String sqlDelete = "delete from recipient where announcement_id = ?";
        jdbcTemplate.update(sqlDelete, new Object[]{request.getAnnouncementId()});
            
        for(Announcement.Recipient _request: request.recipient){
            String sqlInsert = "insert into recipient (announcement_id, announced_to, date_created, created_by values(?,?,?,?)";
            jdbcTemplate.update(sqlInsert, new Object[]{request.getAnnouncementId(), _request.getAnnouncedTo(), new Timestamp(time), request.getCreatedBy()});
        }
        
        return result;
    }
    
    
    
    public int DeleteAnnouncement(Announcement request){

        
        
        String sql = "update announcement set status_id = 2 where announcement_id = ?";
            int result = jdbcTemplate.update(sql, new Object[]{request.getAnnouncementId()});
        
        String sqlRecipient = "update recipient set status_id = 2 where announcement_id = ?";
            jdbcTemplate.update(sqlRecipient, new Object[]{request.getAnnouncementId()});
          
        return result;    
    }
    
    public int CreateAnnouncement(Announcement request) {

        int result = 0;
        String sql = "insert into announcement (announcement_name, author, announcement, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,?)";
            result = jdbcTemplate.update(sql, new Object[] { request.getAnnouncementName(), request.getAuthor(), request.getAnnouncement(), request.getDateCreated(),
            request.getCreatedBy(), request.getRemarks(), 6});
        
        String lastInsertId = "select MAX(announcement_id) as announcement_id from announcement";
        List<Announcement> requestList = jdbcTemplate.query(lastInsertId, new AnnouncementDaoImpl.IDMapper());
            
        for(Announcement.Recipient requestRecipient : request.recipient){
            String sqlRecipient = "insert  into recipient (announcement_id, announced_to, date_created, created_by, status_id) values(?,?,?,?,?)";
            jdbcTemplate.update(sqlRecipient, new Object[]{requestList.get(0).getAnnouncementId(), requestRecipient.getAnnouncedTo(), request.getDateCreated(), request.getCreatedBy(), 1});            
        }
        return result;
    }
    
    public List<Announcement> getAnnouncement(){
        String sql = "Select * from announcement as a inner join organizations as o on a.created_by = o.org_id where a.status_id = 6 or a.status_id = 7";
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
            announcement.setCreatedByName(rs.getString("org_name"));
            announcement.setDateCreated(rs.getDate("date_created"));
            announcement.setRemarks(rs.getString("remarks"));
            announcement.setStatusId(rs.getInt("status_id"));
            for(Announcement.Recipient _recipient : announcement.recipient){
                _recipient.setAnnouncedTo(rs.getInt("announced_to"));
            }
            return announcement;
        }
    }
    
    class IDMapper implements RowMapper<Announcement>{
     
        public Announcement mapRow(ResultSet rs, int arg1) throws SQLException{
            Announcement announcement = new Announcement();
            
            announcement.setAnnouncementId(rs.getInt("announcement_id"));
           
            return announcement;
        }
    }
}