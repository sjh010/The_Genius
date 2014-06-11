package org.sos.test;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/**/*-context.xml"})

public class SampleTest {
	
	@Inject
	DataSource ds;
	
	@Test
	public void testDs1() {
		try{
			Connection con = ds.getConnection();
			System.out.println(con);
		} catch (SQLException e) {
			
		}
	}
	
	
}
