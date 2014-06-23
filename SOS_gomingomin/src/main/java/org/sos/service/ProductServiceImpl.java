package org.sos.service;

import java.util.List;

import javax.inject.Inject;

import org.sos.mapper.ProductMapper;
import org.sos.vo.ProductVO;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductMapper productMapper;
	
	@Override
	public void registProduct(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		productMapper.registProduct(vo);
		
	}

	@Override
	public ProductVO readProduct(int product_id) throws Exception {
		// TODO Auto-generated method stub
		ProductVO vo;
		vo = productMapper.readProduct(product_id);
		
		return vo;
	}
	
	@Override
	public List<ProductVO> readProductList(int pageNum) throws Exception {
		// TODO Auto-generated method stub
		
		return productMapper.readProductList(pageNum);
	}

	@Override
	public void updateProduct(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		productMapper.updateProduct(vo);
		
	}

	@Override
	public void deleteProduct(int product_id) throws Exception {
		// TODO Auto-generated method stub
		productMapper.deleteProduct(product_id);
		
	}


}
