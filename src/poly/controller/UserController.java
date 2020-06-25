package poly.controller;

		import javax.annotation.Resource;
		import javax.servlet.http.HttpServletRequest;
		import javax.servlet.http.HttpServletResponse;
		import javax.servlet.http.HttpSession;

		import org.apache.log4j.Logger;
		import org.springframework.stereotype.Controller;
		import org.springframework.ui.Model;
		import org.springframework.web.bind.annotation.RequestMapping;
		import org.springframework.web.bind.annotation.RequestMethod;
		import org.springframework.web.bind.annotation.ResponseBody;
		import poly.dto.GroupDTO;
		import poly.dto.UserDTO;
		import poly.service.IUserService;
		import poly.util.CmmUtil;

		import java.util.ArrayList;
		import java.util.List;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name= "UserService")
	private IUserService userservice;

	/*시작 화면*/
	@RequestMapping(value = "index")
	public String index() throws Exception {
		return "/index";
	}

	/*닉네임 중복확인*/
	@RequestMapping(value = "/nCheck.do", method = RequestMethod.POST)
	public @ResponseBody String nCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = CmmUtil.nvl(request.getParameter("name"));
		log.info(name);
		return userservice.nCheck(name);
	}

	/*이메일 중복확인*/
	@RequestMapping(value = "/eCheck.do", method = RequestMethod.POST)
	public @ResponseBody String eCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = CmmUtil.nvl(request.getParameter("email"));
		log.info(email);
		return userservice.eCheck(email);
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
	public String login(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		String msg, url;
		String email = CmmUtil.nvl(request.getParameter("email"));
		String pw = CmmUtil.nvl(request.getParameter("pw"));
		log.info(email+"/"+pw);
		UserDTO uDTO = new UserDTO();
		uDTO.setUserEmail(email);
		uDTO.setPassWord(pw);
		try {
			uDTO = userservice.login(uDTO);
		}catch (Exception e){
			e.printStackTrace();
		}

		log.info(uDTO);
		if (uDTO != null){
			session.setAttribute("SS_USER_NAME",uDTO.getUserName());
			session.setAttribute("SS_USER_SEQ",uDTO.getUserSeq());
			msg = "로그인 되었습니다.";
			url = "index.do";
			log.info(" session : " + session);
			log.info("로그인 성공"+uDTO.getUserName());
		}else{
			log.info("응실패");
			msg = "이메일 또는 비밀번호를 다시 확인해주세요.";
			url = "index.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "/redirect";
	}

	/*로그아웃*/
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session,Model model) throws Exception {
		String msg, url;
		msg = "로그아웃 되었습니다.";
		url = "index.do";
		session.invalidate();
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "/redirect";
	}

	/*기능시작화면*/
	@RequestMapping(value = "main")
	public String main(Model model) throws Exception {
		List<GroupDTO> grList = new ArrayList<>();
		List<GroupDTO> goList = new ArrayList<>();
		String function = "0";
		grList=userservice.getGG(function);
		function = "1";
		goList=userservice.getGG(function);
		if(grList==null){
			grList = new ArrayList<GroupDTO>();
		}
		if(goList==null){
			goList = new ArrayList<GroupDTO>();
		}
		model.addAttribute("grList",grList);
		model.addAttribute("goList",goList);
		return "/main";
	}
}
