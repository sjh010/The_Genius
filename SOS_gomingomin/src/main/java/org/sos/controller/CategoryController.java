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

	//카테고리 관리 페이지 요청, 카테고리 category_id or parent_id가 넘어온 것이면 다 뽑아다가 vo로 만들어서 넘겨주자.
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
	
	// 캐릭터 등록 요청
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public ModelAndView getCategoryRegistPage(){
		
		logger.info("getCategoryRegistPage.........");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("admin/category/regist");
		
		return mv;
	}
	
	/*
	//카테고리 등록 요청
	@RequestMapping(value = "/registAction", method = RequestMethod.POST)
	public String characterRegistAction(HttpServletRequest request, CharacterVO character, FileVO file){
		
		logger.info("Character : " + character.toString());
		
		if(file.getFile().getSize() > 0){
			
			String uid = System.currentTimeMillis() + "_" + file.getFile().getOriginalFilename();
		
			file.setUid(uid);
			
			character.setCharacter_img(uid);
			
			try {
				categoryService.registFile(file);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
		try {
			characterService.registCharacter(character);
			
		} catch (Exception e) {
			
			request.setAttribute("result", "n");
			e.printStackTrace();
			return "ajax/returnResult";
		}
		
		request.setAttribute("result", "y");
			
		return "ajax/returnResult";
	}


	
	// 캐릭터 수정 요청
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public String categoryUpdateAction(CategoryVO category){
		
		try {
			categoryService.updateCategory(category);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//이거 다시 줘야하지 않나?
		return "redirect:category";
	}
	
	// 캐릭터 삭제 요청
	@RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
	public String characterDeleteAction(HttpServletRequest request, int category_id){
		
		try {
			categoryService.deleteCategory(category_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//일단 테스트
		request.setAttribute("result", "y");
		
		return "ajax/returnResult";
	}
	*/
	
}
