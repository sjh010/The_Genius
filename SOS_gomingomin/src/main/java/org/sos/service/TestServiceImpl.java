package org.sos.service;

import java.util.List;

import javax.inject.Inject;

import org.sos.mapper.TestMapper;
import org.sos.vo.ProductVO;
import org.sos.vo.TestVO;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {

	@Inject
	TestMapper testMapper;
	
	@Override
	public List<ProductVO> getAllTestData() throws Exception {
		return testMapper.readAllTestData();
	}

	@Override
	public List<ProductVO> getTestData(TestVO test) throws Exception {
		return testMapper.readTestData(test);
	}

	@Override
	public List<ProductVO> getCategoryData(int category_id) throws Exception {
		return testMapper.readTestCategoryData(category_id);
	}

}
