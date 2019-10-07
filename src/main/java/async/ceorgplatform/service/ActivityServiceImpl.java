/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.dao.ActivityDao;
import async.ceorgplatform.model.Activity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Kate Dianne
 */
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    public ActivityDao activityDao;
    
    public int UpdateActivity(Activity activity){
        int result =  activityDao.UpdateActivity(activity);
        return result;
    }
    
    public void DeleteActivity(Activity activity){
        activityDao.DeleteActivity(activity);
    }
    
    public int CreateActivity(Activity activity){
        int result = activityDao.CreateActivity(activity);
        return result;
    }
    
    public List<Activity> getActivity(){
        return activityDao.getActivity();
    }
}
