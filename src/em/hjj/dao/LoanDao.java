package em.hjj.dao;

import java.util.List;

import em.hjj.pojo.Loan;

public interface LoanDao {
	/**
	 * 查询所有记录
	 * @return
	 */
	List<Loan> queryAll();
	/**
	 * 新建一个记录
	 * @param loan
	 */
	void insert(Loan loan);
	/**
	 * 归还操作
	 * @param load
	 */
	void update(Loan load);
	/**
	 * 查询某位同学借的器材
	 * @return 他借的器材列表
	 */
	List<Loan> queryByName(Loan load);
	List<Loan> queryNoBack();
	
	Loan queryById(Loan loan);
}
