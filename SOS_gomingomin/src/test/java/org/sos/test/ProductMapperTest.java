package org.sos.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sos.mapper.ProductMapper;
import org.sos.service.ProductService;
import org.sos.vo.ProductVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/**/*-context.xml"})
public class ProductMapperTest {
	
	@Inject
	ProductMapper productMapper;
	
	@Inject
	ProductService productService;
	
	@Test
	public void testSearch() throws Exception{
		
		List<ProductVO> productList = productService.searchProduct("맥북");
		
		System.out.println(productList.toString());
	}
	
	@Test
	public void testRegist() throws Exception{
		ProductVO vo = new ProductVO();
		vo.setType_adventure(4);
		vo.setType_practice(3);
		vo.setType_rule(2);
		vo.setType_tradition(1);
		vo.setType_enjoyment(2);
		vo.setType_pleasure(3);
		vo.setType_harmony(4);
		productService.registProduct(vo);
	}
	
	@Test
	public void testRead() throws Exception{
		ProductVO vo;
		vo = productService.readProduct(2);
		System.out.println(vo.getProduct_id());

		System.out.println(vo.getType_adventure());
		System.out.println(vo.getType_practice());
		System.out.println(vo.getType_rule());
		System.out.println(vo.getType_tradition());
		System.out.println(vo.getType_enjoyment());
		System.out.println(vo.getType_pleasure());
		System.out.println(vo.getType_harmony());
	}
	
	@Test
	public void testUpdate() throws Exception{
		ProductVO vo = new ProductVO();
		vo.setProduct_id(2);;

		vo.setType_adventure(4);
		vo.setType_practice(3);
		vo.setType_rule(2);
		vo.setType_tradition(1);
		vo.setType_enjoyment(2);
		vo.setType_pleasure(3);
		vo.setType_harmony(4);
		
		productService.updateProduct(vo);
	}
	
	@Test
	public void testDelete() throws Exception{
		productService.deleteProduct(2);
	}

}
