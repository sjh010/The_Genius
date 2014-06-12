package org.sos.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sos.vo.CharacterVO;

public interface CharacterMapper {
	
	//TBL_CHARACTER TABLE의 시퀀스 이름 = SOS_SEQUENCE
	
	@Insert("INSERT INTO "
			    + "tbl_character(character_id, character_name, character_img, "
			                  + "type_adventure, type_practice, type_rule, type_tradition, "
			                  + "type_enjoyment, type_pleasure, type_harmony) "
		  + "VALUES( "
		        + "sos_sequence.nextval, "
			    + "#{character_name}, "
			    + "#{character_img}, "
			    + "#{type_adventure}, "
			    + "#{type_practice}, "
			    + "#{type_rule}, "
			    + "#{type_tradition}, "
			    + "#{type_enjoyment}, "
			    + "#{type_pleasure}, "
			    + "#{type_harmony})")
	public void registCharacter(CharacterVO vo);
	
	@Select("SELECT "
			    + "character_id, character_name, character_img, "
			    + "type_adventure, type_practice, type_rule, type_tradition, "
			    + "type_enjoyment, type_pleasure, type_harmony "
	      + "FROM "
	  		    + "tbl_character "
	      + "WHERE "
	  		    + "character_id = #{character_id}")
	public CharacterVO readCharacter(int character_id);

	@Update("UPDATE "
			    + "tbl_character "
		  + "SET "
			    + "character_name = #{character_name}, "
	    		+ "character_img = #{character_img}, "
	    		+ "type_adventure = #{type_adventure}, "
	    		+ "type_practice = #{type_practice}, "
	    		+ "type_rule = #{type_rule}, "
	    		+ "type_tradition = #{type_tradition}, "
	    		+ "type_enjoyment = #{type_enjoyment}, "
	    		+ "type_pleasure = #{type_pleasure}, "
	    		+ "type_harmony = #{type_harmony} "
	  	  + "WHERE "
				+ "character_id = #{character_id}")
	public void updateCharacter(CharacterVO vo);
	
	@Delete("DELETE FROM "
		    	+ "tbl_character "
		  + "WHERE "
	      		+ "character_id = #{character_id}")
	
	public void deleteCharacter(int character_id);
	
}
