package org.sos.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sos.vo.AdminVO;

public interface AdminMapper {

	@Insert("INSERT INTO "
				+ "tbl_admin(admin_id, admin_password, admin_name) "
		  + "VALUES"
		  		+ "(#{admin_id}, #{admin_password}, #{admin_name})")
	public void registAdmin(AdminVO vo);

	@Select("SELECT admin_id, admin_password, admin_name "
		  + "FROM 	tbl_admin "
		  + "WHERE 	admin_id = #{admin_id}")
	public AdminVO readAdmin(String admin_id);

	@Update("UPDATE "
				+ "tbl_admin "
		  + "SET "
		  		+ "admin_id 	  = #{admin_id}, "
		  		+ "admin_password = #{admin_password}, "
		  		+ "admin_name 	  = #{admin_name}")
	public void updateAdmin(AdminVO vo);

	@Delete("DELETE FROM "
				+ "tbl_admin "
		   + "WHERE "
		   		+ "admin_id = #{admin_id}")
	public void deleteAdmin(String admin_id);
	
}


