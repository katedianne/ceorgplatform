/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.dao.OrganizationDao;
import async.ceorgplatform.model.Organization;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Kate Dianne
 */
public class OrganizationServiceImpl implements OrganizationService{
    @Autowired
    public OrganizationDao organizationDao;
    
    public void UpdateOrganization(Organization request){
        organizationDao.UpdateOrganization(request);
    }
    
    public void DeleteOrganization(Organization request){
        organizationDao.DeleteOrganization(request);
    }
    
    public void CreateOrganization(Organization request){
        organizationDao.CreateOrganization(request);
    }
    
    public List<Organization> getOrganization(){
        return organizationDao.getOrganization();
    }
        
}
