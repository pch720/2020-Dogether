package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
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
        bDTO.setNotice("2");
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

}
