package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.dto.GroupDTO;
import poly.service.IGroupService;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class GroupController {
    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name= "GroupService")
    private IGroupService groupservice;
    /*내 그룹*/
    @RequestMapping(value = "MyGroup")
    public String MyGroup() throws Exception {
        return "GG/MyGroup";
    }

    /*그룹만들기*/
    @RequestMapping(value = "MakeGroup")
    public String MakeGroup(HttpServletRequest request, HttpSession session, Model model) throws Exception{
        String msg,url;
        String gname = CmmUtil.nvl(request.getParameter("gname"));
        String greet = CmmUtil.nvl(request.getParameter("greet"));
        String function = CmmUtil.nvl(request.getParameter("function"));
        String name = CmmUtil.nvl((String)session.getAttribute("SS_USER_NAME"));
        GroupDTO gDTO = new GroupDTO();
        gDTO.setGroupName(gname);
        gDTO.setGreeting(greet);
        gDTO.setFunction(function);
        gDTO.setUserName(name);
        log.info(gDTO.getFunction()+"/"+gDTO.getGroupName()+"/"+gDTO.getGreeting()+"/"+gDTO.getUserName());
        /*그룹을만들고*/
        int res = groupservice.MakeGG(gDTO);
        log.info(res);
        log.info(gDTO);
        /*만든사람을 그룹원으로 넣음*/
        int res1 = groupservice.MkGG(gDTO);
        if (gDTO.getFunction().equals("0")) {
            if (res==1&&res1==1){
                msg = "새로운 그룹이 생성되었습니다.";
            }else {
                msg = "그룹 생성이 실패했습니다.";
            }
            url = "MyGroup.do";
        }else{
            if (res==1&&res1==1){
                msg = "새로운 목표가 생성되었습니다.";
            }else {
                msg = "목표 생성이 실패했습니다.";
            }
            url = "MyGoal.do";
        }

        model.addAttribute("msg",msg);
        model.addAttribute("url",url);
        return "/redirect";
    }

    /*내 목표*/
    @RequestMapping(value = "MyGoal")
    public String MyGoal() throws Exception {
        return "GG/MyGoal";
    }
    /*그룹 시작 화면*/
    @RequestMapping(value = "Group")
    public String Group() throws Exception {
        return "/GG/Group";
    }
}
