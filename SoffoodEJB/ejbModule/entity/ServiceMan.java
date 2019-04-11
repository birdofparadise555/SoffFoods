package entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ServiceMan implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	

	private Long  completeMenuId;
	private double CompletefoodId;
	private String completeFoodName;
	private int completeTableNumber;
	private int quantity;
	
	
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getCompletefoodId() {
		return CompletefoodId;
	}
	public void setCompletefoodId(double completefoodId) {
		CompletefoodId = completefoodId;
	}
	public Long getCompleteMenuId() {
		return completeMenuId;
	}
	public void setCompleteMenuId(Long completeMenuId) {
		this.completeMenuId = completeMenuId;
	}
	public String getCompleteFoodName() {
		return completeFoodName;
	}
	public void setCompleteFoodName(String completeFoodName) {
		this.completeFoodName = completeFoodName;
	}
	public int getCompleteTableNumber() {
		return completeTableNumber;
	}
	public void setCompleteTableNumber(int completeTableNumber) {
		this.completeTableNumber = completeTableNumber;
	}
	
	
	
}
