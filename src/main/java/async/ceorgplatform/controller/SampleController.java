/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Kate Dianne
 */
@Controller
public class SampleController {
    @RequestMapping("/ajax_now")
    public String getTime(){
        return "test";
    }
    
    @RequestMapping("/get")
    @ResponseBody
    public String getsrverTime(){
        Date d = new Date();
        return d.toString();
    }
}
