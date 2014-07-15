package org.sos.util;

import java.util.ArrayList;
import java.util.List;

import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;

public class NoLoginMainCalc {
	//파라미터 받을 필요 없이 디비에서 꺼내와서 OrderVO의 리스트로 가공해서 보내주자.
	
	//컨트롤러에서 서비스를 호출 해서 뷰 카운트로 조회해서 넘겨준것을 여기에 넘겨줘서 컨버팅하는 개념으로 생각
	public List<OrderVO> getMainOrder(List<ProductVO> pList){
		
		List<OrderVO> oList = new ArrayList<OrderVO>();
		OrderVO ovo;
		
		for(int i=0; i<pList.size(); i++){
			ovo = new OrderVO();
			ovo.setProduct_id(pList.get(i).getProduct_id());
			ovo.setProduct_name(pList.get(i).getProduct_name());
			oList.add(ovo);
		}
		
		return oList;
	}
	
}
