package kr.co.byby;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/**/*.xml" })
public class DBTest {

	@Autowired
	private DataSource ds;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Test
	public void DB테스트() throws Exception {
		System.out.println("ds : " + ds);
		System.out.println("sqlSessionTemplate :" + sqlSessionTemplate);

		assertNotNull(ds);
	}

}
