package model.repository.impl;

import model.bean.Product;
import model.repository.BaseRepository;
import model.repository.Repository;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements Repository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Product> findAll() {
        List<Product> list = new ArrayList<>();
        Product product;
        try {
            CallableStatement callableStatement = this.baseRepository.getConnection().prepareCall("call find_all()");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getString("price"));
                product.setQuantity(resultSet.getString("quantity"));
                product.setColor(resultSet.getString("color"));
                product.setDescription(resultSet.getString("description"));
                product.setCategoryName(resultSet.getString("category_name"));
                list.add(product);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public boolean add(Product product) {
        try {
            CallableStatement callableStatement =
                    this.baseRepository.getConnection().prepareCall("call add_product(?,?,?,?,?,?)");
            callableStatement.setString(1,product.getName());
            callableStatement.setDouble(2, Double.parseDouble(product.getPrice()));
            callableStatement.setInt(3, Integer.parseInt(product.getQuantity()));
            callableStatement.setString(4,product.getColor());
            callableStatement.setString(5,product.getDescription());
            callableStatement.setInt(6, Integer.parseInt(product.getCategoryId()));
            callableStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Product e) {
        return false;
    }

    @Override
    public void delete(int id) {
        try {
            PreparedStatement preparedStatement =baseRepository.getConnection().prepareStatement("delete from product\n" +
                    "where id = ?;");
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Product> search(String name, String email, String address) {
        return null;
    }
}
