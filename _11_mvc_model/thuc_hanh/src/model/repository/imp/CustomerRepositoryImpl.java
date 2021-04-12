package model.repository.imp;

import model.bean.Customer;
import model.repository.CustomerRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerRepositoryImpl implements CustomerRepository {
    private static Map<Integer, Customer> customers;

    static {
        customers = new HashMap<>();
        customers.put(1, new Customer(1, "Huy", "huy@codegym.vn", "Me nhu"));
        customers.put(2, new Customer(2, "Dong", "dong@codegym.vn", "Nguyen Du"));
        customers.put(3, new Customer(3, "Sang", "sang@codegym.vn", "Nguyen Hoang"));
        customers.put(4, new Customer(4, "Thang", "thang@codegym.vn", "Ba Huyen Thanh Quan"));
        customers.put(5, new Customer(5, "Tuan", "tuan@codegym.vn", "Lac Long Quan"));
        customers.put(6, new Customer(6, "Tai", "tai@codegym.vn", "Nguyen Tat Thanh"));
    }
    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(),customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.replace(id,customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
