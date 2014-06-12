package org.sos.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sos.vo.UserCharacterVO;

public interface UserCharacterMapper {
	@Insert("INSERT INTO "
			    + "tbl_user_character(user_id, user_character1, user_character2, user_character3) "
		  + "VALUES( "
			    + "#{user_id}, "
			    + "#{user_character1}, "
			    + "#{user_character2}, "
			    + "#{user_character3})")
	public void registUserCharacter(UserCharacterVO vo);

	@Select("SELECT "
				+ "user_id, user_character1, user_character2, user_character3 "
		  + "FROM "
				+ "tbl_user_character "
		  + "WHERE "
				+ "user_id = #{user_id}")
	public UserCharacterVO readUserCharacter(String user_id);
	
	@Update("UPDATE "
				+ "tbl_user_character "
		  + "SET "
				+ "user_character1 = #{user_character1}, "
				+ "user_character2 = #{user_character2}, "
				+ "user_character3 = #{user_character3} "
		  + "WHERE "
				+ "user_id = #{user_id}")
	public void updateUserCharacter(UserCharacterVO vo);
	
	
	@Delete("DELETE FROM "
				+ "tbl_user_character "
		  + "WHERE "
				+ "user_id = #{user_id}")
	public void deleteUserCharacter(String user_id);
	
}
