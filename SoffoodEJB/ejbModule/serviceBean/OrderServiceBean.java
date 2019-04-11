package serviceBean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.FoodOrder;

import service.FoodOrderService;

@Stateless
@Remote(FoodOrderService.class)
public class OrderServiceBean implements FoodOrderService {
	
	@PersistenceContext(unitName = "employeeDatabase")
	EntityManager em;

	@Override
	public long insert(FoodOrder foodOrder) {
		em.persist(foodOrder);
		em.flush();
		return foodOrder.getFoodOrderId();
	}

	@Override
	public FoodOrder findFoodOrder(long orderId) {
		return em.find(FoodOrder.class, orderId);
	}

	@Override
	public void update(FoodOrder foodOrder) {
		em.merge(foodOrder);

	}

	@Override
	public void delete(long orderId) {
		FoodOrder foodOrder = findFoodOrder(orderId);
		if (foodOrder != null) {
			em.remove(foodOrder);
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FoodOrderService> getAllFoodOrder() {
		return em.createQuery("SELECT * FROM FoodOrder foodOrder").getResultList();
	}

}
