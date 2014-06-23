package org.sos.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Service
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		boolean result = false;
		String loginPath = "/admin";
		
		logger.info("I'm Login Checker!");
	
		Cookie[] cookie = request.getCookies();
		
		if(cookie != null){
			
			for(Cookie c : cookie){
				
				logger.info("Cookie : " + c.getName() + " : " + c.getValue());
				
				if(c.getName().equals("loginInfo") && c.getValue().equals("y")){
					
					result = true;
				}
			}
		}
		
		if(result == false){
			response.sendRedirect(loginPath);
		}
		
		return result;
	}
	
	

}
