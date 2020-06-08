package poly.dto;

public class GroupDTO {
    private String GroupSeq;
    private String GroupName;
    private String Greeting;
    private int function;
    private String userName;

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

    public int getFunction() {
        return function;
    }

    public void setFunction(int function) {
        this.function = function;
    }
}
