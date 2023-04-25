package repository;

import model.Person;

import java.util.List;

public interface IPersonRepository {
    List<Person> list();
    List<Person> searchByName(String name);
    Person findById(int id);
    boolean save(Person person);
    void update(Person person);
    void remove(int id);
    boolean checkEmailIsExist(String string);

}
