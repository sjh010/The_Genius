package org.sos.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.AdminService;
import org.sos.service.CharacterService;
import org.sos.service.ProductService;
import org.sos.vo.AdminVO;
import org.sos.vo.CharacterVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.CookieGenerator;


@Controller("AdminController")
@RequestMapping(value="/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@Inject
	CharacterService characterService;
	
	@Inject
	ProductService productService;
	

	// 관리자 페이지 요청
	@RequestMapping(method = RequestMethod.GET)
	public String getAdminLoginPage(@CookieValue(value="loginInfo", defaultValue="n") String loginInfo){
		
		// 로그인 되어 있으면 관리자 메인 페이지
		if(loginInfo.equals("y")){
			
			return "admin/main";
		}
		
		// 로그인 되어 있지 않으면 관리자 로그인 페이지
		return "admin/admin";
	}
	
	// 관리자 로그인 후, 관리자 메인페이지 요청
	@RequestMapping(method = RequestMethod.POST)
	public String loginAction(HttpServletRequest request, HttpServletResponse response, 
								String admin_id, String admin_password) {
		
		logger.info("Login Action!!");
		
		AdminVO admin = new AdminVO();
		
		CookieGenerator cookieGenerator = new CookieGenerator();
		
		try {
			admin = adminService.readAdmin(admin_id);
		} catch (Exception e) {
			logger.info("Exception 발생");
		}
		
		// 아이디 존재 여부  확인
		if((admin != null) && (admin.getAdmin_id().equals(admin_id))){
			
			// 비밀번호 일치 여부 확인
			if(admin.getAdmin_password().equals(admin_password)){
				
				// 로그인 성공 시, 쿠키 생성
				cookieGenerator.setCookieName("loginInfo");
				cookieGenerator.addCookie(response, "y");
				cookieGenerator.setCookieName("user_id");
				cookieGenerator.addCookie(response, admin.getAdmin_id());
				cookieGenerator.setCookieName("user_name");
				cookieGenerator.addCookie(response, admin.getAdmin_name());
				
			}
			else{
				
				request.setAttribute("result", "비밀번호가 일치하지 않습니다!");
				return "admin/admin";
			}
		}
		else{
			
			request.setAttribute("result", "존재하지 않는 아이디입니다!");
			return "admin/admin";
		}
		
		return "redirect:admin";
	}
	
	
	/*
	 * 		1. 캐릭터 관리
	 */
	
	// 캐릭터 관리 페이지 요청
	@RequestMapping(value = "/character", method = RequestMethod.GET)
	public ModelAndView getCharacterManagementPage(String pageNo){
		
		if(pageNo == null){
			pageNo = "1";
		}
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("characterList", characterService.readCharacterList(Integer.parseInt(pageNo)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/character");
		
		return mv;
	}
	
	// 캐릭터 등록 페이지 요청
	@RequestMapping(value = "/character/regist", method = RequestMethod.GET)
	public String getCharacterRegistPage(){
		
		return "admin/character/regist";
	}
	
	// 캐릭터 등록 요청
	@RequestMapping(value = "/character/registAction", method = RequestMethod.POST)
	public String characterRegistAction(HttpServletRequest request, CharacterVO character){
		
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
	
	// 캐릭터 수정 페이지 요청
	@RequestMapping(value = "/character/update", method = RequestMethod.GET)
	public ModelAndView getCharacterUpdatePage(int character_id){
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("character", characterService.readCharacter(character_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/character/update");
		
		return mv;
	}
	
	// 캐릭터 수정 요청
	@RequestMapping(value = "/character/updateAction", method = RequestMethod.POST)
	public String chracterUpdateAction(CharacterVO character){
		
		try {
			characterService.updateCharacter(character);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:character";
	}
	
	// 캐릭터 삭제 요청
	@RequestMapping(value = "/character/deleteAction", method = RequestMethod.POST)
	public String characterDeleteAction(HttpServletRequest request, int character_id){
		
		try {
			characterService.deleteCharacter(character_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", "y");
		
		return "ajax/returnResult";
	}
	
	/*
	 * 		2. 상품 관리
	 */
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView getProductManagementPage(int pageNo){
		
		if(pageNo == 0){
			pageNo = 1;
		}
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("productList", productService.readProductList(pageNo));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("amdin/product/product");
		
		return mv;
	}
	
	
	
	
	
	/*
	 * 		3. 카테고리 관리 
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
