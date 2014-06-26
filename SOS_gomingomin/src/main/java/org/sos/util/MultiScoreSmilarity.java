package org.sos.util;

import java.util.List;

import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;

public class MultiScoreSmilarity extends AbstractRecommendCalc{

	@Override
	public List<OrderVO> calculateOrder(List<ResultVO> characterList, List<ProductVO> productList) {
		
		ResultVO characterAvg = getResultAvg(characterList);
		double score = 0;

		for(int i=0; i < productList.size(); i++){
			
			OrderVO vo = new OrderVO();
			
			score = (characterAvg.getType_adventure() * productList.get(i).getType_adventure()) +
					(characterAvg.getType_practice() * productList.get(i).getType_practice()) +
					(characterAvg.getType_rule() * productList.get(i).getType_rule()) + 
					(characterAvg.getType_tradition() * productList.get(i).getType_tradition()) +
					(characterAvg.getType_enjoyment() * productList.get(i).getType_enjoyment()) +
					(characterAvg.getType_pleasure() * productList.get(i).getType_pleasure()) +
					(characterAvg.getType_harmony() * productList.get(i).getType_harmony());	
			
			vo.setProduct_id(productList.get(i).getProduct_id());
			vo.setValue(score);
			
			orderedProductList.add(vo);
			
		}
		
		System.out.println("Multi Before : " + orderedProductList.toString());
		
		orderedProductList = orderProducts(orderedProductList);
		
		System.out.println("Multi After : " + orderedProductList.toString());
		
		return orderedProductList;
	}

}
