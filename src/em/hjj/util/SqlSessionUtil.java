package em.hjj.util;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
	public static SqlSession getSqlSession() {
		SqlSessionFactoryBuilder factoryBuilder = new SqlSessionFactoryBuilder();
		InputStream is = SqlSessionUtil.class.getClassLoader().getResourceAsStream("config.xml");
		SqlSessionFactory sessionFactory = factoryBuilder.build(is);
		SqlSession session = sessionFactory.openSession();
		return session;
	}
	
}
