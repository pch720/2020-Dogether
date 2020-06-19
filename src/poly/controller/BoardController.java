package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import poly.dto.BoardDTO;
import poly.dto.GroupDTO;
import poly.service.IBoardService;
import poly.service.IGroupService;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BoardController {
    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "BoardService")
    private IBoardService boardservice;

    @Resource(name = "GroupService")
    private IGroupService groupservice;
    /*할일추가*/
    @RequestMapping(value = "/writework", method = RequestMethod.POST)
    public @ResponseBody int writework(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
        String contents = CmmUtil.nvl(request.getParameter("contents"));
        String start = CmmUtil.nvl(request.getParameter("start"));
        String end = CmmUtil.nvl(request.getParameter("end"));
        String n = CmmUtil.nvl(request.getParameter("n"));
        String name = CmmUtil.nvl((String)session.getAttribute("SS_USER_NAME"));
        String GUseq = CmmUtil.nvl(request.getParameter("seq"));
        String Group = CmmUtil.nvl(request.getParameter("group"));
        log.info(contents+"/"+name+"/"+start+"/"+end);
        GroupDTO gDTO = new GroupDTO();
        gDTO.setUserName(name);
        gDTO.setGroupName(Group);
        String GU=groupservice.gg(gDTO);
        log.info(GU);
        BoardDTO bDTO = new BoardDTO();
        bDTO.setStDt(start);
        bDTO.setFinDt(end);
        bDTO.setGuSeq(GU);
        bDTO.setGGseq(GUseq);
        bDTO.setContents(contents);
        bDTO.setUserName(name);
        bDTO.setNotice(n);
        log.info(n);
        return boardservice.write(bDTO);
    }
    /*한일로 변경*/
    @RequestMapping(value = "/finwork", method = RequestMethod.POST)
    public @ResponseBody int finwork(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
        String seq = request.getParameter("seq");
        BoardDTO bDTO = new BoardDTO();
        log.info(seq);
        String[] seqs = seq.split(",");
        int res=0;
        for (String s : seqs) {
            log.info(s);
            bDTO.setBoardSeq(s);
            res = boardservice.finwork(bDTO);
            if (res == 0)
                break;
        }
        return res;
    }

    /*할일삭제*/
    @RequestMapping(value = "/delwork", method = RequestMethod.POST)
    public @ResponseBody int delwork(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
        String seq = request.getParameter("seq");
        BoardDTO bDTO = new BoardDTO();
        log.info(seq);
        String[] seqs = seq.split(",");
        int res=0;
        for (String s : seqs) {
            log.info(s);
            bDTO.setBoardSeq(s);
            res = boardservice.delwork(bDTO);
            if (res == 0)
                break;
        }
        return res;
    }
    /*그룹 캘린더 화면*/
    @RequestMapping(value = "Calander")
    public String Calander(HttpServletRequest request, Model model) throws Exception {
        String seq = request.getParameter("seq");
        log.info(seq);
        GroupDTO gDTO = new GroupDTO();
        gDTO = groupservice.getGroupInfo(seq);
        String gname = gDTO.getGroupName();
        List<GroupDTO> user = groupservice.users(gname);
        if(user==null){
            log.info("값없음");
            user = new ArrayList<>();
        }else {
            log.info("user : "+user.get(0).getUserName());
        }
        model.addAttribute("user",user);

        List<BoardDTO> bList = new ArrayList<>();
        bList=boardservice.getnotice(seq);
        if (bList==null)
            bList = new ArrayList<BoardDTO>();
        log.info(bList.size());
        int a=0,b=0;
        List<BoardDTO> bwList = new ArrayList<>();
        List<BoardDTO> bfList = new ArrayList<>();
        for (BoardDTO boardDTO : bList) {
            if (boardDTO.getNotice().equals("2"))
                bwList.add(a++, boardDTO);
            else if (boardDTO.getNotice().equals("3"))
                bfList.add(b++, boardDTO);
        }
        if(bwList==null)
            bwList = new ArrayList<BoardDTO>();
        if(bfList==null)
            bfList = new ArrayList<BoardDTO>();
        model.addAttribute("bfList",bfList);
        model.addAttribute("bwList",bwList);
        model.addAttribute("gDTO",gDTO);
        return "/GG/Calander";
    }
    /*목표 캘린더 화면*/
    @RequestMapping(value = "GCalander")
    public String GCalander(HttpServletRequest request,Model model, HttpSession session) throws Exception {
        String seq = request.getParameter("seq");
        String name = (String)session.getAttribute("SS_USER_NAME");
        log.info(seq);
        GroupDTO gDTO = new GroupDTO();
        gDTO.setGroupSeq(seq);
        gDTO.setUserName(name);
        List<BoardDTO> bList = new ArrayList<>();
        bList=boardservice.getUnotice(gDTO);
        gDTO = groupservice.getGroupInfo(seq);
        String gname = gDTO.getGroupName();
        List<GroupDTO> user = groupservice.users(gname);
        if(user==null){
            log.info("값없음");
            user = new ArrayList<>();
        }else {
            log.info("user : "+user.get(0).getUserName());
        }
        model.addAttribute("user",user);

        if (bList==null)
            bList = new ArrayList<BoardDTO>();
        log.info(bList.size());
        int a=0,b=0;
        List<BoardDTO> bwList = new ArrayList<>();
        List<BoardDTO> bfList = new ArrayList<>();
        for (BoardDTO boardDTO : bList) {
            if (boardDTO.getNotice().equals("3"))
                bfList.add(b++, boardDTO);
            else
                bwList.add(a++, boardDTO);
        }
        if(bwList==null)
            bwList = new ArrayList<BoardDTO>();
        if(bfList==null)
            bfList = new ArrayList<BoardDTO>();
        model.addAttribute("bfList",bfList);
        model.addAttribute("bwList",bwList);
        model.addAttribute("gDTO",gDTO);
        return "/GG/GCalander";
    }
}
