/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.dao.NoteDao;
import async.ceorgplatform.model.Note;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author acer
 */
public class NoteServiceImpl implements NoteService {
    @Autowired
    public NoteDao noteDao;
       
    public int UpdateNote(Note request){
        int result = noteDao.UpdateNote(request);
        return result;
    }
    
    public int DeleteNote(Note request){
        int result = noteDao.DeleteNote(request);
        return result;
    }
    
    public int CreateNote(Note request){
        int result = noteDao.CreateNote(request);
        return result;
    }
    
    public  List<Note> getNote(){
        return noteDao.getNote();
    }
}
