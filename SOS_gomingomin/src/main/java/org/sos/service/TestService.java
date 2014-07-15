package org.sos.service;

import java.util.List;

import org.sos.vo.ProductVO;
import org.sos.vo.TestVO;

public interface TestService {
	List<ProductVO> getAllTestData() throws Exception;
	List<ProductVO> getTestData(TestVO test) throws Exception;
	List<ProductVO> getCategoryData(int category_id) throws Exception;
}
