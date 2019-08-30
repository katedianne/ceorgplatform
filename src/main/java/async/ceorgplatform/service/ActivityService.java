/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.model.Activity;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public interface ActivityService {
    void UpdateActivity(Activity activity);
    void DeleteActivity(Activity activity);
    void CreateActivity(Activity activity);
    List<Activity> getActivity();
}
