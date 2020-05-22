package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "index")
	public String index(HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + " : index 호출");
		return "/index";
	}
}
