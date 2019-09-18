/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.service;

import async.ceorgplatform.dao.LetterDao;
import async.ceorgplatform.model.Letter;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Kate Dianne
 */
public class LetterServiceImpl implements LetterService {
    @Autowired
    public LetterDao letterDao;
    
    public List<Letter> getLetter(){
        return letterDao.getLetter();
    }
    
    public int CreateLetter(Letter letter){
        int result = letterDao.CreateLetter(letter);
        return result;
    }
}
