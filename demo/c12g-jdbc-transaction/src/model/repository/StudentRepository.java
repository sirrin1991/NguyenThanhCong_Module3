package model.repository;

import model.bean.Student;

import java.util.List;

public interface StudentRepository {

    List<Student> findAll();

    Student findById(Integer id);

    boolean save(Student student);

    String callTransaction();

    List<Student> searchByKeyword(String keyword);
}
