package model.service.imp;

import model.bean.Product;
import model.repository.ProductRepository;
import model.repository.imp.ProductRepositoryImpl;
import model.service.ServiceRepository;

import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository {
    ProductRepository productRepository = new ProductRepositoryImpl();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product findById(int id) {
        return productRepository.findByID(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public void edit(int id, Product product) {
        productRepository.edit(id,product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }
}
