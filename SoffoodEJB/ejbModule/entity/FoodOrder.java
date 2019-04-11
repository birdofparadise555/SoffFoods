package entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class FoodOrder implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long foodOrderId;
	private String orderTable;
	private Date orderDate;

	@OneToMany(mappedBy = "foodOrder", cascade = { CascadeType.ALL })
	private List<OrderItem> orderItem;

	public Long getFoodOrderId() {
		return foodOrderId;
	}

	public void setFoodOrderId(Long foodOrderId) {
		this.foodOrderId = foodOrderId;
	}

	public String getOrderTable() {
		return orderTable;
	}

	public void setOrderTable(String orderTable) {
		this.orderTable = orderTable;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public List<OrderItem> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}

}
