package em.hjj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import em.hjj.dao.EqDao;
import em.hjj.dao.TypeDao;
import em.hjj.pojo.Eq;
import em.hjj.pojo.Type;
import em.hjj.util.SqlSessionUtil;

@RequestMapping(value="/type")
@Controller
public class TypeController {
	private static String LIST="";
	
	
	@RequestMapping("type1.html")
	public String type1(HttpServletRequest req){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		List<Type> typelist=dao.queryAll();
		req.setAttribute("typelist", typelist);
		sqlSession.close();
		return "type/type01";
	}
	@RequestMapping("type2.html")
	public String type2(HttpServletRequest req){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		List<Type> typelist=dao.queryAll();
		req.setAttribute("typelist", typelist);
		sqlSession.close();
		return "type/type02";
	}
	@RequestMapping("typeli.html")
	public String typeli(HttpServletRequest req){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		List<Type> typelist=dao.queryAll();
		req.setAttribute("typelist", typelist);
		sqlSession.close();
		return "type/typeli";
	}
	
	@RequestMapping(value="/addType1.html",method=RequestMethod.POST)
	public String addtype1(String type1){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		Type type = new Type();
		type.setFid(0);
		type.setName(type1);
		dao.insert(type);
		sqlSession.commit();
		sqlSession.close();		
		return "redirect:type1.html";
	}
	
	@RequestMapping("/addType2.html")
	public String addtype2(int fid,String type2){
		Type type = new Type();
		type.setFid(fid);
		type.setName(type2);
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		dao.insert(type);
		sqlSession.commit();
		sqlSession.close();		
		return "redirect:type2.html";
	}
	@RequestMapping("/addTypeli.html")
	public String addTypeli(Eq eq){
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		EqDao dao = sqlSession.getMapper(EqDao.class);
		dao.insert(eq);
		sqlSession.commit();
		sqlSession.close();		
		return "redirect:typeli.html";
	}
	
	/*@ResponseBody
	@RequestMapping("getType.html")
	public Map getType(Integer fid){
		Map jsonMap = new HashMap();
		System.out.println("gettype");
		System.out.println(fid);
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		
		List<Type> typelist=dao.queryAll();
		sqlSession.close();
		List<Type> types2 = new ArrayList<Type>();
		
		for (Type type : typelist) {
			if(type.getFid()==fid){
				types2.add(type);
			}
		}
		List<Map> list = new ArrayList<Map>();
		if(types2.isEmpty()){
			 Map taskMap=new HashMap();
			 taskMap.put("id", 0);
			 taskMap.put("name", null);
			 taskMap.put("fid", 0);
			list.add(taskMap);
		}else{
		for (Type type : types2) {
			 Map taskMap=new HashMap();
			 taskMap.put("id", type.getId());
			 taskMap.put("name", type.getName());
			 taskMap.put("fid", type.getFid());
			list.add(taskMap);
		}
		}
		jsonMap.put("list", list);
	return jsonMap;	
	}*/
	
	@ResponseBody
	@RequestMapping(value="/getType.html")
	public List getType(Integer fid){
		List<Type> list = new ArrayList<Type>();
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		TypeDao dao = sqlSession.getMapper(TypeDao.class);
		
		List<Type> allType= dao.queryAll();
		System.out.println("method"+fid);
		for (Type type : allType) {
			if(type.getFid()==fid){
				list.add(type);
				System.out.println(type.getName());
			}
		}
		System.out.println(fid);
		return list;
	}
	
	
}
