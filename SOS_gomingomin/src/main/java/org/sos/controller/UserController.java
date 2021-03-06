package org.sos.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CharacterService;
import org.sos.service.UserCharacterService;
import org.sos.service.UserService;
import org.sos.vo.CharacterVO;
import org.sos.vo.PagingVO;
import org.sos.vo.UserCharacterVO;
import org.sos.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.CookieGenerator;


@Controller("UserController")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService userService;
	
	@Inject
	UserCharacterService userCharacterService;
	
	@Inject
	CharacterService characterService;
	
	/*
	 * 로그인 요청
	 */
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(HttpServletResponse response, HttpServletRequest request,
								String user_id, String user_password){

		UserVO user = new UserVO();
		CookieGenerator cookieGenerator = new CookieGenerator();
		
		try {
			user = userService.readUser(user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 아이디 존재 여부  확인
		if((user != null) && (user.getUser_id().equals(user_id))){
			
			// 비밀번호 일치 여부 확인
			if(user.getUser_password().equals(user_password)){
				
				// 로그인 성공 시, 쿠키 생성
				
			
				cookieGenerator.setCookieName("loginInfo");
				cookieGenerator.addCookie(response, "y");
			
				cookieGenerator.setCookieName("user_id");
				cookieGenerator.addCookie(response, user.getUser_id());
				
				cookieGenerator.setCookieName("user_grade");
				cookieGenerator.addCookie(response, user.getUser_grade());
				
				
				try {
					cookieGenerator.setCookieName("user_name");
					cookieGenerator.addCookie(response, URLEncoder.encode(user.getUser_name(), "utf-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
					
					if(userCharacterService.readUserCharacter(user_id) == null){
						
						request.setAttribute("characterSelectFlag", "n");
						
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			else{
				
				request.setAttribute("result", "비밀번호가 일치하지 않습니다!");
			}
		}
		else{
			
			request.setAttribute("result", "존재하지 않는 아이디입니다!");
		}
		
		return "/user/ajax/returnResult";
		
	}
	
	// 관리자 로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String getAdminLogOut(HttpServletRequest request, HttpServletResponse response){
			
			logger.info("logout..........");
			
			CookieGenerator cookieGenerator = new CookieGenerator();
			cookieGenerator.setCookieName("loginInfo");
			cookieGenerator.addCookie(response, "n");
			cookieGenerator.setCookieName("user_grade");
			cookieGenerator.addCookie(response, null);		
			
			return "redirect:/";
		}

	/*
	 * 회원가입 페이지 요청
	 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String getJoinPage(){
		
		System.out.println("join 페이지에 오신 것을 환영합니다.");
		return "user/join"; 
	}
	
	/*
	 * 회원 기본정보 입력받아 DB 저장 후, 쿠키 생성
	 */
	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinAction(HttpServletRequest request, HttpServletResponse response, UserVO user, UserCharacterVO userCharacter) throws Exception{
		
		logger.info("joinAction..........");
		
		logger.info(user.toString());
		logger.info(userCharacter.toString());
		
		userService.registUser(user);
		userCharacterService.registUserCharacter(userCharacter);
		
		CookieGenerator cookieGenerator = new CookieGenerator();
		
		cookieGenerator.setCookieName("loginInfo");
		cookieGenerator.addCookie(response, "y");
		cookieGenerator.setCookieName("user_id");
		cookieGenerator.addCookie(response, user.getUser_id());
		cookieGenerator.setCookieName("user_grade");
		cookieGenerator.addCookie(response, user.getUser_grade());
		
		try {
			cookieGenerator.setCookieName("user_name");
			cookieGenerator.addCookie(response, URLEncoder.encode(user.getUser_name(), "utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", "y");
		
		return "/user/ajax/returnResult";	
	}
	
	/*
	 * 회원가입 시 아이디 중복 체크
	 */
	@RequestMapping(value = "user/checkUserId", method = RequestMethod.GET)
	public String checkUserId(String user_id, HttpServletRequest request) throws Exception{
		
		logger.info("checkUserId..........");
		logger.info("checkUserId..........:" + user_id);
		
		UserVO user = userService.readUser(user_id);
		logger.info(""+user);
		
		String checkFlag = "y";
		
		if(user != null){
			
			checkFlag = "n";
		}
		
		request.setAttribute("result", checkFlag);
		
		return "/user/ajax/returnResult";
	}
	
	@RequestMapping(value = "/user/getCharacterInfo", method = RequestMethod.GET)
	public String getCharacterInfo(String user_sex, HttpServletRequest request) throws Exception{
		logger.info("getCharacterInfo.............." + user_sex);
		//USER_SEX와 같은 것이 된 것만 
		
		List<CharacterVO> list = characterService.readSexCharacterList(user_sex);
		logger.info(list.toString());
		
		for(int i=0; i<list.size(); i++){
			list.get(i).toString();
		}
		
		request.setAttribute("characterList", list);
		
		return "user/ajax/getCharacterInfo";
		
	}
	
	/*
	 * 마이페이지 요청(비밀번호 재확인)
	 */
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String getPasswordCheckPage(){
		
		return "user/myPage";
	}
	
	/*
	 * 비밀번호 확인 후, 회원 정보 수정페이지 요청
	 */
	@RequestMapping(value="/myPage", method = RequestMethod.POST)
	public String passwordCheckAction(@CookieValue(value="user_id") String user_id, String user_password,
										Model result){
		
		UserVO user = new UserVO();
		
		try {
			user = userService.readUser(user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(user.getUser_password().equals(user_password)){
			
			return "redirect:/myPage/update";
		}
		else{
		
			result.addAttribute("result", "비밀번호가 일치하지 않습니다!");
		
			return "user/myPage";
		}
		
	}
	
	/*
	 * 회원 정보 수정 페이지 요청
	 */
	@RequestMapping(value = "/myPage/update", method = RequestMethod.GET)
	public ModelAndView getModifyPage(@CookieValue(value="user_id") String user_id, 
									HttpServletRequest request) throws Exception{
		
		logger.info("modify..........");
		logger.info(user_id);
		
		ModelAndView modelAndView = new ModelAndView();
		
		try {
			UserVO user = userService.readUser(user_id);
			modelAndView.addObject("UserVO", user);
			modelAndView.setViewName("/user/update");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;	
	}
	
	@RequestMapping(value = "/myPage/updateAction", method = RequestMethod.POST)
	public String modifyAction(HttpServletRequest request, UserVO user){
		
		String result = "y";
		
		logger.info("modifyAction..........");
		try {
			userService.updateUser(user);
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "n";
		}
		request.setAttribute("result", result);
		
		return "user/ajax/returnResult";
	}
	
	@RequestMapping(value = "/myPage/deleteAction", method = RequestMethod.POST)
	public String deleteAction(HttpServletRequest request, HttpServletResponse response,String user_id){
		logger.info("deleteAction..........");
		
		String result = "y";
		
		try {
			userService.deleteUser(user_id);
			userCharacterService.deleteUserCharacter(user_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "n";
		}
		
		if(result.equals("y")){
			CookieGenerator cookieGenerator = new CookieGenerator();
			cookieGenerator.setCookieName("loginInfo");
			cookieGenerator.addCookie(response, "n");
			cookieGenerator.setCookieName("user_id");
			cookieGenerator.addCookie(response, null);
			cookieGenerator.setCookieName("user_grade");
			cookieGenerator.addCookie(response, null);	
		}
		
		request.setAttribute("result", result);
		
		return "user/ajax/returnResult";
	}
	
	/*
	 * 회원 리스트 요청
	 */
	@RequestMapping(value = "/admin/userManage", method = RequestMethod.GET)
	public ModelAndView getUserManagePage(String page){
		int pageNo = (page == null) ? 1 : Integer.parseInt(page);
		
		ModelAndView mv = new ModelAndView();
		
		try {
			PagingVO pagingVo = userService.calcPaging(pageNo);
			mv.addObject("paging", pagingVo);
			mv.addObject("userList", userService.readUserList(pageNo));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/userManage/userManage");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/userManage/updateUserGrade", method = RequestMethod.POST)
	public String updateUserGrade(HttpServletRequest request, UserVO userVo){
		
		try {
			userService.updateUserGrade(userVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("result", "n");
		}
		
		request.setAttribute("result", "y");
		
		return "ajax/returnResult";
		
	}
	
	
	
}
