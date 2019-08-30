/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Activity;
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
public class ActivityDaoImpl implements ActivityDao {
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public void UpdateActivity(Activity activity){
        String sql = "update activities set activity_name = ? , activty_start_date= ? , activity_end_date = ? , description = ?, date_created = ?, remarks = ? where activity_id = ?";
        jdbcTemplate.update(sql, new Object[]{activity.getActivityName(),activity.getActivityStartDate(), activity.getActivityEndDate(), activity.getDescription(), activity.getDateCreated(), activity.getRemarks(), activity.getActivityId()});
    }
    
    public void DeleteActivity(Activity activity){
        String sql = "update activities set status_id = 2 where activity_id = ?";
        jdbcTemplate.update(sql, new Object[]{activity.getActivityId()});
    }
    
    public void CreateActivity(Activity activity) {

    String sql = "insert into activities (activity_name, activity_start_date, activity_end_date, desciption, date_created, created_by, remarks, status_id) values(?,?,?,?,?,?,?,?)";

    jdbcTemplate.update(sql, new Object[] { activity.getActivityName(), activity.getActivityStartDate(), activity.getActivityEndDate(),
        activity.getDescription(), activity.getDateCreated(), activity.getCreatedBy(), activity.getRemarks(), activity.getStatusId()});
    
    }
    
    public List<Activity> getActivity(){
        String sql = "Select * from activities where status_id = 1";
        List<Activity> activity = jdbcTemplate.query(sql, new ActivityDaoImpl.ActivityMapper());
        return activity;
    }
    
    class ActivityMapper implements RowMapper<Activity>{
     
        public Activity mapRow(ResultSet rs, int arg1) throws SQLException{
            Activity activity = new Activity();
            
            activity.setActivityId(rs.getInt("activity_id"));
            activity.setActivityName(rs.getString("activity_name"));
            activity.setActivityStartDate(rs.getTimestamp("activity_start_date"));
            activity.setActivityEndDate(rs.getTimestamp("activity_end_date"));
            activity.setDescription(rs.getString("description"));
            activity.setCreatedBy(rs.getInt("created_by"));
            activity.setDateCreated(rs.getTimestamp("date_created"));
            activity.setStatusId(rs.getInt("status_id"));
            activity.setRemarks(rs.getString("remarks"));
            return activity;
        }
    }
}
