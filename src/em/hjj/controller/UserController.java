package em.hjj.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import em.hjj.dao.UserDao;
import em.hjj.pojo.User;
import em.hjj.util.SqlSessionUtil;

@Controller
public class UserController {
	
	@RequestMapping("/password.html")
	public String user(){
		return "/user/password";
	}
	
	@RequestMapping(value="/user.html",method=RequestMethod.POST)
//	@ResponseBody
	public String changepwd(@RequestParam(value="pwd1")String pwd1,HttpServletRequest req){
		User user =(User) req.getSession().getAttribute("user");
		user.setPwd(pwd1);
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.changePwd(user);
		sqlSession.commit();
		sqlSession.close();
		return "/user/password";
	}
}
