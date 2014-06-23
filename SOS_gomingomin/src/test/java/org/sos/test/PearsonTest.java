package org.sos.test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.junit.Test;
import org.sos.util.CosineSimilarity;
import org.sos.util.MultiScoreSmilarity;
import org.sos.util.PearsonCorrelationCoefficient;
import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;


public class PearsonTest {

	@Test
	public void orderTest1(){
		
		PearsonCorrelationCoefficient pearson = new PearsonCorrelationCoefficient();
		CosineSimilarity cosine = new CosineSimilarity();
		MultiScoreSmilarity multi = new MultiScoreSmilarity();
		
		List<ResultVO> characterList = new ArrayList<ResultVO>();
		List<ProductVO> productList = new ArrayList<ProductVO>();
		
		List<OrderVO> pearsonList;
		List<OrderVO> cosineList;
		List<OrderVO> multiList;
		
		ResultVO result1 = new ResultVO();
		ResultVO result2 = new ResultVO();
		ResultVO result3 = new ResultVO();
		ProductVO product1 = new ProductVO();
		ProductVO product2 = new ProductVO();
		ProductVO product3 = new ProductVO();
		
		result1.setType_adventure(4);
		result1.setType_practice(5);
		result1.setType_rule(2);
		result1.setType_tradition(1);
		result1.setType_enjoyment(3);
		result1.setType_pleasure(3);
		result1.setType_harmony(2);
		
		characterList.add(result1);
		
		result2.setType_adventure(4);
		result2.setType_practice(2);
		result2.setType_rule(2);
		result2.setType_tradition(2);
		result2.setType_enjoyment(4);
		result2.setType_pleasure(4);
		result2.setType_harmony(2);
		
		characterList.add(result2);
		
		result3.setType_adventure(2);
		result3.setType_practice(1);
		result3.setType_rule(3);
		result3.setType_tradition(3);
		result3.setType_enjoyment(3);
		result3.setType_pleasure(1);
		result3.setType_harmony(5);
		
		characterList.add(result3);
		
		//////////////////////////////
		product1.setProduct_id(1);
		product1.setType_adventure(5);
		product1.setType_practice(3);
		product1.setType_rule(3);
		product1.setType_tradition(5);
		product1.setType_enjoyment(2);
		product1.setType_pleasure(1);
		product1.setType_harmony(3);
		
		productList.add(product1);
		
		product2.setProduct_id(2);
		product2.setType_adventure(4);
		product2.setType_practice(4);
		product2.setType_rule(2);
		product2.setType_tradition(2);
		product2.setType_enjoyment(3);
		product2.setType_pleasure(4);
		product2.setType_harmony(5);
		
		productList.add(product2);
		
		product3.setProduct_id(3);
		product3.setType_adventure(3);
		product3.setType_practice(1);
		product3.setType_rule(5);
		product3.setType_tradition(3);
		product3.setType_enjoyment(4);
		product3.setType_pleasure(2);
		product3.setType_harmony(4);
		
		productList.add(product3);
		
		cosineList = cosine.calculateOrder(characterList, productList);
		
		pearsonList = pearson.calculateOrder(characterList, productList);
		
		multiList = multi.calculateOrder(characterList, productList);
		
		System.out.println("pearsonList : " + pearsonList.toString());
		System.out.println("cosineList : " + cosineList.toString());
		System.out.println("multiList : " + multiList.toString());
		
//		Collections.sort(cosineList, new Comparator<OrderVO>(){
//
//			@Override
//			public int compare(OrderVO o1, OrderVO o2) {
//				
//				if(o1.getValue() > o2.getValue()) return -1;
//				else if(o1.getValue() < o2.getValue()) return 1;
//				else return 0;
//			}
//			
//		});
//		
//		System.out.println("좀 바껴라!!! : " + cosineList);
		
		
		
	}
	
	
	
	
}
