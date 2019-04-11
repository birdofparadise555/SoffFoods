package serviceBean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.OrderItem;
import service.OrderItemService;

@Stateless
@Remote(OrderItemService.class)
public class OrderItemServiceBean implements OrderItemService {

	@PersistenceContext(unitName = "employeeDatabase")
	EntityManager em;

	@Override
	public void insert(OrderItem orderItem) {
		em.persist(orderItem);
	}

	@Override
	public void update(OrderItem orderItem) {
		em.merge(orderItem);

	}

	@Override
	public void delete(long orderItemId) {
		OrderItem orderItem = findOrderItem(orderItemId);
		if (orderItem != null) {
			em.remove(orderItem);
		}
	}

	@Override
	public OrderItem findOrderItem(long orderItemId) {
		return em.find(OrderItem.class, orderItemId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItem> getAllOrderItem() {
		return em.createQuery("SELECT a FROM OrderItem a").getResultList();
	}

}
