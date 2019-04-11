package serviceBean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import entity.Soffood;
import service.SofService;




@Stateless
@Remote(SofService.class)

public class SoffoodServiceBean implements SofService {
	@PersistenceContext(unitName = "employeeDatabase")
	EntityManager em;
//----------------------------------Foods-----------------------------------
	@Override
	public void insert(Soffood foodsId) {
		// TODO Auto-generated method stub
		this.em.persist(foodsId);
	}

	@Override
	public Soffood findfoodsId(long foodId) {
		// TODO Auto-generated method stub
		return this.em.find(Soffood.class, foodId);
	}

	@Override
	public void update(Soffood foods) {
		// TODO Auto-generated method stub
		this.em.merge(foods);
	}

	@Override
	public void delete(long foodsId) {
		// TODO Auto-generated method stub
		Soffood foodsPrice = findfoodsId(foodsId);
		if (foodsPrice != null) {
			em.remove(foodsPrice);
		}
	}
	
	public void addImage(Soffood foodImage) {
		// TODO Auto-generated method stub
		this.em.persist(foodImage);
	}
	
	

	//----------------------------Drink--------------------------------------
	@Override
	public void insertdrink(Soffood drinkId) {
		// TODO Auto-generated method stub
		this.em.persist(drinkId);
	}

	@Override
	public Soffood finddrinkId(long drinkId) {
		// TODO Auto-generated method stub
		return this.em.find(Soffood.class, drinkId);
	}

	@Override
	public void updatedrink(Soffood drinks) {
		// TODO Auto-generated method stub
		this.em.merge(drinks);
	}

	@Override
	public void deletedrink(long drinkId) {
		// TODO Auto-generated method stub
		Soffood drinkprice = finddrinkId(drinkId);
		if (drinkprice != null) {
			em.remove(drinkprice);
		}
	}
		
	
	//----------------------------Desert-------------------------------------
	@Override
	public void insertdesert(Soffood desertId) {
		// TODO Auto-generated method stub
		this.em.persist(desertId);
	}

	@Override
	public Soffood finddesertId(long desertId) {
		// TODO Auto-generated method stub
		return this.em.find(Soffood.class, desertId);
	}

	@Override
	public void updatedesert(Soffood desert) {
		// TODO Auto-generated method stub
		this.em.merge(desert);
	}

	@Override
	public void deletedesert(long desertId) {
		// TODO Auto-generated method stub
		Soffood desertprice = findfoodsId(desertId);
		if (desertprice != null) {
			em.remove(desertprice);
		}
	}
	//----------------------------Foods-Set----------------------------------
	@Override
	public void insertfoodsset(Soffood foodssetId) {
		// TODO Auto-generated method stub
		this.em.persist(foodssetId);
	}

	@Override
	public Soffood findfoodssetId(long foodssetId) {
		// TODO Auto-generated method stub
		return this.em.find(Soffood.class, foodssetId);
	}

	@Override
	public void updatefoodsset(Soffood foodsset) {
		// TODO Auto-generated method stub
		this.em.merge(foodsset);
	}

	@Override
	public void deletefoodsset(long foodssetId) {
		// TODO Auto-generated method stub
		Soffood foodssetprice = findfoodsId(foodssetId);
		if (foodssetprice != null) {
			em.remove(foodssetprice);
		}
	}
	
	
	
	
	//-----------------------------OrderFoods-------------------------------------------
	@Override
	public void insertOrderFoodsId(Soffood orderFoodsId) {
		// TODO Auto-generated method stub
		this.em.persist(orderFoodsId);
	}

	@Override
	public Soffood findOrderFoodsName(long orderFoodsName) {
		// TODO Auto-generated method stub
		return this.em.find(Soffood.class, orderFoodsName);
	}

	@Override
	public void updateOrderFoodsPrice(Soffood orderFoodsPrice) {
		// TODO Auto-generated method stub
		this.em.merge(orderFoodsPrice);
	}

	@Override
	public void deleteOrderFoods(long orderFoodsId) {
		// TODO Auto-generated method stub
		Soffood orderfoods = findfoodsId(orderFoodsId);
		if (orderfoods != null) {
			em.remove(orderfoods);
		}
	}
	
	
	
	@Override
	public void insertNumberTable(Soffood numberTable) {
		// TODO Auto-generated method stub
		this.em.persist(numberTable);
	}
	
	
	
	
	//----------------------------Connet-Database---------------------------------------
	@Override
	public List<Soffood> getAllSoffood() {
		// TODO Auto-generated method stub
		return em.createQuery("SELECT x FROM Soffood x").getResultList();
	}

	@Override
	public List<Soffood> findSoffoodName(String foodsname) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT pm FROM Sofood pm WHERE pm.foodsname LIKE :fn").setParameter("fn", foodsname + "%").getResultList();
	}
}
