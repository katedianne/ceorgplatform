/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Login;
import async.ceorgplatform.model.User;

/**
 *
 * @author JC
 */
public interface UserDao {
    User validateUser(Login login);
}
