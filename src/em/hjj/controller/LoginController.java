package em.hjj.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import em.hjj.dao.UserDao;
import em.hjj.pojo.User;
import em.hjj.util.SqlSessionUtil;

@Controller
public class LoginController {
	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String login(User user,HttpServletRequest model)  {
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		UserDao dao = sqlSession.getMapper(UserDao.class);
		User user2;
		
		if((user2=dao.login(user))!=null){
			model.getSession().setAttribute("user", user2);
			sqlSession.close();
			return "base/main";
			
		}else{
			model.setAttribute("loginmsg", "请检查您的用户名及密码是否正确");
			return "backtoindex";
		}
	}
}