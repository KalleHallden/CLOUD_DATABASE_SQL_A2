package se.chalmers.dm;

class User {
    /*ID, Ssn, FName, LName, Email, IsActive*/
    private int id;
    private int ssn;
    private String fName;
    private String lName;
    private String email;
    private Boolean isActive;

    public User(int id, int ssn, String fName, String lName, String email, Boolean isActive) {
        this.id = id;
        this.ssn = ssn;
        this.fName = fName;
        this.lName = lName;
        this.email = email;
        this.isActive = isActive;
    }
}


