package org.sos.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.UserService;
import org.sos.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller("UserController")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService userService;

	// 회원 가입 페이지 요청
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String getJoinPage(){
		
		return "user/join"; 
	}
	
	// 회원 기본정보 입력 받아 DB저장 후, 캐릭터 선택페이지로 이동
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView joinAction(UserVO user) throws Exception{
		
		logger.info("joinAction..........");
		
		ModelAndView modelAndView = new ModelAndView();
		
		userService.registUser(user);
		
		modelAndView.addObject("user_id", user.getUser_id());
		modelAndView.setViewName("selectCharacter");
		
		return modelAndView;	
	}
	
	// 회원 가입 시 아이디 중복체크
	@RequestMapping(value = "user/checkUserId", method = RequestMethod.GET)
	public String checkUserId(HttpServletRequest request) throws Exception{
		
		logger.info("checkUserId..........");
		logger.info("user_id : " + request.getParameter("user_id"));
		
		UserVO user = userService.readUser(request.getParameter("userid"));
		
		String checkFlag = "n";
		
		if(user != null){
			
			checkFlag = "y";
		}
		
		request.setAttribute("checkUserId", checkFlag);
		
		return "checkUserId";
	}

}
