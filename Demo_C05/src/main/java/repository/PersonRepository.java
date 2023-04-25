package repository;

import model.Person;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class PersonRepository implements IPersonRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private final String SELECT_ALL = "select * from person where `status` = 1";
    private final String SELECT_ALL_PER = "select * from person";
    private final String CREATE = "insert into person(`name`,address,email,status) values (?,?,?,?)";
    private final String FIND_BY_ID = "select * from person where `status` = 1 and id = ?";
    private final String UPDATE = "update person set `name` = ?,email= ?, address =? where id = ?";
    private final String DELETE = "update person set `status` = ? where id = ?";
    private final String FIND_BY_EMAIL = "select * from person where `status` = 1 and email = ?";


    @Override
    public List<Person> list() {
        List<Person> list = new ArrayList<>();
        Person person;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                boolean status = resultSet.getBoolean("status");
                person = new Person(id, name, address, email, status);
                list.add(person);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Person> searchByName(String name) {
        return null;
    }

    @Override
    public Person findById(int id) {
        Person person = null;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                person = new Person(id, name, address, email, true);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return person;
    }

    @Override
    public boolean save(Person person) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(CREATE);
            preparedStatement.setString(1, person.getName());
            preparedStatement.setString(2, person.getAddress());
            preparedStatement.setString(3, person.getEmail());
            preparedStatement.setBoolean(4, person.isStatus());
            int row = preparedStatement.executeUpdate();
            if (row == 1){
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public void update(Person person) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(UPDATE);
            preparedStatement.setInt(4, person.getId());
            preparedStatement.setString(1, person.getName());
            preparedStatement.setString(2, person.getEmail());
            preparedStatement.setString(3, person.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void remove(int id) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(DELETE);
            preparedStatement.setBoolean(1, false);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean checkEmailIsExist(String string) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(FIND_BY_EMAIL);
            preparedStatement.setString(1, string);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
