package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name= "UserService")
	private IUserService userservice;

	@RequestMapping(value = "index")
	public String index() throws Exception {
		return "/index";
	}
	/*회원가입*/
	@RequestMapping(value = "Reg",method = RequestMethod.POST)
	public @ResponseBody int Reg(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String email = CmmUtil.nvl(request.getParameter("email"));
		String name = CmmUtil.nvl(request.getParameter("name"));
		String pw = CmmUtil.nvl(request.getParameter("password"));
		log.info(email);
		log.info(name);
		log.info(pw);


		UserDTO uDTO = new UserDTO();
		uDTO.setUserName(name);
		uDTO.setUserEmail(email);
		uDTO.setPassWord(pw);

		int result = 0;

		result =userservice.Reg(uDTO);
		log.info(result);

		return result;
	}
	/*로그인*/
	@RequestMapping(value = "login")
	public String login(HttpServletRequest request, HttpSession session) throws Exception {
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		log.info(email+"/"+pw);
		UserDTO uDTO = new UserDTO();
		uDTO.setUserEmail(email);
		uDTO.setPassWord(pw);
		log.info(uDTO.getUserEmail());
		uDTO = userservice.login(uDTO);
		log.info(uDTO.getUserName());
		if (uDTO==null){
			log.info("로그인 실패"+uDTO.getUserName());
		}else{
			session.setAttribute("SS_USER_NAME",uDTO.getUserName());

			log.info(" session : " + session);
			log.info("로그인 성공"+uDTO.getUserName());
		}
		return "/index";
	}
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "/index";
	}
}
