package entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Dessert implements Serializable  {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	private long dessertId;
	private String dessertName;
	private Double dessertPrice;
	private String dessertImage;
	private int dessertQuantity;
	
	
	public long getDessertId() {
		return dessertId;
	}
	public void setDessertId(long dessertId) {
		this.dessertId = dessertId;
	}
	public String getDessertName() {
		return dessertName;
	}
	public void setDessertName(String dessertName) {
		this.dessertName = dessertName;
	}
	public Double getDessertPrice() {
		return dessertPrice;
	}
	public void setDessertPrice(Double dessertPrice) {
		this.dessertPrice = dessertPrice;
	}
	public String getDessertImage() {
		return dessertImage;
	}
	public void setDessertImage(String dessertImage) {
		this.dessertImage = dessertImage;
	}
	public int getDessertQuantity() {
		return dessertQuantity;
	}
	public void setDessertQuantity(int dessertQuantity) {
		this.dessertQuantity = dessertQuantity;
	}
	
	
	
	
	
}
