package em.hjj.dao;


import java.util.List;

import em.hjj.pojo.Eq;
import em.hjj.pojo.Page;
import em.hjj.pojo.Type;

/**
 * @author Yu
 *
 */
public interface EqDao {
/**
 * 插入新建设备
 * @param eq
 */
public void insert(Eq eq);

public void update(Eq eq);

/**
 * 查询所有元素
 * @return
 */
public List<Eq> queryAll();

/**
 * 按ID查找
 * @param id
 * @return
 */
public Eq queryById(int id);

public List<Eq> queryByType(Type type);


}
