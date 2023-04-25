package model.repository.impl;

import model.bean.Student;
import model.repository.StudentRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class StudentRepositoryImpl implements StudentRepository {

    private static Map<Integer, Student> studentMap;

    static {
        studentMap = new TreeMap<>();
        studentMap.put(432, new Student(432, "Nguyen Van A",
                "2021-04-09", 1, 4.0));
        studentMap.put(986, new Student(986, "Nguyen Van B",
                "2021-04-10", 0, 6.0));
        studentMap.put(876, new Student(876, "Le Van C",
                "2021-04-11", 2, 9.0));
    }

    @Override
    public List<Student> findAll() {
        return new ArrayList<>(studentMap.values());
    }

    @Override
    public Student findById(Integer id) {
        return studentMap.get(id);
    }

    @Override
    public void save(Student student) {

    }
}
