package org.sos.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sos.vo.ProductVO;

public interface ProductMapper {
	
	//TBL_CHARACTER TABLE의 시퀀스 이름 = PRODUCT_SEQUENCE
	
	@Insert("INSERT INTO "
				+ "tbl_product(product_id, product_name, product_img, product_price, "
							+ "type_adventure, type_practice, type_rule, type_tradition, "
							+ "type_enjoyment, type_pleasure, type_harmony) "
		  + "VALUES( "
		    	+ "product_sequence.nextval, "
		    	+ "#{product_name}, "
		    	+ "#{product_img}, "
		    	+ "#{product_price}, "
		    	+ "#{type_adventure}, "
		    	+ "#{type_practice}, "
		    	+ "#{type_rule}, "
		    	+ "#{type_tradition}, "
		    	+ "#{type_enjoyment}, "
		    	+ "#{type_pleasure}, "
		    	+ "#{type_harmony})")
	public void registProduct(ProductVO vo);
	
	@Select("SELECT "
				+ "product_id, product_name, product_img, product_price, "
				+ "type_adventure, type_practice, type_rule, type_tradition, "
				+ "type_enjoyment, type_pleasure, type_harmony "
	      + "FROM "
				+ "tbl_product "
	      + "WHERE "
				+ "product_id = #{product_id}")
	public ProductVO readProduct(int product_id);

	@Update("UPDATE "
				+ "tbl_product "
		  + "SET "
				+ "product_name = #{product_name}, "
				+ "product_img = #{product_img}, "
				+ "product_price = #{product_price}, "
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

	@Delete("DELETE FROM "
				+ "tbl_product "
		  + "WHERE "
				+ "product_id = #{product_id}")
	public void deleteProduct(int product_id);

}