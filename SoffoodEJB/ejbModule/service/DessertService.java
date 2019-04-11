package service;

import java.util.List;

import entity.Dessert;


public interface DessertService {
	public void insert(Dessert dessertId);

	public void update(Dessert dessertId);

	public void delete(long dessertId);

	public Dessert findDessertId(long dessertId);

	public List<Dessert> getAllDessert();
	
	public List<Dessert>findDessert(String dessert);

}
