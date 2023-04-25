package model.service;

import model.bean.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {
    List<Product> findAll();
    Product findById(int id);
    Map<String,String> add(Product product);
    Map<String,String> update(Product product);
    void delete(int id);
    List<Product> search(String name, String email, String address);
}
