package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import poly.util.CmmUtil;

@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "index")
	public String index() throws Exception {
		return "/index";
	}
}
