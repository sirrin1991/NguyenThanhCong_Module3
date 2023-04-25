package model.repository.impl;

import model.bean.Category;
import model.bean.Product;
import model.repository.BaseRepository;
import model.repository.CategoryRepository;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepositoryImpl implements CategoryRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Category> findAll() {
        List<Category> list = new ArrayList<>();
        Category category;
        try {
            CallableStatement callableStatement = this.baseRepository.getConnection().prepareCall("call find_all_category()");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                category = new Category();
                category.setName(resultSet.getString("category_name"));
                category.setId(resultSet.getInt("category_id"));
                list.add(category);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
