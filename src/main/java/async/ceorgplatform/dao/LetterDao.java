/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.dao;

import async.ceorgplatform.model.Letter;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public interface LetterDao {
    List<Letter> getLetter();
    int CreateLetter(Letter letter);
    int DeleteLetter(Letter letter);
}
