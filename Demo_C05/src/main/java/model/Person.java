package model;

public class Person {
    private int id;
    private String name;
    private String address;
    private String email;



    private String date;
    private boolean status;

    public Person(int id, String name, String address, String email, boolean status) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.status = status;
    }
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public Person() {
    }
}
