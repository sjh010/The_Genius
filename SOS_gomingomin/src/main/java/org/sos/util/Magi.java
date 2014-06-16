package org.sos.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;

public class Magi {

	private List<ResultVO> characterList;
	private List<ProductVO> productList;
	
	
	public Magi(List<ResultVO> characterList, List<ProductVO> productList){
		
		this.characterList = characterList;
		this.productList = productList;
	}
	
	public List<Integer> multiScoreAnalyst(){
		
		List<Integer> resultList = new ArrayList<Integer>();
	
		int[] orderedProductList = new int[productList.size()];
		
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		
		double[] sortedScore = new double[productList.size()];
		int recommendedProduct = 0;
		double max = 0.0;
		ResultVO character = getResultAvg(characterList);
			
		for(int i=0; i < productList.size(); i++){
			
			OrderVO vo = new OrderVO();
			double score=0;
			
			score = (character.getType_adventure() * productList.get(i).getType_adventure()) +
					(character.getType_practice() * productList.get(i).getType_practice()) +
					(character.getType_rule() * productList.get(i).getType_rule()) + 
					(character.getType_tradition() * productList.get(i).getType_tradition()) +
					(character.getType_enjoyment() * productList.get(i).getType_enjoyment()) +
					(character.getType_pleasure() * productList.get(i).getType_pleasure()) +
					(character.getType_harmony() * productList.get(i).getType_harmony());	
			
			vo.setProductCode(productList.get(i).getProduct_id());
			vo.setValue(score);
			
			orderList.add(vo);
			
		}
		
		
		Collections.sort(orderList, new Comparator<OrderVO>(){

			@Override
			public int compare(OrderVO o1, OrderVO o2) {
				
				return (int)(o1.getValue() - o1.getValue());
				
			}
			
		});
		
		for(int i=0; i < productList.size(); i++){
			
			orderedProductList[i] = orderList.get(i).getProductCode();
		}
		
		return Arrays.asList(orderedProductList);
		
	}
	
	private ResultVO getResultAvg(List<ResultVO> characterList){
		
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
		result.setType_practice(rule/count);
		result.setType_tradition(tradition/count);
		result.setType_enjoyment(enjoyment/count);
		result.setType_pleasure(pleasure/count);
		result.setType_harmony(harmony/count);
		
		return result;
	}
}
