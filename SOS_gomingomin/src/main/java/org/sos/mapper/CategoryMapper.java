package org.sos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sos.vo.CategoryVO;

public interface CategoryMapper {

	@Insert("INSERT INTO "
		    	+ "tbl_category(category_id, category_parent_id, category_name, category_depth, "
		                  + "type_adventure, type_practice, type_rule, type_tradition, "
		                  + "type_enjoyment, type_pleasure, type_harmony) "
		  + "VALUES( "
	        	+ "category_sequence.nextval, "
	        	+ "#{category_parent_id}, "
	        	+ "#{category_name}, "
	        	+ "#{category_depth}, "
	        	+ "#{type_adventure}, "
	        	+ "#{type_practice}, "
	        	+ "#{type_rule}, "
	        	+ "#{type_tradition}, "
	        	+ "#{type_enjoyment}, "
	        	+ "#{type_pleasure}, "
	        	+ "#{type_harmony})")	
	public void registCategory(CategoryVO vo);
	
	@Select("SELECT "
		    	+ "category_id, category_parent_id, category_name, category_depth, "
		    	+ "type_adventure, type_practice, type_rule, type_tradition, "
		    	+ "type_enjoyment, type_pleasure, type_harmony "
		  + "FROM "
  		    	+ "tbl_category "
  		  + "WHERE "
  		    	+ "category_id = #{category_id}")	
	public CategoryVO readCategory(int category_id);
	
	@Select("SELECT "
	    	+ "category_sequence.currval "
	    	+ "FROM "
		    + "dual ")	
	public int getCategoryId();
	
	@Select("SELECT "
	    		+ "category_id, category_parent_id, category_name, category_depth, "
	    		+ "type_adventure, type_practice, type_rule, type_tradition, "
	    		+ "type_enjoyment, type_pleasure, type_harmony "
	      + "FROM "
		    	+ "tbl_category")
	public List<CategoryVO> readAllCategory();
	
	@Select("SELECT "
    			+ "category_id, category_parent_id, category_name, category_depth, "
    			+ "type_adventure, type_practice, type_rule, type_tradition, "
    			+ "type_enjoyment, type_pleasure, type_harmony "
    	  + "FROM "
	    		+ "tbl_category "
	      + "WHERE "
	    		+ "category_parent_id = #{category_id}")
	public List<CategoryVO> readPartCategory(int category_id);
	
	@Update("UPDATE "
		    	+ "tbl_category "
		  + "SET "
		    	+ "category_name = #{category_name}, "
		    	+ "category_depth = #{category_depth}, "
		    	+ "type_adventure = #{type_adventure}, "
		    	+ "type_practice = #{type_practice}, "
		    	+ "type_rule = #{type_rule}, "
		    	+ "type_tradition = #{type_tradition}, "
		    	+ "type_enjoyment = #{type_enjoyment}, "
		    	+ "type_pleasure = #{type_pleasure}, "
		    	+ "type_harmony = #{type_harmony} "
		  + "WHERE "
				+ "category_id = #{category_id}")
	public void updateCategory(CategoryVO vo);
	
	@Delete("DELETE FROM "
	    		+ "tbl_category "
	      + "WHERE "
      			+ "category_id = #{category_id}")
	public void deleteCategory(int category_id);
	
	@Delete("DELETE FROM "
    		+ "tbl_category "
      + "WHERE "
  			+ "category_parent_id = #{category_parent_id}")
	public void deleteParentCategory(int category_parent_id);
	
	@Select("SELECT "
				+ "category_name "
		  + "FROM "
				+ "tbl_category "
		  + "WHERE "
				+ "category_id = #{category_parent_id}")
	public String getParentCategoryName(int category_parent_id);
	
}
