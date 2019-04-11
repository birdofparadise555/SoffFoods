package serviceBean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import entity.ServiceMan;
import service.ServiceManService;

@Stateless
@Remote(ServiceManService.class)

public class ServiceManServiceBean implements ServiceManService {
	@PersistenceContext(unitName = "employeeDatabase")
	EntityManager em;
//----------------------------------Foods-----------------------------------
	@Override
	public void insert(ServiceMan completeMenuId) {
		// TODO Auto-generated method stub
		this.em.persist(completeMenuId);
	}

	@Override
	public ServiceMan findServiceManId(long completeMenuId) {
		// TODO Auto-generated method stub
		return this.em.find(ServiceMan.class, completeMenuId);
	}

	@Override
	public void update(ServiceMan completeMenuId) {
		// TODO Auto-generated method stub
		this.em.merge(completeMenuId);
	}

	@Override
	public void delete(long completeMenuId) {
		// TODO Auto-generated method stub
		ServiceMan foodsPrice = findServiceManId(completeMenuId);
		if (foodsPrice != null) {
			em.remove(foodsPrice);
		}
	}
	
	public void addImage(ServiceMan completeMenuId) {
		// TODO Auto-generated method stub
		this.em.persist(completeMenuId);
	}
	
	//----------------------------Connet-Database---------------------------------------
	@Override
	public List<ServiceMan> getAllServiceMan() {
		// TODO Auto-generated method stub
		return em.createQuery("SELECT x FROM ServiceMan x").getResultList();
	}

	@Override
	public List<ServiceMan> findServiceMan(String completemenu) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT pm FROM Sofood pm WHERE pm.completemenu LIKE :fn").setParameter("fn", completemenu + "%").getResultList();
	}
}
