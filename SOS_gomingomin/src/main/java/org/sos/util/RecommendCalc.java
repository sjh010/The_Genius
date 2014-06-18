package org.sos.util;

import java.util.List;

import org.sos.vo.OrderVO;
import org.sos.vo.ProductVO;
import org.sos.vo.ResultVO;

public interface RecommendCalc {

	public List<OrderVO> calculateOrder(List<ResultVO> characterList, List<ProductVO> productList);
	
}
