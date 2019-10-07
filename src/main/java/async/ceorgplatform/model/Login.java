/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.model;

/**
 *
 * @author JC
 */
public class Login {
    private String username;
    private String password;
    private int userId;
    private int isLogin;
    private int updateResult;

    public int getUpdateResult() {
        return updateResult;
    }

    public void setUpdateResult(int updateResult) {
        this.updateResult = updateResult;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getIsLogin() {
        return isLogin;
    }

    public void setIsLogin(int isLogin) {
        this.isLogin = isLogin;
    }
    
    public String getUsername(){
        return username; 
    }
    
    public void setUsername(String username){
        this.username = username;
    }
    
    public String getPassword(){
        return this.password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    
}
