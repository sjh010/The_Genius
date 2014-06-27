package org.sos.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the Main.
 */
@Controller
public class HomeController {
	
	@Inject
	CategoryService categoryService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {

		logger.info("home..........");
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("categoryList", categoryService.readAllCategory());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("main");
		
		return mv;
	}
	
}
