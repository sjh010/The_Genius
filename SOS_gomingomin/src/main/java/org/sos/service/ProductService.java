package org.sos.service;

import java.util.List;

import org.sos.vo.PagingVO;
import org.sos.vo.ProductVO;

public interface ProductService {

	public void registProduct(ProductVO vo) throws Exception;
	
	public ProductVO readProduct(int product_id) throws Exception;
	
	public List<ProductVO> readProductList(PagingVO pagingVo) throws Exception;
	
	public void updateProduct(ProductVO vo) throws Exception;
	
	public void deleteProduct(int product_id) throws Exception;

	public PagingVO calcPaging(int pageNo);
	
}
