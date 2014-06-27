package org.sos.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.sos.vo.OrderVO;

public class MainPageOrderCalc {
	
	public List<OrderVO> getMainPageOrder(Map<String, List<OrderVO>> magiResultMap){
		
		//List 3개를 준비
		List<OrderVO> pearsonOrderList = magiResultMap.get("pearson");
		List<OrderVO> cosineOrderList = magiResultMap.get("cosine");
		List<OrderVO> multiOrderList = magiResultMap.get("multi");
		
		//중간 결과를 저장할 맵을 선언
		Map<Integer, Double> intermediateResult = new HashMap<Integer, Double>();
		
		//최종 결과를 저장할 리스트 선언
		List<OrderVO> resultList = new ArrayList<OrderVO>();
		
		//임시로 사용할 변수들
		int product_id = 0;
		double value = 0.0;
		int size = pearsonOrderList.size();	
		//어차피 세개의 사이즈는 같으므로 personOrderList의 size를 씀
	
		//순서에 따라서 그 product_id에 값을 준다.
		for(int i=0; i<size; i++){
			
			product_id = pearsonOrderList.get(i).getProduct_id();
			if(intermediateResult.containsKey(product_id)){
				value = intermediateResult.get(product_id) + (size - i);
				intermediateResult.remove(product_id);
				intermediateResult.put(product_id, value);
			}else{
				intermediateResult.put(product_id, (double)(size - i) );
			}
			
			product_id = cosineOrderList.get(i).getProduct_id();
			if(intermediateResult.containsKey(product_id)){
				value = intermediateResult.get(product_id) + ( size - i );
				intermediateResult.remove(product_id);
				intermediateResult.put(product_id, value);
			}else{
				intermediateResult.put(product_id, (double)(size - i) );
			}
			
			product_id = multiOrderList.get(i).getProduct_id();
			if(intermediateResult.containsKey(product_id)){
				value = intermediateResult.get(product_id) + ( size - i);
				intermediateResult.remove(product_id);
				intermediateResult.put(product_id, value);
			}else{
				intermediateResult.put(product_id, (double)(size - i) );
			}
 		}
		
		//intermediateResult에 값들이 들어가 있는 것을
		//정렬해서 List로 가지고 있게 해줌
		Set<Integer> keySet = intermediateResult.keySet();
		Iterator<Integer> it = keySet.iterator();
		OrderVO temp = null;
		while(it.hasNext()){
			temp = new OrderVO();
			Integer key = it.next();
			temp.setProduct_id(key);
			temp.setValue(intermediateResult.get(key));
			resultList.add(temp);
		}
		
		Collections.sort(resultList, new SosComparator());
		
		return resultList;
	}
	
}
