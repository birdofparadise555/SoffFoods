package service;

import java.util.List;

import entity.Drink;

public interface DrinkService {
	
	public void insert(Drink drinkId);

	public void update(Drink drinkId);

	public void delete(long drinkId);

	public Drink findDrinkId(long drinkId);

	public List<Drink> getAllDrink();
	
	public List<Drink>findDrink(String drink);
	

}
