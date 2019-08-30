/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Login;
import async.ceorgplatform.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author JC
 */
public class UserDaoImpl implements UserDao{

    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public User validateUser(Login login) {
       
        String sql = "SELECT * FROM users WHERE username = '" + login.getUsername() + "' and password= '" + login.getPassword() + "'";
        
        List<User> user = jdbcTemplate.query(sql, new UserMapper());

        if(user.size() > 0){
            String sql2 = "SELECT user_id, role_id, username, org_id from users";
            user = jdbcTemplate.query(sql, new UserMapper());
            return user.get(0);
        }
        else return null;
    }
    
    class UserMapper implements RowMapper<User>{
        public User mapRow(ResultSet rs, int arg1) throws SQLException{
            User user = new User();
            
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setUserId(rs.getInt("user_id"));
            user.setRoleId(rs.getInt("role_id"));
            user.setOrgId(rs.getInt("org_id"));

            return user;
             
        }
    
    
    }
}