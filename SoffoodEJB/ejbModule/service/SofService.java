package service;

import java.util.List;
import entity.Soffood;


public interface SofService {
	
	

	
	public void insert(Soffood foodsId );
	public Soffood findfoodsId(long foodId);
	public void update (Soffood foods);
	public void delete(long foodsId);
	public void addImage(Soffood foodImage );

	
	

	
	public void insertdesert(Soffood desertId);
	public Soffood finddesertId(long desertId);
	public void updatedesert(Soffood desert);
	public void deletedesert(long desertId);

	
	public void insertfoodsset(Soffood foodssetId);
	public Soffood findfoodssetId(long foodssetId);
	public void updatefoodsset(Soffood foodsset);
	public void deletefoodsset(long foodssetId);

	
	public void insertOrderFoodsId(Soffood orderFoodsId );
	public Soffood findOrderFoodsName(long orderFoodsName);
	public void updateOrderFoodsPrice (Soffood orderFoodsPrice);
	public void deleteOrderFoods(long orderFoodsId);
	
	public void insertNumberTable(Soffood numberTable );
	
	public void insertdrink(Soffood drinkId);
	public Soffood finddrinkId(long drinkId);
	public void updatedrink(Soffood drinks);
	public void deletedrink(long drinkId);
	
	
	
	public List<Soffood>getAllSoffood();
	public List<Soffood>findSoffoodName(String foodsname);
	


	
	
}
