package service;

import java.util.List;

import entity.OrderItem;

public interface OrderItemService {

	public void insert(OrderItem orderItem);

	public void update(OrderItem orderItem);

	public void delete(long orderItemId);

	public OrderItem findOrderItem(long orderItemId);

	public List<OrderItem> getAllOrderItem();

}
