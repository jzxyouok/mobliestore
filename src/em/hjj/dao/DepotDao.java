package em.hjj.dao;

import java.util.List;

import em.hjj.pojo.Depot;

public interface DepotDao {
 List<Depot> queryAll();
 void insert(Depot depot);
void insert2(Depot depot);
List<Depot> queryAll2();
}
