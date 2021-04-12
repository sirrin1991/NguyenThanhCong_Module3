package model.service.imp;

import model.bean.Customer;
import model.repository.CustomerRepository;
import model.repository.imp.CustomerRepositoryImpl;
import model.service.ServiceRepository;

import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository {
    CustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> findAll() {
        return this.customerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customerRepository.update(id,customer);
    }

    @Override
    public void remove(int id) {
        customerRepository.remove(id);
    }
}
