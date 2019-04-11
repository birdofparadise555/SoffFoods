package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.annotation.SessionAttributesHandler;
import org.springframework.web.servlet.ModelAndView;

import entity.Dessert;
import entity.Drink;
import entity.FoodOrder;
import entity.OrderItem;
import entity.ServiceMan;
import entity.Soffood;
import service.DessertService;
import service.DrinkService;
import service.FoodOrderService;
import service.OrderItemService;
import service.ServiceManService;
import service.SofService;

@Controller

public class SoffoodController {
	
	
	
	@EJB(mappedName = "ejb:/SoffodWeb/SoffoodServiceBean!service.SofService")
	SofService pmService;
	
	@EJB(mappedName = "ejb:/SoffodWeb/OrderServiceBean!service.FoodOrderService")
	FoodOrderService foodOrderServ;
	
	@EJB(mappedName = "ejb:/SoffodWeb/OrderItemServiceBean!service.OrderItemService")
	OrderItemService orderItemServ;
	
	@EJB(mappedName = "ejb:/SoffodWeb/ServiceManServiceBean!service.ServiceManService")
	ServiceManService ServicemanList;
	
	@EJB(mappedName = "ejb:/SoffodWeb/DrinkServiceBean!service.DrinkService")
	DrinkService DrinkServ;
	
	@EJB(mappedName = "ejb:/SoffodWeb/DessertServiceBean!service.DessertService")
	DessertService DessertServ;
	
	
	
	
	
	
	
