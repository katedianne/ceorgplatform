/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.model.Note;
import java.util.List;

/**
 *
 * @author acer
 */
public interface NoteService {
    int UpdateNote(Note request);
    int DeleteNote(Note request);
    int CreateNote(Note request);
    List<Note> getNote();
}
