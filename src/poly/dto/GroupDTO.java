package poly.dto;

public class GroupDTO {
    private String GU;
    private String GroupSeq;
    private String GroupName;
    private String Greeting;
    private String function;
    private String userName;
    private String count;
    private String auth;
    private String MkId;

    public String getMkId() {
        return MkId;
    }

    public void setMkId(String mkId) {
        MkId = mkId;
    }

    public String getGU() {
        return GU;
    }

    public void setGU(String GU) {
        this.GU = GU;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGroupSeq() {
        return GroupSeq;
    }

    public void setGroupSeq(String groupSeq) {
        GroupSeq = groupSeq;
    }

    public String getGroupName() {
        return GroupName;
    }

    public void setGroupName(String groupName) {
        GroupName = groupName;
    }

    public String getGreeting() {
        return Greeting;
    }

    public void setGreeting(String greeting) {
        Greeting = greeting;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }
}
