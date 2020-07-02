package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import poly.dto.BoardDTO;
import poly.dto.GroupDTO;
import poly.persistance.redis.impl.RedisMapper;
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
        String userSeq=CmmUtil.nvl((String)session.getAttribute("SS_USER_SEQ"));
        String GUseq = CmmUtil.nvl(request.getParameter("seq"));
        String Group = CmmUtil.nvl(request.getParameter("group"));
        log.info(contents + "/" + name + "/" + start + "/" + end);
        GroupDTO gDTO = new GroupDTO();
        gDTO.setUserName(name);
        gDTO.setGroupName(Group);
        String GU = groupservice.gg(gDTO);
        log.info(GU);
        BoardDTO bDTO = new BoardDTO();
        bDTO.setUserSeq(userSeq);
        bDTO.setStDt(start);
        bDTO.setFinDt(end);
        bDTO.setGuSeq(GU);
        bDTO.setGGseq(GUseq);
        bDTO.setContents(contents);
        bDTO.setUserName(name);
        bDTO.setNotice(n);
        log.info(n);
        if (n.equals("0")){
            return boardservice.Notice(bDTO);
        }else {
            return boardservice.write(bDTO);
        }
    }
    /*댓글추가*/
    @RequestMapping(value = "/writerep", method = RequestMethod.POST)
    public @ResponseBody int writerep(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
        String contents = CmmUtil.nvl(request.getParameter("contents"));
        String seq = CmmUtil.nvl(request.getParameter("seq"));
        String group = CmmUtil.nvl(request.getParameter("group"));
        String name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
        log.info(contents + "/" + name + "/" + seq+"/"+group);
        BoardDTO bDTO = new BoardDTO();
        bDTO.setUserName(name);
        bDTO.setGGseq(group);
        bDTO.setContents(contents);
        bDTO.setBoardSeq(seq);
        return boardservice.writerep(bDTO);
    }
    /*댓글삭제*/
    @RequestMapping(value = "/delrep", method = RequestMethod.POST)
    public @ResponseBody int delrep(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
        String seq = request.getParameter("seq");
        log.info(seq);
        return boardservice.delrep(seq);
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
        String n = request.getParameter("n");
        BoardDTO bDTO = new BoardDTO();
        log.info(seq);
        if (n!=null) {
            bDTO.setBoardSeq(seq);
            return boardservice.delwork1(bDTO);
        }else {
            String[] seqs = seq.split(",");
            int res = 0;
            for (String s : seqs) {
                log.info(s);
                bDTO.setBoardSeq(s);
                res = boardservice.delwork(bDTO);
                if (res == 0)
                    break;
            }
            return res;
        }
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

    /*게시글 수정*/
    @RequestMapping(value = "/ModNotice", method = RequestMethod.POST)
    public @ResponseBody int ModNotice(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
        String contents = CmmUtil.nvl(request.getParameter("contents"));
        String name = CmmUtil.nvl((String)session.getAttribute("SS_USER_NAME"));
        String seq = CmmUtil.nvl(request.getParameter("seq"));
        String n = CmmUtil.nvl(request.getParameter("n"));
        log.info(contents+"/"+name+"/"+seq);
        BoardDTO bDTO = new BoardDTO();
        bDTO.setUpId(name);
        bDTO.setBoardSeq(seq);
        bDTO.setContents(contents);
        if (n.equals("1"))
            return boardservice.MNotice1(bDTO);
        else
            return boardservice.MNotice(bDTO);
    }
    /*좋아요수정*/
    @RequestMapping(value = "/like", method = RequestMethod.POST)
    public @ResponseBody int like(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
        String seq = request.getParameter("seq");
        String like = request.getParameter("like");
        String a = request.getParameter("a");
        String useq = (String)session.getAttribute("SS_USER_SEQ");
        int li=0;
        BoardDTO bDTO = new BoardDTO();
        bDTO.setBoardSeq(seq);
        bDTO.setUserName(useq);
        if (a.equals("1")) {
            li = Integer.parseInt(like) + 1;
           int b = boardservice.ML(bDTO);
           log.info(b);
        }else{
            li=Integer.parseInt(like)-1;
            int b = boardservice.DL(bDTO);
            log.info(b);
        }
        like=Integer.toString(li);
        bDTO.setLike(like);
        return boardservice.like(bDTO);
    }
    /*공지사항*/
    @RequestMapping(value = "Notice")
    public String Group(HttpServletRequest request,Model model,HttpSession session) throws Exception {

        List<BoardDTO> Notice = new ArrayList<>();
        Notice=boardservice.getN();
        if (Notice==null)
            Notice = new ArrayList<BoardDTO>();
        log.info(Notice.size());

        model.addAttribute("Notice",Notice);
        return "/Notice";
    }
    /*채팅추가*/
    @RequestMapping(value = "/writechat", method = RequestMethod.POST)
    public @ResponseBody int writechat(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
        String contents = CmmUtil.nvl(request.getParameter("contents"));
        String group = CmmUtil.nvl(request.getParameter("group"));
        String name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
        String useq = CmmUtil.nvl((String) session.getAttribute("SS_USER_SEQ"));
        log.info(contents + "/" + name + "/"+useq+"/"+group);
        BoardDTO bDTO = new BoardDTO();
        bDTO.setUserName(name);
        bDTO.setGGseq(group);
        bDTO.setContents(contents);

        log.info("asdf");
        bDTO.setUserSeq(useq);
        return boardservice.writechat(bDTO);
    }
}
