package service;

import model.Person;

import java.util.List;
import java.util.Map;

public interface IPersonService {
    List<Person> list();
    List<Person> searchByName(String name);
    Person findById(int id);
    Map<String, String> save(Person person);
    void remove(int id);
    void update(Person person);
    boolean checkEmailIsExist(String string);
}
