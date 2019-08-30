/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

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
public class OrganizationDaoImpl implements OrganizationDao {
    @Autowired
    DataSource datasource;
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public void UpdateOrganization(Organization request){
        String sql = "update organizations set org_name = ? , org_adviser = ? , date_created = ?, dept_id = ? where org_id = ?";
        jdbcTemplate.update(sql, new Object[]{request.getOrgName(),request.getOrgAdviser(), request.getDateCreated(), request.getDeptId(), request.getOrgId()});
    }
    
    public void DeleteOrganization(Organization request){
        String sql = "update organizations set status_id = 2 where org_id = ?";
        jdbcTemplate.update(sql, new Object[]{request.getOrgId()});
    }
    
    public void CreateOrganization(Organization request) {

    String sql = "insert into organizations (org_name, org_adviser, date_created, created_by, dept_id, status_id) values(?,?,?,?,?,?)";

    jdbcTemplate.update(sql, new Object[] { request.getOrgName(), request.getOrgAdviser(), request.getDateCreated(),
        request.getCreateadBy(), request.getDeptId(), request.getStatusId()});
    }
    public List<Organization> getOrganization(){
        String sql = "Select * from organizations where status_id = 1";
        List<Organization> organization = jdbcTemplate.query(sql, new OrganizationDaoImpl.OrganizationMapper());
        return organization;
    }
    
    class OrganizationMapper implements RowMapper<Organization>{
     
        public Organization mapRow(ResultSet rs, int arg1) throws SQLException{
            Organization organization = new Organization();
            
            organization.setOrgId(rs.getInt("org_id"));
            organization.setOrgName(rs.getString("org_name"));
            organization.setOrgAdviser(rs.getString("org_adviser"));
            organization.setCreatedBy(rs.getInt("created_by"));
            organization.setDateCreated(rs.getTimestamp("date_created"));
            organization.setDeptId(rs.getInt("dept_id"));
            organization.setStatusId(rs.getInt("description"));
            return organization;
        }
    }
    
}
