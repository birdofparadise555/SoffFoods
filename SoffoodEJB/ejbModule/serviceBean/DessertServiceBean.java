package serviceBean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.Dessert;
import entity.Drink;
import entity.ServiceMan;
import service.DessertService;
import service.DrinkService;
import service.ServiceManService;


@Stateless
@Remote(DessertService.class)

public class DessertServiceBean implements DessertService {
	@PersistenceContext(unitName = "employeeDatabase")
	EntityManager em;
	
	public void insert(Dessert dessertId) {
		// TODO Auto-generated method stub
		this.em.persist(dessertId);
	}

	@Override
	public Dessert findDessertId(long dessertId) {
		// TODO Auto-generated method stub
		return this.em.find(Dessert.class, dessertId);
	}

	@Override
	public void update(Dessert dessertId) {
		// TODO Auto-generated method stub
		this.em.merge(dessertId);
	}

	@Override
	public void delete(long dessertId) {
		// TODO Auto-generated method stub
		Dessert dessertPrice = findDessertId(dessertId);
		if (dessertPrice != null) {
			em.remove(dessertPrice);
		}
	}
	
	public void addImage(Dessert dessertImage) {
		// TODO Auto-generated method stub
		this.em.persist(dessertImage);
	}
	
	//----------------------------Connet-Database---------------------------------------
	@Override
	public List<Dessert> getAllDessert() {
		// TODO Auto-generated method stub
		return em.createQuery("SELECT x FROM Dessert x").getResultList();
	}

	@Override
	public List<Dessert> findDessert(String dessert) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT pm FROM Dessert pm WHERE pm.dessert LIKE :fn").setParameter("fn", dessert + "%").getResultList();
	}

}
