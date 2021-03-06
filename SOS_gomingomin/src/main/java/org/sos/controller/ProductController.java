package org.sos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.sos.service.CategoryService;
import org.sos.service.ProductService;
import org.sos.vo.CategoryVO;
import org.sos.vo.PagingVO;
import org.sos.vo.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = {"/admin/product"})
public class ProductController {

	@Inject
	ProductService productService;
	
	@Inject
	CategoryService categoryService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getProductManagementPage(String page){
		int pageNo = (page == null) ? 1 : Integer.parseInt(page);
		
		
		ModelAndView mv = new ModelAndView();
		CategoryVO categoryVO = null;
		List<CategoryVO> categoryList = null;
		Map<Integer, String> parentCategoryNameMap = new HashMap<Integer, String>();
		Map<Integer, String> childCategoryNameMap = new HashMap<Integer, String>();
		
		try {
			PagingVO pagingVo = productService.calcPaging(pageNo);
			mv.addObject("paging", pagingVo);
			mv.addObject("productList", productService.readProductList(pagingVo));
			
			
			categoryList = categoryService.readAllCategory();
	
			for(int i=0; i<categoryList.size(); i++){
				categoryVO = categoryList.get(i);
				if(categoryVO.getCategory_depth().equals("2")){
					childCategoryNameMap.put(categoryVO.getCategory_id(), categoryVO.getCategory_name());
					parentCategoryNameMap.put(categoryVO.getCategory_id(), categoryService.getParentCategoryName(categoryVO.getCategory_parent_id()));
				}
			}
			
			mv.addObject("parentCategoryNameMap", parentCategoryNameMap);
			mv.addObject("childCategoryNameMap", childCategoryNameMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("admin/product/product");
		
		return mv;
	}
	
	////////////////////////////////////////////////////////////////////////
	// 상품 등록 페이지 요청
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String getProductRegistPage(HttpServletRequest request){
		List<CategoryVO> parentCategoryList = null;
		
		try {
			parentCategoryList = categoryService.readOneDepthCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("parentCategoryList", parentCategoryList);
		
		return "admin/product/regist";
	}
	
	@RequestMapping(value = "/getCategoryAction", method = RequestMethod.GET)
	public String getCategory(HttpServletRequest request, int category_id){
		
		List<CategoryVO> childCategoryList = null;
		
		try {
			childCategoryList = categoryService.readPartCategory(category_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", childCategoryList);
		
		return "ajax/returnResult";
	}
	//////////////////////////////////////////////////////////////////////////
	
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
			mv.addObject("parentCategoryList", categoryService.readOneDepthCategory());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		mv.setViewName("admin/product/update");
		
		return mv;
	}
	
	// 상품 수정 요청
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public String productUpdateAction(HttpServletRequest request, ProductVO product){
		System.out.println(product.toString());
		try {
			productService.updateProduct(product);
		} catch (Exception e) {
			request.setAttribute("result", "n");
			e.printStackTrace();
			return "ajax/returnResult";
		}
		
		request.setAttribute("result", "y");
		
		return "ajax/returnResult";
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
