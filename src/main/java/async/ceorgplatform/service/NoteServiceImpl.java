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
       
    public void UpdateNote(Note request){
        noteDao.UpdateNote(request);
    }
    
    public void DeleteNote(Note request){
        noteDao.DeleteNote(request);
    }
    
    public void CreateNote(Note request){
        noteDao.CreateNote(request);
    }
    
    public  List<Note> getNote(){
        return noteDao.getNote();
    }
}
