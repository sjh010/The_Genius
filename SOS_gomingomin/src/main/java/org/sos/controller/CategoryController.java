package org.sos.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CategoryService;
import org.sos.vo.CategoryVO;
import org.sos.vo.CharacterVO;
import org.sos.vo.FileVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@Inject
	CategoryService categoryService;
	
	//카테고리 관리 페이지 요청
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getCategoryManagementPage(){
		
		logger.info("getCategoryManagementPage..........");
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("categoryList", categoryService.readAllCategory());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/category/category");
		
		return mv;
	}

	//카테고리 수정 페이지 요청
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView getCategoryUpdatePage(String category_id){
		
		logger.info("getCategoryUpdatePage.........");
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("categoryList", categoryService.readPartCategory(Integer.parseInt(category_id)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/category/update");
		
		return mv;
	}	
	
	// 카테고리 등록 페이지 요청
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public ModelAndView getCategoryRegistPage(){
		
		logger.info("getCategoryRegistPage.........");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("admin/category/regist");
		
		return mv;
	}
	
	// 카테고리 등록 Action
	@RequestMapping(value = "/registAction", method = RequestMethod.POST)
	public String categoryRegistAction(HttpServletRequest request, CategoryVO category) {
		logger.info(category.toString());
		int category_id = 0;
		try {
			categoryService.registCategory(category);
			category_id = categoryService.getCategoryId();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", category_id);
		
		return "ajax/returnResult";
	}
	
	//카테고리 업데이트 Action
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public String categoryUpdateAction(HttpServletRequest request, CategoryVO category) {
		
		try {
			categoryService.updateCategory(category);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", "y");
		
		return "ajax/returnResult";
	}
	
	//카테고리 삭제 Action
	@RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
	public String categoryDeleteAction(HttpServletRequest request, int category_id){
		
		try {
			categoryService.deleteCategory(category_id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", "y");
		
		return "/ajax/returnResult";
	}
	
	//하위 카테고리 삭제 Action
		@RequestMapping(value = "/deleteParentAction", method = RequestMethod.POST)
		public String categoryParentDeleteAction(HttpServletRequest request, int category_parent_id){
			
			try {
				categoryService.deleteParentCategory(category_parent_id);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("result", "y");
			
			return "/ajax/returnResult";
		}
		
	
	//카테고리 상세보기 Action
	@RequestMapping(value = "/getInfo", method = RequestMethod.POST)
	public String categoryGetInfo(HttpServletRequest request, int category_id){
		
		CategoryVO category = null;
		
		try {
			category = categoryService.readCategory(category_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", category);
		
		return "/ajax/returnResult";
	}
	
}
