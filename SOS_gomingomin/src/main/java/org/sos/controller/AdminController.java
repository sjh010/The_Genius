package org.sos.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CharacterService;
import org.sos.service.ProductService;
import org.sos.service.UserService;
import org.sos.vo.AdminVO;
import org.sos.vo.CharacterVO;
import org.sos.vo.UserVO;
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
	UserService userService;
	
	@Inject
	CharacterService characterService;
	
	@Inject
	ProductService productService;
	

	// 관리자 페이지 요청
	@RequestMapping(method = RequestMethod.GET)
	public String getAdminLoginPage(@CookieValue(value="loginInfo", defaultValue="n") String loginInfo,
									@CookieValue(value="user_id") String user_id){
		
		// 로그인 되어 있으면 관리자 메인 페이지
		if(loginInfo.equals("y")){
			
			UserVO admin = new UserVO();
			
			try {
				admin = userService.readUser(user_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(admin.getUser_grade().equals("admin")){
				
				return "admin/main";
			}
			
		}
		
		// 로그인 되어 있지 않으면 관리자 로그인 페이지
		return "admin/admin";
	}
	
	// 관리자 로그인 후, 관리자 메인페이지 요청
	@RequestMapping(method = RequestMethod.POST)
	public String loginAction(HttpServletRequest request, HttpServletResponse response, 
								String user_id, String user_password) {
		
		logger.info("Login Action!!");
		
		UserVO admin = new UserVO();
		
		CookieGenerator cookieGenerator = new CookieGenerator();
		
		try {
			admin = userService.readUser(user_id);
		} catch (Exception e) {
			logger.info("Exception 발생");
		}
		
		// 아이디 존재 여부  확인
		if((admin != null) && (admin.getUser_id().equals(user_id))){
			
			if(admin.getUser_grade().equals("admin")){
				// 비밀번호 일치 여부 확인
				if(admin.getUser_password().equals(user_password)){
				
					// 로그인 성공 시, 쿠키 생성
					cookieGenerator.setCookieName("loginInfo");
					cookieGenerator.addCookie(response, "y");
					cookieGenerator.setCookieName("user_id");
					cookieGenerator.addCookie(response, admin.getUser_id());
					cookieGenerator.setCookieName("user_name");
					try {
						cookieGenerator.addCookie(response, URLEncoder.encode(admin.getUser_name(), "utf-8"));
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				}
				else{
				
					request.setAttribute("result", "비밀번호가 일치하지 않습니다!");
					return "admin/admin";
				}
			}
		}
		else{
			
			request.setAttribute("result", "존재하지 않는 아이디입니다!");
			return "admin/admin";
		}
		
		return "redirect:admin";
	}

}
