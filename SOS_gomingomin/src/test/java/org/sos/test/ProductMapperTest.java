package org.sos.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sos.mapper.ProductMapper;
import org.sos.service.ProductService;
import org.sos.util.Magi;
import org.sos.util.MainPageOrderCalc;
import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;
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
	
	@Test
	public void magiTest() throws Exception{
		
		//ResultVO를 가지고 있을 리스트를 만들어 놓고
		List<ResultVO> rList = new ArrayList<ResultVO>();
		
		//ProductVO를 가지고 있을 리스트를 만들어 놓고
		List<ProductVO> pList = new ArrayList<ProductVO>();
		
		ResultVO rvo1 = new ResultVO();
		rvo1.setType_adventure(4);
		rvo1.setType_enjoyment(5);
		rvo1.setType_harmony(2);
		rvo1.setType_pleasure(1);
		rvo1.setType_practice(3);
		rvo1.setType_rule(3);
		rvo1.setType_tradition(2);
		
		ResultVO rvo2 = new ResultVO();
		rvo2.setType_adventure(5);
		rvo2.setType_enjoyment(4);
		rvo2.setType_harmony(3);
		rvo2.setType_pleasure(2);
		rvo2.setType_practice(2);
		rvo2.setType_rule(2);
		rvo2.setType_tradition(2);
		
		ResultVO rvo3 = new ResultVO();
		rvo3.setType_adventure(4);
		rvo3.setType_enjoyment(4);
		rvo3.setType_harmony(1);
		rvo3.setType_pleasure(1);
		rvo3.setType_practice(3);
		rvo3.setType_rule(4);
		rvo3.setType_tradition(2);		
		
		rList.add(rvo1);
		rList.add(rvo2);
		rList.add(rvo3);
		
		ProductVO pvo1 = new ProductVO();
		pvo1.setProduct_id(1077090677);
		pvo1.setProduct_name("맥북 프로 레티나 13인치 고급형");
		pvo1.setType_adventure(4);
		pvo1.setType_enjoyment(5);
		pvo1.setType_harmony(1);
		pvo1.setType_pleasure(2);
		pvo1.setType_practice(3);
		pvo1.setType_rule(5);
		pvo1.setType_tradition(2);
		
		ProductVO pvo2 = new ProductVO();
		pvo2.setProduct_id(1073584127);
		pvo2.setProduct_name("삼성 아티브북 I5");
		pvo2.setType_adventure(2);
		pvo2.setType_enjoyment(4);
		pvo2.setType_harmony(3);
		pvo2.setType_pleasure(4);
		pvo2.setType_practice(4);
		pvo2.setType_rule(1);
		pvo2.setType_tradition(5);
		
		ProductVO pvo3 = new ProductVO();
		pvo3.setProduct_id(950377868);
		pvo3.setProduct_name("한성 인민에어 I5");
		pvo3.setType_adventure(3);
		pvo3.setType_enjoyment(1);
		pvo3.setType_harmony(5);
		pvo3.setType_pleasure(1);
		pvo3.setType_practice(1);
		pvo3.setType_rule(3);
		pvo3.setType_tradition(4);
		
		ProductVO pvo4 = new ProductVO();
		pvo4.setProduct_id(934732788);
		pvo4.setProduct_name("뉴발란스 990");
		pvo4.setType_adventure(4);
		pvo4.setType_enjoyment(4);
		pvo4.setType_harmony(2);
		pvo4.setType_pleasure(2);
		pvo4.setType_practice(3);
		pvo4.setType_rule(4);
		pvo4.setType_tradition(5);
		
		ProductVO pvo5 = new ProductVO();
		pvo5.setProduct_id(90068907);
		pvo5.setProduct_name("나이키 루나 글라이드");
		pvo5.setType_adventure(5);
		pvo5.setType_enjoyment(3);
		pvo5.setType_harmony(3);
		pvo5.setType_pleasure(5);
		pvo5.setType_practice(2);
		pvo5.setType_rule(1);
		pvo5.setType_tradition(3);
		
		ProductVO pvo6 = new ProductVO();
		pvo6.setProduct_id(918257788);
		pvo6.setProduct_name("컨버스 운동화");
		pvo6.setType_adventure(3);
		pvo6.setType_enjoyment(1);
		pvo6.setType_harmony(5);
		pvo6.setType_pleasure(3);
		pvo6.setType_practice(4);
		pvo6.setType_rule(2);
		pvo6.setType_tradition(4);
		
		ProductVO pvo7 = new ProductVO();
		pvo7.setProduct_id(1069192213);
		pvo7.setProduct_name("반스 어센틱");
		pvo7.setType_adventure(2);
		pvo7.setType_enjoyment(2);
		pvo7.setType_harmony(4);
		pvo7.setType_pleasure(1);
		pvo7.setType_practice(5);
		pvo7.setType_rule(3);
		pvo7.setType_tradition(2);
		
		ProductVO pvo8 = new ProductVO();
		pvo8.setProduct_id(703416895);
		pvo8.setProduct_name("금강 헤리티지");
		pvo8.setType_adventure(1);
		pvo8.setType_enjoyment(5);
		pvo8.setType_harmony(1);
		pvo8.setType_pleasure(4);
		pvo8.setType_practice(1);
		pvo8.setType_rule(5);
		pvo8.setType_tradition(1);
	
		ProductVO pvo9 = new ProductVO();
		pvo9.setProduct_id(1018520348);
		pvo9.setProduct_name("LG 그램");
		pvo9.setType_adventure(5);
		pvo9.setType_enjoyment(3);
		pvo9.setType_harmony(2);
		pvo9.setType_pleasure(3);
		pvo9.setType_practice(5);
		pvo9.setType_rule(4);
		pvo9.setType_tradition(1);
		
		ProductVO pvo10 = new ProductVO();
		pvo10.setProduct_id(1031405489);
		pvo10.setProduct_name("레노버 울트라북");
		pvo10.setType_adventure(1);
		pvo10.setType_enjoyment(2);
		pvo10.setType_harmony(4);
		pvo10.setType_pleasure(5);
		pvo10.setType_practice(2);
		pvo10.setType_rule(2);
		pvo10.setType_tradition(3);
		
		pList.add(pvo1);
		pList.add(pvo2);
		pList.add(pvo3);
		pList.add(pvo4);
		pList.add(pvo5);
		pList.add(pvo6);
		pList.add(pvo7);
		pList.add(pvo8);
		pList.add(pvo9);
		pList.add(pvo10);
		
		//마기의 메소드를 쓰기 위해 마기를 선언하고 순서를 확인한다.
		Magi magi = new Magi();
		
		Map<String, List<OrderVO>> map = magi.getCompetitionResult(rList, pList);
		
		List<OrderVO> pearsonOrder = map.get("pearson");
		List<OrderVO> cosineOrder = map.get("cosine");
		List<OrderVO> multiOrder = map.get("multi");
		
		System.out.println(pearsonOrder.toString());
		System.out.println(cosineOrder.toString());
		System.out.println(multiOrder.toString());
		
		//메인페이지 순서를 확인하기 위해서 MainPageOrderCalc를 선언하고 순서를 확인한다.
		MainPageOrderCalc mainPageOrderCalc = new MainPageOrderCalc();
		List<OrderVO> resultOrder = mainPageOrderCalc.getMainPageOrder(map);
		System.out.println(resultOrder.toString());
		
	}
}
