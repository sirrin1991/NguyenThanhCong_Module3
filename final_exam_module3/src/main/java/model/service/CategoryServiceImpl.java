package model.service;

import model.bean.Category;
import model.repository.CategoryRepository;
import model.repository.impl.CategoryRepositoryImpl;

import java.util.List;

public class CategoryServiceImpl implements CategoryService{
    CategoryRepository categoryRepository = new CategoryRepositoryImpl();
    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }
}
