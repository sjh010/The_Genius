package org.sos.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.sos.service.ProductService;
import org.sos.vo.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = {"/admin/product", "/search"})
public class ProductController {

	@Inject
	ProductService productService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getProductManagementPage(String pageNo){
		
		if(pageNo == null){
			pageNo = "1";
		}
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("productList", productService.readProductList(Integer.parseInt(pageNo)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/product");
		
		return mv;
	}
	
	// 상품 등록 페이지 요청
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String getProductRegistPage(){
	
		return "admin/product/regist";
	}
	
	// 상품 등록 요청
	@RequestMapping(value = "/registAction", method = RequestMethod.POST)
	public String productRegistAction(HttpServletRequest request, ProductVO product){
		
		try {
			productService.registProduct(product);
			
		} catch (Exception e) {
			
			request.setAttribute("result", "n");
			e.printStackTrace();
			return "ajax/returnResult";
		}
		
		request.setAttribute("result", "y");
		
		return "ajax/returnResult";
	}
	
	// 상품 수정 페이지 요청
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView getProductUpdatePage(int product_id){
		
		ModelAndView mv = new ModelAndView();
		
		try {
			mv.addObject("product", productService.readProduct(product_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/product/update");
		
		return mv;
	}
	
	// 상품 수정 요청
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public String productUpdateAction(ProductVO product){
		
		try {
			productService.updateProduct(product);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:product";
	}
	
	// 상품 삭제 요청
	@RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
	public String productDeleteAction(HttpServletRequest request, int product_id){
		
		try {
			productService.deleteProduct(product_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("result", "y");
		
		return "ajax/returnResult";
	}
}
