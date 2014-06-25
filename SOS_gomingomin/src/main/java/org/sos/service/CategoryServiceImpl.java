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
	public List<CategoryVO> readCategoryList() throws Exception {
		// TODO Auto-generated method stub
		return categoryMapper.readCategoryList();
		
	}

}
