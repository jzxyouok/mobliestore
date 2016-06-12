package em.hjj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import em.hjj.dao.DepotDao;
import em.hjj.dao.EqDao;
import em.hjj.dao.TypeDao;
import em.hjj.pojo.Depot;
import em.hjj.pojo.Eq;
import em.hjj.pojo.Type;
import em.hjj.util.GetDate;
import em.hjj.util.SqlSessionUtil;

@RequestMapping(value="/eq")
@Controller
public class EqController {
	@RequestMapping("in.html")
	public String in(HttpServletRequest req){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		List<Type> typelist=dao.queryAll();
		req.setAttribute("typelist", typelist);
		sqlSession.close();
		return "eq/enter";
	}
	
	@RequestMapping("out.html")
	public String out(HttpServletRequest req){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		List<Type> typelist=dao.queryAll();
		req.setAttribute("typelist", typelist);
		sqlSession.close();
		return "eq/out";
	}
	
	@RequestMapping("stock.html")
	public String stock(HttpServletRequest req){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao tdao = sqlSession.getMapper(TypeDao.class);
		DepotDao ddao  = sqlSession.getMapper(DepotDao.class);
		EqDao edao = sqlSession.getMapper(EqDao.class);
		
		List<Type> types=tdao.queryAll();
		List<Depot> depots = ddao.queryAll();
		List<Depot> depots2 = ddao.queryAll2();
		List<Eq>eqs = edao.queryAll();
		
		req.setAttribute("types", types);
		req.setAttribute("depots", depots);
		req.setAttribute("depots2", depots2);
		req.setAttribute("eqs", eqs);
		
		sqlSession.close();
		return "eq/stock";
	}
	
	@RequestMapping(value="/enter.html")
	public String enter(Depot depot){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		DepotDao ddao = sqlSession.getMapper(DepotDao.class);
		EqDao 	 edao = sqlSession.getMapper(EqDao.class);
		depot.setIntime(GetDate.getNowDate());
		ddao.insert(depot);
		Eq eq=edao.queryById(depot.getEid());
		eq.setTotal(eq.getTotal()+depot.getNum());
		eq.setNownum(eq.getNownum()+depot.getNum());
		edao.update(eq);
		sqlSession.commit();
		sqlSession.close();
		return "redirect:in.html";
	}
	@RequestMapping(value="/destory.html")
	public String destory(Depot depot){
		System.out.println(depot);
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		DepotDao ddao = sqlSession.getMapper(DepotDao.class);
		EqDao 	 edao = sqlSession.getMapper(EqDao.class);
		depot.setIntime(GetDate.getNowDate());
		ddao.insert2(depot);
		Eq eq=edao.queryById(depot.getEid());
		eq.setTotal(eq.getTotal()-depot.getNum());
		eq.setNownum(eq.getNownum()-depot.getNum());
		edao.update(eq);
		sqlSession.commit();
		sqlSession.close();
		return "redirect:out.html";
	}
	
	
}
