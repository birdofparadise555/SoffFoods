package controller;



import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Soffood;
import service.SofService;

public class addorder {
	@RequestMapping("/TetsShowProduct")
	public ModelAndView TetsShowProduct( HttpServletRequest request){
		ModelAndView mv = new ModelAndView("TetsShowProduct.jsp");
	
		
		
		return mv;
		
	} 
	
	
}