	@RequestMapping("/dessert")
	public ModelAndView movetodesert(@ModelAttribute("foods") Dessert foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("dessert.jsp");
		List<Dessert> foodsList;
		try {
			foodsList = DessertServ.getAllDessert();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping("/drink")
	public ModelAndView movetodrinking(@ModelAttribute("foods") Drink foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("drink.jsp");
		List<Drink> foodsList;
		try {
			foodsList = DrinkServ.getAllDrink();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping("/saveDessert")
	public String saveDessert(@ModelAttribute("foods") Dessert foods, BindingResult result, HttpServletRequest request) {
		System.out.println("/saveFoods");
		System.out.println(foods.getDessertName());
		System.out.println(foods.getDessertPrice());
		try {
			if (foods.getDessertId() == 0) {
				DessertServ.insert(foods);
			} else {
				DessertServ.update(foods);
			}
		} catch (Exception e) {
		}
		return "redirect:addDessert.do";
	}
	

	@RequestMapping("/foodsForm")
	public ModelAndView newFood(@ModelAttribute("foods") Soffood foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("foodsForm.jsp");
		return mv;
	}
	
	@RequestMapping("/addDrink")
	public ModelAndView addDrink(@ModelAttribute("food") Drink food, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("addDrink.jsp");
		List<Drink> foodsList;
		try {
			foodsList = DrinkServ.getAllDrink();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/deleteDessert")
	public String deleteDesserts(HttpServletRequest request) {
		DessertServ.delete(Long.valueOf(request.getParameter("id")));
		return "redirect:addDessert.do";

	}
	
	
	
	@RequestMapping("/addDessert")
	public ModelAndView addDesserts(@ModelAttribute("food") Dessert food, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("addDessert.jsp");
		List<Dessert> foodsList;
		try {
			foodsList = DessertServ.getAllDessert();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
	@RequestMapping("/saveFoods")
	public String saveFood(@ModelAttribute("foods") Soffood foods, BindingResult result, HttpServletRequest request) {
		System.out.println("/saveFoods");
		System.out.println(foods.getFoodName());
		System.out.println(foods.getPrice());
		try {
			if (foods.getFoodId() == 0) {
				pmService.insert(foods);
			} else {
				pmService.update(foods);
			}
		} catch (Exception e) {
		}
		return "redirect:drinkForm.do";
	}
	

	 
	
	//Function For Save List Foods From Chef to Serviceman
	
	@RequestMapping("/saveListfoodfromChefFoods")
	public String saveListfoodfromChefFoods(@ModelAttribute("listfoodfromchef") ServiceMan listfoodfromchef,OrderItem deletele, BindingResult result, HttpServletRequest request) {
		System.out.println("/saveListfoodfromChefFoods");
		System.out.println(listfoodfromchef.getCompleteMenuId());
		System.out.println(listfoodfromchef.getCompletefoodId());
		System.out.println(listfoodfromchef.getCompleteFoodName());
		System.out.println(listfoodfromchef.getQuantity());
		System.out.println(listfoodfromchef.getCompleteTableNumber());
		try {
			if (listfoodfromchef.getCompleteMenuId() == 0) {
				ServicemanList.insert(listfoodfromchef);
			} else {
				ServicemanList.update(listfoodfromchef);
			}
			orderItemServ.delete(Long.valueOf(request.getParameter("deleteId")));
			
		} catch (Exception e) {
		}
		
		return "redirect:chefList.do";
	}
	
	@RequestMapping("/editFoods")
	public ModelAndView editFood(HttpServletRequest request) {
		int foodsId = Integer.parseInt(request.getParameter("id"));
		Soffood foundFoods;
		ModelAndView mv = new ModelAndView("drinkForm.do");
		try {
			foundFoods = pmService.findfoodsId(foodsId);
			mv.addObject("foods", foundFoods);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/deleteFoods")
	public String deleteFood(HttpServletRequest request) {
		pmService.delete(Long.valueOf(request.getParameter("id")));
		return "redirect:drinkForm.do";

	}
	
	@RequestMapping("/deleteDrink")
	public String deleteDrinks(HttpServletRequest request) {
		DrinkServ.delete(Long.valueOf(request.getParameter("id")));
		return "redirect:addDrink.do";

	}
	
	
	
	
	
	@RequestMapping("/welcome")
	public ModelAndView welcome(@ModelAttribute("foods") Soffood foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("welcome.jsp");

		return mv;
	}
	@RequestMapping("/receipt")
	public ModelAndView receipt(@ModelAttribute("foods") Soffood foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("receipt.jsp");

		return mv;
	}
	
	@RequestMapping("/deleteListfood")
	public String deleteListFood(HttpServletRequest request) {
		ServicemanList.delete(Long.valueOf(request.getParameter("id")));
		return "redirect:serviceman.do";

	}

	@RequestMapping("/listFoods")
	public ModelAndView listFood(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("listFoods.jsp");
		List<Soffood> foodsList;
		try {
			foodsList = pmService.getAllSoffood();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
	
	@RequestMapping("/listFoodsforchef")
	public ModelAndView listRequestFromChef(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("chefList.jsp");
		List<OrderItem> foodsList;
		try {
			foodsList = orderItemServ.getAllOrderItem();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("/adddrink")
	public ModelAndView adddrink(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("adddrink.jsp");
		List<Drink> foodsList;
		try {
			foodsList = DrinkServ.getAllDrink();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("/foods")
	public ModelAndView foods(HttpServletRequest request) {
		request.getParameter("tableNumber");
		ModelAndView mv = new ModelAndView("foods.jsp");
		
		List<Soffood> foodsList;
		try {
			foodsList = pmService.getAllSoffood();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}

	// ----------------------Drink-----------------------

	@RequestMapping("/drinkForm")
	public ModelAndView newDrink(@ModelAttribute("food") Soffood food, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("addFoods.jsp");
		List<Soffood> foodsList;
		try {
			foodsList = pmService.getAllSoffood();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	

	@RequestMapping("/showMenu")
	public ModelAndView showMenu(@ModelAttribute("foods") Soffood foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("showMenus.jsp");
		return mv;
	}

	

	
	@RequestMapping("/TetsShowProduct")
	public ModelAndView TetsShowProduct(HttpServletRequest request, HttpSession httpSession) {
		ModelAndView mv = new ModelAndView("TetsShowProduct.jsp");

		
		List<Soffood> foods;
		try {
			foods = pmService.getAllSoffood();
			mv.addObject("foods", foods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return mv;

	}

	@RequestMapping("/show")
	public ModelAndView show(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("show.jsp");
		return mv;
	}
	
	@RequestMapping("/addorder")
	public String addorder(HttpServletRequest request, @RequestBody String cart) throws JsonParseException, JsonMappingException, IOException {
		System.out.println("/saveFoods");

		System.out.println(cart);

		ObjectMapper mapper = new ObjectMapper();

		List<OrderItem> foods = new ArrayList<OrderItem>();
		
		FoodOrder order = new FoodOrder();
		foods = mapper.readValue(cart, new TypeReference<List<OrderItem>>() {});
		try {
			
			if (order.getFoodOrderId() == null) {
				order.setOrderTable(request.getParameter("table"));
				order.setOrderDate(new Date());
				//Identify Number of Table Under Here!!! 
				//				Add Number Table Here
				long orderId = foodOrderServ.insert(order);
				for (OrderItem food : foods) {
					food.setNumberTable(Integer.parseInt(request.getParameter("tableNumber")));
					food.setFoodOrder(foodOrderServ.findFoodOrder(orderId));
					
					orderItemServ.insert(food);
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:foods.do";
	}

	
	
	
	
	
	

	

	@RequestMapping("/foodsset")
	public ModelAndView movetofoodsset(@ModelAttribute("foods") Soffood foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("foodsset.jsp");
		List<Soffood> foodsList;
		try {
			foodsList = pmService.getAllSoffood();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/index")
	public ModelAndView movetoindexpage(@ModelAttribute("foods") Soffood foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("index.jsp");
		List<Soffood> foodsList;
		try {
			foodsList = pmService.getAllSoffood();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/order")
	public ModelAndView movetoorderpage(@ModelAttribute("foods") Soffood foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("order.jsp");
		List<Soffood> foodsList;
		try {
			foodsList = pmService.getAllSoffood();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	

	
	

	@RequestMapping("/chefList")
	public ModelAndView movetochefList(@ModelAttribute("foods") OrderItem foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("chefList.jsp");
		List<OrderItem> foodsList;
		try {
			foodsList = orderItemServ.getAllOrderItem();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/serviceman")
	public ModelAndView showdetailoflistItem(@ModelAttribute("foods") OrderItem foods, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("serviceman.jsp");
		List<ServiceMan> foodsList;
		try {
			foodsList = ServicemanList.getAllServiceMan();
			mv.addObject("foodsList", foodsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
////	
//	
	
	
	

}
