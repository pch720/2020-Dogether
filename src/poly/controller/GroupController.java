package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.service.IGroupService;

import javax.annotation.Resource;

@Controller
public class GroupController {
    private Logger log = Logger.getLogger(this.getClass());

    /*시작 화면*/
    @RequestMapping(value = "Group")
    public String Group() throws Exception {
        return "/GG/Group";
    }
}
