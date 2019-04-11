package service;

import java.util.List;

import entity.FoodOrder;

public interface FoodOrderService {

	public long insert(FoodOrder foodOrder);

	public FoodOrder findFoodOrder(long orderId);

	public void update(FoodOrder orderFood);

	public void delete(long orderId);

	public List<FoodOrderService> getAllFoodOrder();
	
}


