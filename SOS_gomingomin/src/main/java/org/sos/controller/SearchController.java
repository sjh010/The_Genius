package org.sos.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sos.service.CategoryService;
import org.sos.service.CharacterService;
import org.sos.service.ProductService;
import org.sos.service.UserCharacterService;
import org.sos.util.Magi;
import org.sos.util.ResultVOConverter;
import org.sos.vo.CharacterVO;
import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;
import org.sos.vo.UserCharacterVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/search")
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	ProductService productService;
	
	@Inject
	CategoryService categoryService;

	   ////////////////////////
	   @Inject
	   UserCharacterService userCharacterService;
	   
	   @Inject
	   CharacterService characterService;
	   
	   ResultVOConverter resultVOConverter;
	   
	   Magi magi = new Magi();
	   ////////////////////////

	   @RequestMapping(value="/pearson", method = RequestMethod.GET)
	   public String getPearsonOrder(@CookieValue(value="user_id") String user_id, HttpServletRequest request, String keyword){
	      
	      logger.info("keyword : " + keyword);
	      UserCharacterVO userCharacterVO = null;
	      CharacterVO characterVO = null;
	      List<CharacterVO> cvoList = new ArrayList<CharacterVO>();
	      resultVOConverter = new ResultVOConverter();
	      List<ResultVO> rvoList;
	      List<ProductVO> pvoList;
	      
	      try {
	         userCharacterVO = userCharacterService.readUserCharacter(user_id);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character1());
	         cvoList.add(characterVO);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character2());
	         cvoList.add(characterVO);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character3());
	         cvoList.add(characterVO);
	         rvoList = resultVOConverter.convert(cvoList);
	         
	         pvoList = productService.searchProduct(keyword);
	         
	         Map<String, List<OrderVO>> magiResultMap = magi.getCompetitionResult(rvoList, pvoList);
	         
	         request.setAttribute("productCodeList", magiResultMap.get("pearson"));
	         magiResultMap.get("pearson");
	         
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return "search";
	   }
	   
	   @RequestMapping(value="/cosine", method = RequestMethod.GET)
	   public String getCosineOrder(@CookieValue(value="user_id") String user_id, HttpServletRequest request, String keyword){
	      
	      logger.info("keyword : " + keyword);
	      UserCharacterVO userCharacterVO = null;
	      CharacterVO characterVO = null;
	      List<CharacterVO> cvoList = new ArrayList<CharacterVO>();
	      resultVOConverter = new ResultVOConverter();
	      List<ResultVO> rvoList;
	      List<ProductVO> pvoList;
	      
	      try {
	         userCharacterVO = userCharacterService.readUserCharacter(user_id);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character1());
	         cvoList.add(characterVO);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character2());
	         cvoList.add(characterVO);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character3());
	         cvoList.add(characterVO);
	         rvoList = resultVOConverter.convert(cvoList);
	         
	         pvoList = productService.searchProduct(keyword);
	         
	         Map<String, List<OrderVO>> magiResultMap = magi.getCompetitionResult(rvoList, pvoList);
	         
	         request.setAttribute("productCodeList", magiResultMap.get("cosine"));
	         
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return "search";
	   }
	   
	   @RequestMapping(value="/multi", method = RequestMethod.GET)
	   public String getMultiOrder(@CookieValue(value="user_id") String user_id, HttpServletRequest request, String keyword){
	      
	      logger.info("keyword : " + keyword);
	      UserCharacterVO userCharacterVO = null;
	      CharacterVO characterVO = null;
	      List<CharacterVO> cvoList = new ArrayList<CharacterVO>();
	      resultVOConverter = new ResultVOConverter();
	      List<ResultVO> rvoList;
	      List<ProductVO> pvoList;
	      
	      try {
	         userCharacterVO = userCharacterService.readUserCharacter(user_id);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character1());
	         cvoList.add(characterVO);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character2());
	         cvoList.add(characterVO);
	         characterVO = characterService.readCharacter(userCharacterVO.getUser_character3());
	         cvoList.add(characterVO);
	         rvoList = resultVOConverter.convert(cvoList);
	         
	         pvoList = productService.searchProduct(keyword);
	         
	         Map<String, List<OrderVO>> magiResultMap = magi.getCompetitionResult(rvoList, pvoList);
	         
	         request.setAttribute("productCodeList", magiResultMap.get("multi"));
	         
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return "search";
	   }
	
	@RequestMapping(method = RequestMethod.GET)
	public String getProductCode(@CookieValue(value="loginInfo" , defaultValue="n") String loginInfo,
								 	@CookieValue(value="user_id", defaultValue="") String user_id,
								 		HttpServletRequest request, String keyword){
		
		logger.info("keyword : " + keyword);
		
		UserCharacterVO userCharacterVO = null;
	      CharacterVO characterVO = null;
	      List<CharacterVO> cvoList = new ArrayList<CharacterVO>();
	      resultVOConverter = new ResultVOConverter();
	      List<ResultVO> rvoList;
	      List<ProductVO> pvoList;
		
		if(loginInfo.equals("y")){
			try {
		         //resultVO 리스트를 만들어주고
		         userCharacterVO = userCharacterService.readUserCharacter(user_id);
		         characterVO = characterService.readCharacter(userCharacterVO.getUser_character1());
		         cvoList.add(characterVO);
		         characterVO = characterService.readCharacter(userCharacterVO.getUser_character2());
		         cvoList.add(characterVO);
		         characterVO = characterService.readCharacter(userCharacterVO.getUser_character3());
		         cvoList.add(characterVO);
		         rvoList = resultVOConverter.convert(cvoList);
		         
		         //productVO 리스트를 만들어주고
		         pvoList = productService.searchProduct(keyword);
		         
		         //마기 사용해서 map을 얻어온다.
		         request.setAttribute("productCodeList", magi.getCompetitionResult(rvoList, pvoList));
		         
		      } catch (Exception e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
			return "/search/loginSearch";
		      
		} else {
			try {
				request.setAttribute("productCodeList", productService.searchProduct(keyword));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/search/noLoginSearch";
		}
	}
	
	@RequestMapping(value = "/searchCategory", method = RequestMethod.GET)
	public ModelAndView categorySearch(int category_id){
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("productList", productService.readCategoryProductList(category_id));
			mv.addObject("categoryInfo", categoryService.readCategory(category_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("/search/category");
		
		return mv;
		
	}
	
}
