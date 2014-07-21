package org.sos.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CharacterService;
import org.sos.service.TestService;
import org.sos.service.UserCharacterService;
import org.sos.util.Magi;
import org.sos.util.ResultVOConverter;
import org.sos.vo.CharacterVO;
import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;
import org.sos.vo.TestVO;
import org.sos.vo.UserCharacterVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/test")
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Inject
	TestService testService;
	@Inject
	UserCharacterService userCharacterService;
	@Inject
	CharacterService characterService;
	
	@RequestMapping(method = RequestMethod.GET)
	   public ModelAndView startTest(@CookieValue(value="user_id") String user_id){
		
		logger.info("Test Start..................................");
		
	    ModelAndView mv = new ModelAndView();
		List<ProductVO> testList = null; 
		
		try {
			testList = testService.getAllTestData();
			logger.info(testList.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mv.addObject("testList", testList);
		mv.setViewName("/test/test");
	      
	      return mv;
	   }

	@RequestMapping(value = "/result",method = RequestMethod.POST)
	   public ModelAndView resultTest(@CookieValue(value="user_id") String user_id, TestVO test){
		
		logger.info("Test Result..................................");
		
	    ModelAndView mv = new ModelAndView();
	    UserCharacterVO userCharacterVO = null;
        CharacterVO characterVO = null;
        ResultVOConverter resultVOConverter = new ResultVOConverter();
        List<CharacterVO> cvoList = new ArrayList<CharacterVO>();
        List<ResultVO> rvoList;

        List<ProductVO> selectList;
		
		try {
			 userCharacterVO = userCharacterService.readUserCharacter(user_id);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character1());
	         cvoList.add(characterVO);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character2());
	         cvoList.add(characterVO);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character3());
	         cvoList.add(characterVO);
	         rvoList = resultVOConverter.convert(cvoList);
	         
			 
			 
			 mv.addObject("category1", calcMagi(rvoList, 1));
			 mv.addObject("category2", calcMagi(rvoList, 2));
			 mv.addObject("category3", calcMagi(rvoList, 3));
			 mv.addObject("selectProduct", testService.getTestData(test));
	         
			 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		mv.setViewName("/test/result");
	      
	      return mv;
	   }
	
	private Map<String, List<OrderVO>> calcMagi(List<ResultVO> rvoList, int category_id){
		Magi magi = new Magi();
		Map<String, List<OrderVO>> magiResultMap = null;
		try {
			magiResultMap = magi.getCompetitionResult(rvoList, testService.getCategoryData(category_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return magiResultMap;
	}
}
