/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.model.Announcement;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public interface AnnouncementService {
    void UpdateAnnouncement(Announcement request);
    void UpdateRecipient(List<Announcement> request);
    void DeleteAnnouncement(List<Announcement> request);
    void CreateAnnouncement(List<Announcement> _request);
    List<Announcement> getAnnouncement();
}
