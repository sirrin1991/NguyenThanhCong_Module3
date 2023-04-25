package model.repository.impl;

import model.bean.Student;
import model.repository.BaseRepository;
import model.repository.StudentRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class StudentRepositoryImpl implements StudentRepository {

    private static Map<Integer, Student> studentMap;
    private BaseRepository baseRepository = new BaseRepository();

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
        List<Student> studentList = new ArrayList<>();

        try {
            Statement statement = this.baseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select id, `name`, date_of_birth\n" +
                    "from student");

            Student student = null;
            while(resultSet.next()) {
                student = new Student();
                student.setId(Integer.parseInt(resultSet.getString("id")));
                student.setName(resultSet.getString("name"));
                student.setDateOfBirth(resultSet.getString("date_of_birth"));

                studentList.add(student);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return studentList;
    }

    @Override
    public Student findById(Integer id) {
        Student student = new Student();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select id, `name`, date_of_birth\n" +
                            "from student\n" +
                            "where id = ?");

            preparedStatement.setString(1, id + "");

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                student.setId(Integer.parseInt(resultSet.getString("id")));
                student.setName(resultSet.getString("name"));
                student.setDateOfBirth(resultSet.getString("date_of_birth"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return student;
    }

    @Override
    public boolean save(Student student) {
        // update to DB.
        return true;
    }
}
