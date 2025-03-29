package org.jsp;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodItemController {
	
	@Autowired
	EntityManager em;
	
	@RequestMapping("/save")
	public ModelAndView save(@RequestParam String name,
								@RequestParam String description,
								@RequestParam String category,
								@RequestParam String type,
								@RequestParam double price,
								@RequestParam double rating,
								@RequestParam String image
								) 
	{
		FoodItem fi = new FoodItem(0, name, description, category, type, price, rating, image);
		
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(fi);
		et.commit();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		return mv;
	}

	@RequestMapping("/all")
	public ModelAndView findAllFoodItems() {
		
		List<FoodItem> fil=  em.createQuery("from FoodItem").getResultList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("allfooditems.jsp");
		mv.addObject("fil",fil);
		return mv;
	}
	
	@RequestMapping("/menu")
	public ModelAndView menu() {
		
		List<FoodItem> menu=  em.createQuery("from FoodItem").getResultList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("menu.jsp");
		mv.addObject("menu",menu);
		return mv;
	}
	
	@RequestMapping("/deleteItem")
	public ModelAndView deleteFoodById(@RequestParam int id)
	{
		FoodItem fi = em.find(FoodItem.class,id);
		
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.remove(fi);
		et.commit();
		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("allEmp.jsp");
		return findAllFoodItems().addObject("del","Item Id: "+fi.getId()+" , "+fi.getName()+" Deleted successfully");
	}
	
	@RequestMapping("/updateFoodPage")
	public ModelAndView updateFoodPage(@RequestParam int id) {
		
		FoodItem f = em.find(FoodItem.class, id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatefooditems.jsp");
		mv.addObject("f",f);
		return mv;
	}
	
	
	@RequestMapping("/updateFood")
	public ModelAndView updateById(@RequestParam int id,
			@RequestParam String name,
			@RequestParam String description,
			@RequestParam String category,
			@RequestParam String type,
			@RequestParam double price,
			@RequestParam double rating,
			@RequestParam String image) 
	{
		FoodItem f = em.find(FoodItem.class,id);
		f.setId(id);
		f.setName(name);
		f.setDescription(description);
		f.setCategory(category);
		f.setType(type);
		f.setPrice(price);
		f.setRating(rating);
		f.setImage(image);
		
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.merge(f);
		et.commit();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("allfooditems.jsp");
//		mv.addObject("e", e);
		return findAllFoodItems();

	}
}
