/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.dao.ActivityDao;
import async.ceorgplatform.dao.AnnouncementDao;
import async.ceorgplatform.model.Announcement;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Kate Dianne
 */
public class AnnouncementServiceImpl implements AnnouncementService {
    @Autowired
    public AnnouncementDao announcementDao;
    
    public void UpdateAnnouncement(Announcement request){
        announcementDao.UpdateAnnouncement(request);
    }
    
    public void UpdateRecipient(List<Announcement> request){
        announcementDao.UpdateRecipient(request);
    }
    
    public void DeleteAnnouncement(List<Announcement> request){
        announcementDao.DeleteAnnouncement(request);
    }
    
    public void CreateAnnouncement(List<Announcement> _request){
        announcementDao.CreateAnnouncement(_request);
    }
    
    public List<Announcement> getAnnouncement(){
        return announcementDao.getAnnouncement();
    }
            
}
