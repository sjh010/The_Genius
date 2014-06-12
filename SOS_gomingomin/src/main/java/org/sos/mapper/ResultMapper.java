package org.sos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.sos.vo.ResultVO;

public interface ResultMapper {

	@Select("SELECT "
				+ "type_adventure, type_practice, type_rule, type_tradition, "
				+ "type_enjoyment, type_pleasure, type_harmony "
		  + "FROM "
				+ "tbl_user_character, tbl_character "
		  + "WHERE "
				+ "user_character1 = character_id or user_character2 = character_id or user_character3 = character_id")
	public List<ResultVO> readUserScore(String user_id);
	
}
