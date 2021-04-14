package model.repository;

import model.bean.Users;

import java.util.List;

public interface UsersRepository {
    List<Users> findAll();
    Users findById(int id);
    boolean save(Users users);
    void update(int id,Users users);
    void remove(int id);
    List<Users> sort();
    List<Users> searchByName(String name);
    String transaction(int id1,int id2);
}
