package serviceBean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.Drink;
import entity.ServiceMan;
import service.DrinkService;
import service.ServiceManService;

@Stateless
@Remote(DrinkService.class)

public class DrinkServiceBean implements DrinkService{
	@PersistenceContext(unitName = "employeeDatabase")
	EntityManager em;
	@Override
	public void insert(Drink drinkId) {
		// TODO Auto-generated method stub
		this.em.persist(drinkId);
	}

	@Override
	public Drink findDrinkId(long drinkId) {
		// TODO Auto-generated method stub
		return this.em.find(Drink.class, drinkId);
	}

	@Override
	public void update(Drink drinkId) {
		// TODO Auto-generated method stub
		this.em.merge(drinkId);
	}

	@Override
	public void delete(long drinkId) {
		// TODO Auto-generated method stub
		Drink drinkPrice = findDrinkId(drinkId);
		if (drinkPrice != null) {
			em.remove(drinkPrice);
		}
	}
	
	public void addImage(Drink drinkImage) {
		// TODO Auto-generated method stub
		this.em.persist(drinkImage);
	}
	
	//----------------------------Connet-Database---------------------------------------
	@Override
	public List<Drink> getAllDrink() {
		// TODO Auto-generated method stub
		return em.createQuery("SELECT x FROM Drink x").getResultList();
	}

	@Override
	public List<Drink> findDrink(String drink) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT pm FROM Drink pm WHERE pm.drink LIKE :fn").setParameter("fn", drink + "%").getResultList();
	}
	
	

}
