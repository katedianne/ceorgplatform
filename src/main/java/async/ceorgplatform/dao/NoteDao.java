/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Note;
import java.util.List;

/**
 *
 * @author acer
 */
public interface NoteDao {
    void UpdateNote(Note request);
    void DeleteNote(Note request);
    void CreateNote(Note request);
    List<Note> getNote();
}
