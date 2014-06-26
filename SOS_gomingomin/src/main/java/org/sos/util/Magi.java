package org.sos.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;


public class Magi {

	private Map<String, List<OrderVO>> result;
	
	public Magi(){
	
		this.result = new HashMap<String, List<OrderVO>>();
	}
	
	public 
	Map<String, List<OrderVO>> getCompetitionResult(List<ResultVO> characterList, 
													List<ProductVO> productList){
		
		result.put("pearson", new PearsonCorrelationCoefficient().calculateOrder(characterList, productList));
		result.put("cosine", new CosineSimilarity().calculateOrder(characterList, productList));
		result.put("multi", new MultiScoreSmilarity().calculateOrder(characterList, productList));
		
		return result;
	}
	
}
