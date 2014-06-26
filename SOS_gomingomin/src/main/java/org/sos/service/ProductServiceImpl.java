package org.sos.service;

import java.util.List;

import javax.inject.Inject;

import org.sos.mapper.ProductMapper;
import org.sos.vo.PagingVO;
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
	public List<ProductVO> readProductList(PagingVO pagingVo) throws Exception {
		// TODO Auto-generated method stub
		
		return productMapper.readProductList(pagingVo.getPageNo());
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

	@Override
	public PagingVO calcPaging(int pageNo) {
		// TODO Auto-generated method stub
		PagingVO pagingVo = new PagingVO();
		pagingVo.setTotalPage(productMapper.getTotalCnt());
		pagingVo.setPageNo(pageNo);
		return pagingVo;
	}


}
