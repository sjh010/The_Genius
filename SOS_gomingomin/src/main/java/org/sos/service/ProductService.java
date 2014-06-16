package org.sos.service;

import org.sos.vo.ProductVO;

public interface ProductService {

	public void registProduct(ProductVO vo) throws Exception;
	
	public ProductVO readProduct(int product_id) throws Exception;
	
	public void updateProduct(ProductVO vo) throws Exception;
	
	public void deleteProduct(int product_id) throws Exception;
	
}
