package org.sos.service;

import java.util.List;

import javax.inject.Inject;

import org.sos.mapper.CategoryMapper;
import org.sos.vo.CategoryVO;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Inject
	CategoryMapper categoryMapper;

	@Override
	public void registCategory(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		categoryMapper.registCategory(vo);
		
	}	

	@Override
	public int getCategoryId() throws Exception {
		// TODO Auto-generated method stub
		return categoryMapper.getCategoryId();
	}	
	
	@Override
	public void updateCategory(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		categoryMapper.updateCategory(vo);
		
	}

	@Override
	public CategoryVO readCategory(int category_id) throws Exception {
		// TODO Auto-generated method stub
		CategoryVO vo;
		vo = categoryMapper.readCategory(category_id);
		
		return vo;
	}

	@Override
	public void deleteCategory(int category_id) throws Exception {
		// TODO Auto-generated method stub
		categoryMapper.deleteCategory(category_id);
		
	}
	
	@Override
	public void deleteParentCategory(int category_parent_id) throws Exception {
		// TODO Auto-generated method stub
		categoryMapper.deleteParentCategory(category_parent_id);
		
	}

	@Override
	public List<CategoryVO> readAllCategory() throws Exception {
		// TODO Auto-generated method stub
		return categoryMapper.readAllCategory();
		
	}

	@Override
	public List<CategoryVO> readPartCategory(int category_id) {
		// TODO Auto-generated method stub
		return categoryMapper.readPartCategory(category_id);
	}

}
