package poly.dto;

public class UserDTO {

    private String userSeq;
    private String userEmail;
    private String userName;
    private String passWord;
    private String regDate;
    private String regId;
    private String upDate;
    private String upId;
    private String userAss;

    public String getUserSeq() {
        return userSeq;
    }

    public String getUserAss() {
        return userAss;
    }

    public void setUserAss(String userAss) {
        this.userAss = userAss;
    }

    public void setUserSeq(String userSeq) {
        this.userSeq = userSeq;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getRegId() {
        return regId;
    }

    public void setRegId(String regId) {
        this.regId = regId;
    }

    public String getUpDate() {
        return upDate;
    }

    public void setUpDate(String upDate) {
        this.upDate = upDate;
    }

    public String getUpId() {
        return upId;
    }

    public void setUpId(String upId) {
        this.upId = upId;
    }
}
