/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.dao.UserDao;
import async.ceorgplatform.model.Login;
import async.ceorgplatform.model.User;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author JC
 */
public class UserServiceImpl implements UserService {
    
    @Autowired
    public UserDao userDao;
    
    public User validateUser (Login login){
        return userDao.validateUser(login);
    }
}
