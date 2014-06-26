package org.sos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sos.vo.ProductVO;

public interface ProductMapper {
	
	//TBL_CHARACTER TABLE의 시퀀스 이름 = PRODUCT_SEQUENCE
	
	@Insert("INSERT INTO "
				+ "tbl_product(product_id, product_name, category_id, "
							+ "type_adventure, type_practice, type_rule, type_tradition, "
							+ "type_enjoyment, type_pleasure, type_harmony) "
		  + "VALUES( "
		    	+ "#{product_id}, "
		    	+ "#{product_name}, "
		    	+ "#{category_id}, "
		    	+ "#{type_adventure}, "
		    	+ "#{type_practice}, "
		    	+ "#{type_rule}, "
		    	+ "#{type_tradition}, "
		    	+ "#{type_enjoyment}, "
		    	+ "#{type_pleasure}, "
		    	+ "#{type_harmony})")
	public void registProduct(ProductVO vo);
	
	@Select("SELECT "
				+ "product_id, product_name, category_id, "
				+ "type_adventure, type_practice, type_rule, type_tradition, "
				+ "type_enjoyment, type_pleasure, type_harmony "
	      + "FROM "
				+ "tbl_product "
	      + "WHERE "
				+ "product_id = #{product_id}")
	public ProductVO readProduct(int product_id);
	
	@Select("SELECT "
				+ "product_id, product_name, category_id, "
				+ "type_adventure, type_practice, type_rule, type_tradition, "
				+ "type_enjoyment, type_pleasure, type_harmony "
		  + "FROM "
		  		+ "(SELECT "
		  				+ "A.*, ROWNUM AS RNUM, FLOOR((ROWNUM-1)/5+1) AS PAGE, COUNT(*) OVER() AS TOTCNT "
		  		 + "FROM "
		  		 		+ "("
		  		 			+ "SELECT "
		  		 				+ "product_id, product_name, category_id, "
		  		 				+ "type_adventure, type_practice, type_rule, type_tradition, "
		  		 				+ "type_enjoyment, type_pleasure, type_harmony "
		  		 			+ "FROM "
		  		 				+ "tbl_product"
		  		 		+ ") A) "
		  + "WHERE PAGE = #{pageNum}")
	public List<ProductVO> readProductList(int pageNum);
	
	@Select("SELECT "
			+ "product_id, product_name, category_id, "
			+ "type_adventure, type_practice, type_rule, type_tradition, "
			+ "type_enjoyment, type_pleasure, type_harmony "
	  + "FROM "
			+ "tbl_product")
	public List<ProductVO> readProductAllList();

	@Update("UPDATE "
				+ "tbl_product "
		  + "SET "
				+ "product_name = #{product_name}, "
				+ "category_id = #{category_id}, "
				+ "type_adventure = #{type_adventure}, "
				+ "type_practice = #{type_practice}, "
				+ "type_rule = #{type_rule}, "
				+ "type_tradition = #{type_tradition}, "
				+ "type_enjoyment = #{type_enjoyment}, "
				+ "type_pleasure = #{type_pleasure}, "
				+ "type_harmony = #{type_harmony} "
		  + "WHERE "
				+ "product_id = #{product_id}")
	public void updateProduct(ProductVO vo);
	
	@Select("SELECT "
			+ "product_id, product_name, category_id, "
			+ "type_adventure, type_practice, type_rule, type_tradition, "
			+ "type_enjoyment, type_pleasure, type_harmony "
		+ "FROM "
			+ "tbl_product "
		+ "WHERE "
			+ "product_name like '%' || #{keyword} || '%'")
	public List<ProductVO> searchProduct(String keyword);
	
	@Delete("DELETE FROM "
				+ "tbl_product "
		  + "WHERE "
				+ "product_id = #{product_id}")
	public void deleteProduct(int product_id);

	@Select("select count(product_id) from tbl_product")
	public int getTotalCnt();

}