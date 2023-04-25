package model.service.imp;

import model.bean.Users;
import model.repository.UsersRepository;
import model.repository.imp.UsersRepositoryImpl;
import model.service.UsersService;

import java.util.List;

public class UsersServiceImpl implements UsersService {
    private UsersRepository usersRepository = new UsersRepositoryImpl();
    @Override
    public List<Users> findAll() {
        return usersRepository.findAll();
    }

    @Override
    public List<Users> sort() {
        return usersRepository.sort();
    }

    @Override
    public Users findById(int id) {
        return usersRepository.findById(id);
    }

    @Override
    public boolean save(Users users) {
        return usersRepository.save(users);
    }

    @Override
    public void update(int id, Users users) {
        usersRepository.update(id,users);
    }

    @Override
    public void remove(int id) {
        usersRepository.remove(id);
    }

    @Override
    public List<Users> searchByName(String name) {
        return usersRepository.searchByName(name);
    }

    @Override
    public String transaction(int id1, int id2) {
        return usersRepository.transaction(id1,id2);
    }
}
