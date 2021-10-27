package service;

import domain.Cart;

public interface OrderService {
    public String createOrder(Cart cart, Integer userId);
}
