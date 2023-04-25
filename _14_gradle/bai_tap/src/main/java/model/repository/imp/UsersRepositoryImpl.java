package model.repository.imp;

import model.bean.Users;
import model.repository.BaseRepository;
import model.repository.UsersRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsersRepositoryImpl implements UsersRepository {
    private BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Users> findAll() {
        List<Users> list = new ArrayList<>();
        Users users;
        try{
            CallableStatement callableStatement =
                    this.baseRepository.getConnection().prepareCall("call find_all()");
            ResultSet resultSet = callableStatement.executeQuery();
            while(resultSet.next()) {
                users = new Users();
                users.setId(Integer.parseInt(resultSet.getString("id")));
                users.setName(resultSet.getString("name"));
                users.setEmail(resultSet.getString("email"));
                users.setAddress(resultSet.getString("address"));

                list.add(users);
            }

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public Users findById(int id) {
        Users user = new Users();
        try{
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("select * \n" +
                            "from users\n" +
                            "where id = ?;");
            preparedStatement.setString(1, String.valueOf(id));
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user.setId(id);
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setAddress(resultSet.getString("address"));
            }

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean save(Users users) {
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement
                            ("insert into users (`name`,email,address)\n" +
                    "values (?,?,?)");
            preparedStatement.setString(1,users.getName());
            preparedStatement.setString(2,users.getEmail());
            preparedStatement.setString(3,users.getAddress());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    @Override
    public void update(int id, Users users) {
        try {
            CallableStatement callableStatement =
                    this.baseRepository.getConnection().prepareCall("call edit_user(?,?,?,?)");
            callableStatement.setString(2,users.getName());
            callableStatement.setString(3,users.getEmail());
            callableStatement.setString(4,users.getAddress());
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void remove(int id) {
        try{
            CallableStatement callableStatement=
                    this.baseRepository.getConnection().prepareCall("call delete_user(?)");

            callableStatement.setString(1, String.valueOf(id));
            callableStatement.executeUpdate();

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Users> sort() {
        List<Users> list = new ArrayList<>();
        try{
            Statement statement = this.baseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select *\n" +
                    "from users\n" +
                    "order by `name`");
            Users users = null;
            while(resultSet.next()) {
                users = new Users();
                users.setId(Integer.parseInt(resultSet.getString("id")));
                users.setName(resultSet.getString("name"));
                users.setEmail(resultSet.getString("email"));
                users.setAddress(resultSet.getString("address"));

                list.add(users);
            }

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Users> searchByName(String name) {
        List<Users> list = new ArrayList<>();
        try{
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement("\n" +
                            "select * from users\n" +
                            "where `name` like ?;");
            preparedStatement.setString(1,"%"+ name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Users users = null;
            while(resultSet.next()) {
                users = new Users();
                users.setId(Integer.parseInt(resultSet.getString("id")));
                users.setName(resultSet.getString("name"));
                users.setEmail(resultSet.getString("email"));
                users.setAddress(resultSet.getString("address"));

                list.add(users);
            }

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public String transaction(int id1, int id2) {
        String msg = "Add permission successfully";
        Connection connection = this.baseRepository.getConnection();
        try{
            connection.setAutoCommit(false);

            PreparedStatement preparedStatement =
                    connection.prepareStatement("insert into user_permission \n" +
                    "values (?,?)");
            preparedStatement.setInt(1,id1);
            preparedStatement.setInt(2,id2);
            int rowAffect = preparedStatement.executeUpdate();
            if (rowAffect == 1) {
                connection.commit();
            } else {
                msg = "rollback try";
                connection.rollback();
            }
        }catch (Exception e){
            try {
                msg = "rollback catch";
                connection.rollback();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return msg;
    }
}
