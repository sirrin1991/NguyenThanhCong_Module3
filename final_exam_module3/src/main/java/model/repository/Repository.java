package model.repository;

import model.bean.Product;

import java.util.List;

public interface Repository {
    List<Product> findAll();
    Product findById(int id);
    boolean add(Product e);
    boolean update(Product e);
    void delete(int id);
    List<Product> search(String name , String email, String address);
}
