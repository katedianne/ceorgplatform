/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package async.ceorgplatform.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kate Dianne
 */
public class Helper {
    public List<Helper.OrgName> orgName = new ArrayList<Helper.OrgName>();

    public List<OrgName> getOrgName() {
        return orgName;
    }

    public void setOrgName(List<OrgName> orgName) {
        this.orgName = orgName;
    }
    
    public static class OrgName{
        private String codeName;

        public String getCodeName() {
            return codeName;
        }

        public void setCodeName(String codeName) {
            this.codeName = codeName;
        }
    }
    
    public List<Helper.LetterType> letterType = new ArrayList<Helper.LetterType>();
    
    public List<LetterType> getLetterType() {
        return letterType;
    }

    public void setLetterType(List<LetterType> letterType) {
        this.letterType = letterType;
    }
    
    public static class LetterType{
        private String letterType;

        public String getLetterType() {
            return letterType;
        }

        public void setLetterType(String letterType) {
            this.letterType = letterType;
        }
    }
    
    public List<Helper.LetterId> letterId = new ArrayList<Helper.LetterId>();

    public List<LetterId> getLetterId() {
        return letterId;
    }

    public void setLetterId(List<LetterId> letterId) {
        this.letterId = letterId;
    }
    
    public static class LetterId{
        private int letterId;

        public int getLetterId() {
            return letterId;
        }

        public void setLetterId(int letterId) {
            this.letterId = letterId;
        }
    }
}
