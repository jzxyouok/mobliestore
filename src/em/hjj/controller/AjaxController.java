package em.hjj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import em.hjj.dao.EqDao;
import em.hjj.dao.TypeDao;
import em.hjj.pojo.Eq;
import em.hjj.pojo.Type;
import em.hjj.util.SqlSessionUtil;
@Controller
public class AjaxController {
	@RequestMapping("/gettype2.html")
	@ResponseBody
	public  List<Type>  getType2(Integer fid){
		
		System.out.println("type1***"+fid);
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		List<Type> types = dao.queryById(fid);
		sqlSession.close();
		//没有二级类别的时候
		if(types.isEmpty()){
		Type empty = new Type();
		empty.setName("没有二级类别");
		empty.setId(0);
		types.add(empty);
		}
		return types;
	}
	@RequestMapping("/geteqs.html")
	public @ResponseBody List<Eq> getEq(Integer id){
		System.out.println("getEqs ID:"+id);
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		EqDao dao = sqlSession.getMapper(EqDao.class);
		
		Type type = new Type();
		type.setId(id);
		List<Eq> eqs = dao.queryByType(type);
		sqlSession.close();
		if(eqs==null||eqs.isEmpty()){
			eqs = new ArrayList<Eq>();
			Eq e = new Eq();
			e.setId(0);
			e.setName("该类别下没有器材");
			eqs.add(e);
		}
		System.out.println(eqs);
		return eqs;
	}
	
	
}
