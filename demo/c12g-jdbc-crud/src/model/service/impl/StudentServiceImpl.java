package model.service.impl;

import model.bean.Student;
import model.repository.StudentRepository;
import model.repository.impl.StudentRepositoryImpl;
import model.service.StudentService;

import java.util.List;

public class StudentServiceImpl implements StudentService {

    private StudentRepository studentRepository = new StudentRepositoryImpl();

    @Override
    public List<Student> findAll() {
        return this.studentRepository.findAll();
    }

    @Override
    public Student findById(Integer id) {
        return this.studentRepository.findById(id);
    }

    @Override
    public boolean save(Student student) {
        // regex name, regex id...
        if (student.getName().matches("[A-Za-z ]+")) {
            return this.studentRepository.save(student);
        }

        return false;
    }
}
