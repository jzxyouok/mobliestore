package em.hjj.dao;

import java.util.List;

import em.hjj.pojo.Type;

public interface TypeDao {

	/**
	 * 插入器材类别
	 * @param type
	 */
	public void insert(Type type);
	
	/**
	 * 查询所有类别
	 * @return
	 */
	public List<Type> queryAll();
	
	public List<Type> queryById(int id);
}
