package model.service;

import model.bean.Users;

import java.util.List;

public interface UsersService {
    List<Users> findAll();
    List<Users> sort();
    Users findById(int id);
    String save(Users users);
    void update(int id,Users users);
    void remove(int id);
    List<Users> searchByName(String name);
    String transaction(int id1, int id2);
}
