package org.sos.service;

import java.util.List;

import org.sos.vo.CategoryVO;

public interface CategoryService {

	public void registCategory(CategoryVO vo) throws Exception;
	
	public void updateCategory(CategoryVO vo) throws Exception;
	
	public CategoryVO readCategory(int category_id) throws Exception;
	
	public void deleteCategory(int category_id) throws Exception;

	public List<CategoryVO> readAllCategory() throws Exception;
	
	public List<CategoryVO> readPartCategory(int category_id);

	public int getCategoryId() throws Exception;
}
