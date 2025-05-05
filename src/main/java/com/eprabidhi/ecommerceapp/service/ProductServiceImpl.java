package com.eprabidhi.ecommerceapp.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.eprabidhi.ecommerceapp.entity.Product;
import com.eprabidhi.ecommerceapp.repository.ProductDao;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

//    @Autowired
//    private ProductDao productDao;

    private ProductDao productDao;

    public ProductServiceImpl(ProductDao productDao) {
        this.productDao = productDao;
    }

    @Override
    public void saveProduct(Product product) {
        productDao.save(product);
    }

    @Override
    public List<Product> getAllProducts() {
        return productDao.findAll();
    }

    @Override
    public Product getProductById(int id) {
        return productDao.findById(id).get();
    }

    @Override
    public Product getProductByName(String name) {
        return productDao.findByName(name);
    }

    @Override
    public List<Product> getProductByQuantity(int quantity) {
        return productDao.findByQuantity(quantity);
    }

    @Override
    public List<Product> getProductByPrice(double price) {
        return productDao.findByPriceBetween(price, price);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.save(product);
    }

    @Override
    public void deleteProduct(Product product) {
        productDao.delete(product);
    }
}
