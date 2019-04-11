package entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class Drink implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long drinkId;
	private String drinkName;
	private Double drinkPrice;
	private String drinkImage;
	private int quantity;
	
	
	public long getDrinkId() {
		return drinkId;
	}
	public void setDrinkId(long drinkId) {
		this.drinkId = drinkId;
	}
	public String getDrinkName() {
		return drinkName;
	}
	public void setDrinkName(String drinkName) {
		this.drinkName = drinkName;
	}
	public Double getDrinkPrice() {
		return drinkPrice;
	}
	public void setDrinkPrice(Double drinkPrice) {
		this.drinkPrice = drinkPrice;
	}
	public String getDrinkImage() {
		return drinkImage;
	}
	public void setDrinkImage(String drinkImage) {
		this.drinkImage = drinkImage;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	

}
