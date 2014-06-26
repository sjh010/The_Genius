package org.sos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sos.vo.UserVO;

public interface UserMapper {
	
	@Insert("INSERT INTO "
				+ "tbl_user(user_id, user_password, user_name, user_birth, user_sex, "
						 + "user_addr, user_email, user_mobile, user_phone) "
		   +"VALUES( "
				+ "#{user_id}, "
				+ "#{user_password}, "
				+ "#{user_name}, "
				+ "#{user_birth}, "
				+ "#{user_sex}, "
				+ "#{user_addr}, "
				+ "#{user_email}, "
				+ "#{user_mobile}, "
				+ "#{user_phone})")
	public void registUser(UserVO vo);
	
	@Select("SELECT "
				+ "user_id, user_password, user_name, user_birth, user_sex, "
				+ "user_addr, user_email, user_mobile, user_phone, user_grade "
		  + "FROM "
		  		+ "tbl_user "
		  + "WHERE "
		  		+ "user_id = #{user_id}")
	public UserVO readUser(String user_id);
	
	@Select("SELECT "
				+ "user_id, user_grade, user_joindate "
		  + "FROM "
		  		+ "(SELECT "
		  				+ "A.*, ROWNUM AS RNUM, FLOOR((ROWNUM-1)/5+1) AS PAGE, COUNT(*) OVER() AS TOTCNT "
		  		 + "FROM "
		  		 		+ "("
		  		 			+ "SELECT "
		  		 				+ "user_id, user_grade, user_joindate "
		  		 			+ "FROM "
		  		 				+ "tbl_user"
		  		 		+ ") A) "
		  + "WHERE PAGE = #{pageNo}")
	
	public List<UserVO> readUserList(int pageNo);
	
	@Update("UPDATE "
				+ "tbl_user "
		  + "SET "
				+ "user_password = #{user_password}, "
				+ "user_name 	 = #{user_name}, "
				+ "user_birth 	 = #{user_birth}, "
				+ "user_sex 	 = #{user_sex}, "
				+ "user_addr 	 = #{user_addr}, "
				+ "user_email 	 = #{user_email}, "
				+ "user_mobile 	 = #{user_mobile}, "
				+ "user_phone 	 = #{user_phone} "
		  + "WHERE "
				+ "user_id = #{user_id}")
	public void updateUser(UserVO vo);
	
	@Update("UPDATE "
				+ "tbl_user "
		  + "SET "
		  		+ "user_grade = #{user_grade} "
		  + "WHERE "
		  		+ "user_id = #{user_id}")
	public void updateUserGrade(UserVO userVo);
	
	@Delete("DELETE FROM "
				+ "tbl_user "
		  + "WHERE "
		  		+ "user_id = #{user_id}")
	public void deleteUser(String user_id);

	@Select("select count(user_id) from tbl_user")
	public int getTotalCnt();

}
