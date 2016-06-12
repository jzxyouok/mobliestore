package em.hjj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import em.hjj.dao.DepotDao;
import em.hjj.dao.EqDao;
import em.hjj.dao.LoanDao;
import em.hjj.dao.TypeDao;
import em.hjj.pojo.Depot;
import em.hjj.pojo.Eq;
import em.hjj.pojo.Loan;
import em.hjj.pojo.Type;
import em.hjj.util.GetDate;
import em.hjj.util.SqlSessionUtil;

@RequestMapping("/loan")
@Controller
public class LoanController {
@RequestMapping("pageout.html")
public String pageout(HttpServletRequest req){
	SqlSession sqlSession = SqlSessionUtil.getSqlSession();
	TypeDao dao = sqlSession.getMapper(TypeDao.class);
	List<Type> typelist=dao.queryAll();
	req.setAttribute("typelist", typelist);
	sqlSession.close();
	return "br/out";
}
@RequestMapping("pageback.html")
public String pageback(){
	return "br/back";
}
@RequestMapping("pagequerynotback.html")
public String pagequerynotback(HttpServletRequest req){
	SqlSession sqlSession = SqlSessionUtil.getSqlSession();
	LoanDao dao = sqlSession.getMapper(LoanDao.class);
	List<Loan> list = dao.queryNoBack();
	
	
	TypeDao tdao = sqlSession.getMapper(TypeDao.class);
	EqDao edao = sqlSession.getMapper(EqDao.class);
	List<Type> types=tdao.queryAll();
	List<Eq>eqs = edao.queryAll();
	
	req.setAttribute("noback", list);
	req.setAttribute("types", types);
	req.setAttribute("eqs", eqs);
	
	sqlSession.close();
	return "br/notback";
}
@RequestMapping("pagequeryall.html")
public String pagequeryall(HttpServletRequest req){
	SqlSession sqlSession = SqlSessionUtil.getSqlSession();
	LoanDao dao = sqlSession.getMapper(LoanDao.class);
	List<Loan> list = dao.queryAll();
	
	TypeDao tdao = sqlSession.getMapper(TypeDao.class);
	EqDao edao = sqlSession.getMapper(EqDao.class);
	List<Type> types=tdao.queryAll();
	List<Eq>eqs = edao.queryAll();
	
	req.setAttribute("all", list);
	req.setAttribute("types", types);
	req.setAttribute("eqs", eqs);
	req.setAttribute("eqlist", list);
	sqlSession.close();
	return "br/query";
}
@RequestMapping("eqout.html")
public String out(Loan loan,HttpServletRequest req){
	SqlSession sqlSession = SqlSessionUtil.getSqlSession();
	LoanDao dao = sqlSession.getMapper(LoanDao.class);
	loan.setOutdate(GetDate.getNowDate());
	
	
	
	int num = loan.getNum();
	EqDao edao = sqlSession.getMapper(EqDao.class);
	Eq vo = edao.queryById(loan.getEqid());
	vo.setNownum(vo.getNownum()-num);
	//如果是耗材
	if(vo.getIshaocai()==1){
		vo.setTotal(vo.getTotal()-num);
		loan.setBackdate("耗材不用归还");
	}
	dao.insert(loan);
	edao.update(vo);
	sqlSession.commit();
	sqlSession.close();
	req.getSession().setAttribute("stu", loan);
	return "redirect:pageout.html";
}
@RequestMapping("eqback.html")
public String back(int cid, String name,HttpServletRequest req1){
	SqlSession sqlSession = SqlSessionUtil.getSqlSession();
	LoanDao dao = sqlSession.getMapper(LoanDao.class);
	Loan vo = new Loan();
	HttpSession req = req1.getSession();
	vo.setCid(cid);
	vo.setName(name);
	List<Loan>  list = dao.queryByName(vo);
	TypeDao tdao = sqlSession.getMapper(TypeDao.class);
	EqDao edao = sqlSession.getMapper(EqDao.class);
	List<Type> types=tdao.queryAll();
	List<Eq>eqs = edao.queryAll();
	sqlSession.close();
	req.setAttribute("stu2", vo);
	req.setAttribute("eqlist", list);
	req.setAttribute("types", types);
	req.setAttribute("eqs", eqs);
	return "redirect:pageback.html";
}
/**
 * 设置当前器材在loan表中为 归还状态
 * 设置当前器材在eq表中的数量
 * @param id
 * @param req
 * @return
 */
@RequestMapping(value="back/{id}",method=RequestMethod.GET)
public String delete(@PathVariable("id")String id,HttpServletRequest req){
	SqlSession sqlSession = SqlSessionUtil.getSqlSession();
	LoanDao dao = sqlSession.getMapper(LoanDao.class);
	Loan vo = new Loan();
	vo.setId(Integer.parseInt(id));
	vo.setBackdate(GetDate.getNowDate());
	HttpSession session = req.getSession();
	Loan stu = (Loan) session.getAttribute("stu2");
	List<Loan> loans = dao.queryByName(stu);
	session.setAttribute("eqlist", loans);
	dao.update(vo);
	EqDao edao = sqlSession.getMapper(EqDao.class);
	Loan vo2 = dao.queryById(vo);
	Eq eq = edao.queryById(vo2.getEqid());
	eq.setNownum(eq.getNownum()+vo2.getNum());
	edao.update(eq);
	sqlSession.commit();
	sqlSession.close();
	return  "redirect:../pageback.html";
}


}
