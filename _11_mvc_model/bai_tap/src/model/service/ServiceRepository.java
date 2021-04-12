package model.service;

import model.bean.Product;

import java.util.List;

public interface ServiceRepository {
    List<Product> findAll();
    Product findById(int id);
    List<Product> findByName(String name);
    void save(Product product);
    void edit(int id,Product product);
    void delete(int id);
}
