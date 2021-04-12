package model.repository.imp;

import model.bean.Product;
import model.repository.ProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository {
    private static Map<Integer,Product> map = new HashMap<>();
    static {
        map.put(1,new Product(1,"IphoneX","White",25000000));
        map.put(2,new Product(2,"Iphone8","White",1000000));
        map.put(3,new Product(3,"Iphone8 plus","White",7000000));
        map.put(4,new Product(4,"Iphone7 plus","White",6000000));

    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(map.values());
    }

    @Override
    public Product findByID(int id) {
        return map.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> list = new ArrayList<>();
        for(int i = 0 ; i <map.size();i++){
            if(name.equals(map.get(i).getName())){
                list.add(map.get(i));
            }
        }
        return list;
    }

    @Override
    public void save(Product product) {
        map.put(product.getId(),product);
    }

    @Override
    public void edit(int id,Product product) {
        map.replace(id,product);
    }

    @Override
    public void delete(int id) {
        map.remove(id);
    }
}
