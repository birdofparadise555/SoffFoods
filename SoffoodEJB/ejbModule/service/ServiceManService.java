package service;

import java.util.List;

import entity.ServiceMan;


public interface ServiceManService {
	
	public void insert(ServiceMan completeMenuId);

	public void update(ServiceMan completeMenuId);

	public void delete(long completeMenuId);

	public ServiceMan findServiceManId(long completeMenuId);

	public List<ServiceMan> getAllServiceMan();
	
	public List<ServiceMan>findServiceMan(String completemenu);
	
	

}
