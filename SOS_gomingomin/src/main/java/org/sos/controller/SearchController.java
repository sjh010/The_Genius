package org.sos.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CategoryService;
import org.sos.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/search")
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	ProductService productService;
	
	@Inject
	CategoryService categoryService;

	@RequestMapping(method = RequestMethod.GET)
	public String getProductCode(HttpServletRequest request, String keyword){
		
		logger.info("keyword : " + keyword);
		
		try {
			request.setAttribute("productCodeList", productService.searchProduct(keyword));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "search";
	}
	
	@RequestMapping(value = "searchCategory", method = RequestMethod.GET)
	public ModelAndView categorySearch(int category_id){
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("productList", productService.readCategoryProductList(category_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("search/category");
		
		return mv;
		
	}
	
}
