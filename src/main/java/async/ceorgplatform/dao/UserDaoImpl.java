/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Login;
import async.ceorgplatform.model.MyUser;
import async.ceorgplatform.model.UserPrincipal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author JC
 */
public class UserDaoImpl implements UserDao, UserDetailsService {

    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public MyUser validateUser(Login login) {
       
//        String sql = "SELECT * FROM users WHERE username = '" + login.getUsername() + "' and password= '" + login.getPassword() + "'";
//        
//        List<MyUser> user = jdbcTemplate.query(sql, new UserMapper());

       
        String sql2 = "SELECT user_id, role_id, username, org_id from users where username = '" + login.getUsername() + "'";
        List<MyUser> user = jdbcTemplate.query(sql2, new UserMapper());
        return user.get(0);
        

    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException  {
        
        
        String sql = "SELECT u.*, concat('ROLE_', role) role FROM users u inner join roles r on u.role_id = r.role_id WHERE username = '" + username + "'";
        List<MyUser> user = jdbcTemplate.query(sql, new UserMapper());
        if (user == null) {
            throw new UsernameNotFoundException(username);
        }
        return new UserPrincipal(user.get(0));
    }
    
    
    class UserMapper implements RowMapper<MyUser>{
        public MyUser mapRow(ResultSet rs, int arg1) throws SQLException{
            MyUser user = new MyUser();
            
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            user.setUserId(rs.getInt("user_id"));
            user.setRoleId(rs.getInt("role_id"));
            user.setOrgId(rs.getInt("org_id"));

            return user;
             
        }
    
    
    }
}