package model.repository.impl;

import model.bean.Student;
import model.repository.BaseRepository;
import model.repository.StudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepositoryImpl implements StudentRepository {

    private BaseRepository baseRepository = new BaseRepository();

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

    @Override
    public String callTransaction() {
        String msg = "OK, transaction successfully!";
        Connection connection = this.baseRepository.getConnection();

        try {
            connection.setAutoCommit(false);

            PreparedStatement pSInsertTypeOfClass =
                    connection.prepareStatement(
                            "insert into type_of_class (id, `name`)\n" +
                                "values (?, ?)");
            pSInsertTypeOfClass.setString(1, "3");
            pSInsertTypeOfClass.setString(2, "Other");

            int rowAffect = pSInsertTypeOfClass.executeUpdate();

            PreparedStatement pSInsertClass =
                    connection.prepareStatement(
                            "insert into class (id, `name`, type_of_class_id)\n" +
                                "values (?, ?, ?)");
            pSInsertClass.setString(1, "1");
            pSInsertClass.setString(2, "C0421G1");
            pSInsertClass.setString(3, "3");

            rowAffect += pSInsertClass.executeUpdate();

            if (rowAffect == 2) {
                PreparedStatement pSInsertStudent
                        = connection.prepareStatement(
                                "insert into student(`name`, date_of_birth, email, class_id) " +
                                    "values (?, ?, ?, ?)");
                pSInsertStudent.setString(1, "Nguyen Van A");
                pSInsertStudent.setString(2, "2021-09-28");
                pSInsertStudent.setString(3, "anguyen@gmail.com");
                pSInsertStudent.setString(4, "5");

                rowAffect += pSInsertStudent.executeUpdate();
            }

            if (rowAffect == 3) {
                connection.commit();
            } else {
                msg = "rollback try";
                connection.rollback();
            }

        } catch (SQLException e) {
            try {
                msg = "rollback catch";
                connection.rollback();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return msg;
    }

    @Override
    public List<Student> searchByKeyword(String keyword) {
        List<Student> studentList = new ArrayList<>();

        try {
            CallableStatement callableStatement =
                    this.baseRepository.getConnection().prepareCall("call find_info_student_by_keyword(?)");
            callableStatement.setString(1, keyword);

            ResultSet resultSet = callableStatement.executeQuery();

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
}
