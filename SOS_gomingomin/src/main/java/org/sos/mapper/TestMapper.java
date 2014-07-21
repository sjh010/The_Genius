package org.sos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.sos.vo.ProductVO;
import org.sos.vo.TestVO;

public interface TestMapper {
	@Select("SELECT "
			+ "product_id, product_name,"
			+ "type_adventure, type_practice, type_rule, type_tradition, "
			+ "type_enjoyment, type_pleasure, type_harmony "
	  + "FROM "
			+ "tbl_test")
	public List<ProductVO> readAllTestData();

	@Select("SELECT "
			+ "product_id, product_name "
	  + "FROM "
			+ "tbl_test "
	  + "WHERE "
			+ "product_id=#{test1} OR product_id =#{test2} OR product_id =#{test3}")
	public List<ProductVO> readTestData(TestVO test);
	
	@Select("SELECT "
			+ "product_id, product_name,"
			+ "type_adventure, type_practice, type_rule, type_tradition, "
			+ "type_enjoyment, type_pleasure, type_harmony "
		+ "FROM "
			+ "tbl_test "
		+ "WHERE "
			+ "category_id=#{category_id}")
	public List<ProductVO> readTestCategoryData(int category_id);
}
