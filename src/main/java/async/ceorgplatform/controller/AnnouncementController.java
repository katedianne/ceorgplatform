/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author JC
 */

@Controller
public class AnnouncementController {
    @RequestMapping(value = "/announcement", method = RequestMethod.GET)
    public String showAnnouncement(){
        return "announcement";
    }
}
