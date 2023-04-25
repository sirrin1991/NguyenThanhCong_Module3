package model.service;

import model.bean.Product;
import model.repository.Repository;
import model.repository.impl.ProductRepositoryImpl;
import model.service.common.Validation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    Repository repository = new ProductRepositoryImpl();
    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public Map<String, String> add(Product product) {
        Map<String,String> map = new HashMap<>();
        if(!Validation.validateName(product.getName())){
            map.put("name","Invalid format.(ex Abc Abc");
        }
        if(!Validation.validateAllMoney(product.getPrice())){
            map.put("price","Can not empty and must be more than 500$");
        }
        if(!Validation.validateQuantity(product.getQuantity())){
            map.put("quantity","Can not empty and must be integer");
        }

        if(map.isEmpty()){
            if(!repository.add(product)){
                map.put("error","Something wrong try again");
            }
        }

        return map;
    }

    @Override
    public Map<String, String> update(Product customer) {
        return null;
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public List<Product> search(String name, String email, String address) {
        return null;
    }
}
