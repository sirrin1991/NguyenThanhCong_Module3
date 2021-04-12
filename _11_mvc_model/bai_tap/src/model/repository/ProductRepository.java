package model.repository;

import model.bean.Product;
import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    Product findByID(int id);
    List<Product> findByName(String name);
    void save(Product product);
    void edit(int id,Product product);
    void delete(int id);
}
