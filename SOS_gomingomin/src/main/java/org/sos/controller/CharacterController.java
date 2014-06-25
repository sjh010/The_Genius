package org.sos.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CharacterService;
import org.sos.service.UserCharacterService;
import org.sos.vo.CharacterVO;
import org.sos.vo.FileVO;
import org.sos.vo.UserCharacterVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = {"/admin/character", "/join"})
public class CharacterController{
	
	private static final Logger logger = LoggerFactory.getLogger(CharacterController.class);
	
	@Inject
	CharacterService characterService;
	
	@Inject
	UserCharacterService userCharacterService;
	
	@RequestMapping(value = "/selectCharacter", method = RequestMethod.GET)
	public ModelAndView getSelectCharacterPage(){
		
		logger.info("selectCharacter............");
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("chracterList", characterService.readAllCharacterList());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("user/selectCharacter");
		
		return mv;
	}
	
	@RequestMapping(value = "/selectCharacter", method = RequestMethod.POST)
	public String getCharacterSelectPage(UserCharacterVO userCharacter,
						@CookieValue(value="user_id", required=true, defaultValue="null") String user_id){
		
		userCharacter.setUser_id(user_id);
		
		try {
			userCharacterService.registUserCharacter(userCharacter);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/";
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getCharacterManagementPage(String pageNo){
		
		logger.info("getCharacterManagementPage..........");
		
		if(pageNo == null){
			pageNo = "1";
		}
		
		logger.info("pageNo : " + pageNo);
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("characterList", characterService.readCharacterList(Integer.parseInt(pageNo)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/character/character");
		
		return mv;
	}
	
	// 캐릭터 등록 페이지 요청
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String getCharacterRegistPage(){
		
		return "admin/character/regist";
	}
	
	// 캐릭터 등록 요청
	@RequestMapping(value = "/registAction", method = RequestMethod.POST)
	public String characterRegistAction(HttpServletRequest request, CharacterVO character, FileVO file){
		
		logger.info("Character : " + character.toString());
		
		if(file.getFile().getSize() > 0){
			
			String uid = System.currentTimeMillis() + "_" + file.getFile().getOriginalFilename();
		
			file.setUid(uid);
			
			character.setCharacter_img(uid);
			
			try {
				characterService.registFile(file);
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
	
	// 캐릭터 수정 페이지 요청
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView getCharacterUpdatePage(String character_id){
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("character", characterService.readCharacter(Integer.parseInt(character_id)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/character/update");
		
		return mv;
	}
	
	// 캐릭터 수정 요청
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
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
	@RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
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
	
	
}
