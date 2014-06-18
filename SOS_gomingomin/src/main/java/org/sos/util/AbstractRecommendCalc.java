package org.sos.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.sos.vo.OrderVO;
import org.sos.vo.ResultVO;

public abstract class AbstractRecommendCalc implements RecommendCalc {
	
	protected List<OrderVO> orderedProductList = new ArrayList<OrderVO>();
	
	protected ResultVO getResultAvg(List<ResultVO> characterList){
		
		ResultVO result = new ResultVO();
		double count = (double) characterList.size();
		
		double adventure = 0;
		double practice = 0;
		double rule = 0;
		double tradition = 0;
		double enjoyment = 0;
		double pleasure = 0;
		double harmony = 0;
		
		for(ResultVO character : characterList){
			
			adventure += character.getType_adventure();
			practice += character.getType_practice();
			rule += character.getType_rule();
			tradition += character.getType_tradition();
			enjoyment += character.getType_enjoyment();
			pleasure += character.getType_pleasure();
			harmony += character.getType_harmony();
		}
		
		result.setType_adventure(adventure/count);
		result.setType_practice(practice/count);
		result.setType_rule(rule/count);
		result.setType_tradition(tradition/count);
		result.setType_enjoyment(enjoyment/count);
		result.setType_pleasure(pleasure/count);
		result.setType_harmony(harmony/count);
		
		System.out.println("result : " + result.toString());
		
		return result;
	}
	
	protected List<OrderVO> orderProducts(List<OrderVO> orderList){
		
		Collections.sort(orderList, new SosComparator());
		
		return orderList;
	}

}
