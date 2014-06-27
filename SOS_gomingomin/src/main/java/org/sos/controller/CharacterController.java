package org.sos.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CharacterService;
import org.sos.service.UserCharacterService;
import org.sos.vo.CharacterVO;
import org.sos.vo.FileVO;
import org.sos.vo.UserCharacterVO;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("CharacterController")
@RequestMapping(value = {"/admin", "/join/"})
public class CharacterController{
	
	private static final Logger logger = LoggerFactory.getLogger(CharacterController.class);
	
	@Inject
	CharacterService characterService;
	
	@Inject
	UserCharacterService userCharacterService;
	
	/*
	 * 캐릭터 선택화면 요청
	 */
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
	
	/*
	 * 캐릭터 선택 후, 등록 요청
	 */
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
	
	/*
	 *  캐릭터 관리 메인화면 요청
	 */
	@RequestMapping(value = "/character" , method = RequestMethod.GET)
	public ModelAndView getCharacterManagementPage(){
		
		logger.info("getCharacterManagementPage..........");
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("characterList", characterService.readAllCharacterList());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/character/character");
		
		return mv;
	}
	
	/*
	 * 캐릭터 등록 화면 요청
	 */
	@RequestMapping(value = "/character/regist", method = RequestMethod.GET)
	public String getCharacterRegistPage(){
		
		return "admin/character/regist";
	}
	
	/*
	 * 캐릭터 등록 요청
	 */
	@RequestMapping(value = "character/regist", method = RequestMethod.POST)
	public void characterRegistAction(HttpSession session, CharacterVO character, FileVO file, Model model){
		
		logger.info("Character : " + character.toString());
		
		if(file.getFile().getSize() > 0){
			
			String uid = System.currentTimeMillis() + "_" + file.getFile().getOriginalFilename();
		
			file.setUid(uid);
			
			character.setCharacter_img(uid);
			
			try {
				
				characterService.registFile(file);
				
				File saveFile = new File(session.getServletContext().getRealPath("/") + 
											"/resources/images/" + file.getUid());
				

				file.getFile().transferTo(saveFile);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
		try {
			characterService.registCharacter(character);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			model.addAttribute("result", "n");
		}
		
		model.addAttribute("result", "y");
		
	}
	
	/*
	 * 캐릭터 수정 화면 요청
	 */
	@RequestMapping(value = "/character/update", method = RequestMethod.GET)
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
	
	/*
	 * 캐릭터 수정 요청
	 */
	@RequestMapping(value = "character/updateAction", method = RequestMethod.POST)
	public String chracterUpdateAction(HttpSession session, CharacterVO character, FileVO file){
		
		logger.info("updateAction..........");
		logger.info("CharacterVO : " + character);
		
		if(file.getFile().getSize() > 0){
			
			String downloadDirectory = session.getServletContext().getRealPath("/") + "/resources/images/";
			
			File beforeImage = new File(downloadDirectory + character.getCharacter_img());
			
			beforeImage.delete();
			
			String uid = System.currentTimeMillis() + "_" + file.getFile().getOriginalFilename();
		
			file.setUid(uid);
			
			character.setCharacter_img(uid);
			
			try {
				
				characterService.registFile(file);
				
				File saveFile = new File(downloadDirectory + file.getUid());
				
				file.getFile().transferTo(saveFile);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
				
		try {
			characterService.updateCharacter(character);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/admin/character";
	}
	
	/*
	 * 캐릭터 삭제 요청
	 */
	@RequestMapping(value = "/character/deleteAction", method = RequestMethod.POST)
	public String characterDeleteAction(HttpServletRequest request, int character_id){
		
		String downloadDirectory = 
				request.getSession().getServletContext().getRealPath("/") + "/resources/images/";
		
		try {
			File image = new File(downloadDirectory + 
					characterService.readCharacter(character_id).getCharacter_img());
			image.delete();
			
			characterService.deleteCharacter(character_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", "y");
		
		return "/ajax/returnResult";
	}
	
	
}
