package org.sos.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.UserService;
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
	
	//로그인 요청 -> ajax 논의 해봐야함
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
				
				cookieGenerator.setCookieName("user_name");
				
				try {
					cookieGenerator.addCookie(response, URLEncoder.encode(user.getUser_name(), "utf-8"));
				} catch (UnsupportedEncodingException e) {
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

	// 회원 가입 페이지 요청
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String getJoinPage(){
		
		return "user/join"; 
	}
	
	// 회원 기본정보 입력 받아 DB저장 후 가입 아이디 반환
	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinAction(HttpServletResponse response, UserVO user) throws Exception{
		
		logger.info("joinAction..........");
		
		logger.info(user.toString());
		
		userService.registUser(user);
		
		CookieGenerator cookieGenerator = new CookieGenerator();
		
		cookieGenerator.setCookieName("loginInfo");
		cookieGenerator.addCookie(response, "y");
		cookieGenerator.setCookieName("user_id");
		cookieGenerator.addCookie(response, user.getUser_id());
		cookieGenerator.setCookieName("user_name");
		try {
			cookieGenerator.addCookie(response, URLEncoder.encode(user.getUser_name(), "utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/join/selectCharacter";	
	}
	
	// 회원 가입 시 아이디 중복체크
	@RequestMapping(value = "user/checkUserId", method = RequestMethod.GET)
	public String checkUserId(HttpServletRequest request) throws Exception{
		
		logger.info("checkUserId..........");
		logger.info("user_id : " + request.getParameter("user_id"));
		
		UserVO user = userService.readUser(request.getParameter("user_id"));
		
		String checkFlag = "n";
		
		if(user != null){
			
			checkFlag = "y";
		}
		
		request.setAttribute("result", checkFlag);
		
		return "/user/ajax/returnResult";
	}
	
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String getPasswordCheckPage(){
		
		return "user/myPage";
	}
	
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
	
	@RequestMapping(value = "/myPage/update", method = RequestMethod.GET)
	public ModelAndView getModifyPage(HttpServletRequest request, Model model) throws Exception{
		
		logger.info("modify..........");
		logger.info("user_id : " + request.getParameter("user_id"));
		
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO user = userService.readUser(request.getParameter("user_id"));
		modelAndView.addObject("UserVO", user);
		modelAndView.setViewName("/user/modify");
		
		
		return modelAndView;	
	}
	
	public String modifyAction(UserVO user){
		
		return null;
	}
	
	
	
	
	
}
