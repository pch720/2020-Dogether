package poly.controller;

import org.apache.log4j.Logger;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import poly.dto.BoardDTO;
import poly.dto.WordDTO;
import poly.persistance.redis.IRedisMapper;
import poly.service.IBoardService;
import poly.util.CmmUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RController {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource
    private IBoardService boardService;

    @Resource(name = "RedisMapper")
    private IRedisMapper redisMapper;

    @RequestMapping(value = "rConnect")
    @ResponseBody
    public List<WordDTO> rConnect(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String seq = CmmUtil.nvl((String) request.getParameter("seq"));
        log.info("seq : " + seq);
        if(!redisMapper.getExists(seq)) {
            log.info("rConnect 호출");
            RConnection c = new RConnection();
            log.info("R연결 완료");
            log.info("seq request로 받음");
            WordDTO wDTO = new WordDTO();
            List<WordDTO> sList = new ArrayList<>();

            List<BoardDTO> bList = new ArrayList<>();
            bList = boardService.getnotice(seq);
            log.info("컨텐츠 가져옴");
            if (bList.size() == 0) {
                log.info("컨텐츠 없음");
                sList = new ArrayList<>();
            } else {
                log.info("R분석 시작");
                String[] sArr = new String[bList.size()];
                for (int i = 0; i < bList.size(); i++) {
                    sArr[i] = bList.get(i).getContents();
                    log.info(sArr[i]);
                }
                c.eval("library(dbplyr)");
                c.eval("library(tidyverse)");
                c.eval("library(KoNLP)");
                c.eval("useNIADic()");
                c.eval("library(stringr)");
                c.eval("library(reshape2)");
                c.eval("library(RColorBrewer)");
                c.eval("library(wordcloud)");

                c.assign("sArr", sArr);

                // AWS Rserve 구문 (%>% 사용 불가능)
                c.eval("n_df <- select(as_tibble(melt(SimplePos22(sArr,autoSpacing=T))),2,1)");
                c.eval("n_df <- na.omit(mutate(n_df,noun=str_match(value, '([A-Z|a-z|0-9|가-힣]+)/N')[,2]))");
                c.eval("n_df <- count(n_df,noun, sort=TRUE)");
                c.eval("n_df <- filter(n_df,nchar(noun)>=2)");
//            c.eval("m_df <- filter(m_df,n>=2");
                REXP x = c.eval("n_df$noun");
                REXP y = c.eval("n_df$n");
                String[] noun = x.asStrings();
                String[] count = y.asStrings();
                for (int i = 0; i < noun.length; i++) {
                    wDTO = new WordDTO();
                    wDTO.setWord(noun[i]);
                    wDTO.setWordCount(count[i]);
                    log.info("Word : " + wDTO.getWord() + ", Count : " + wDTO.getWordCount());
                    sList.add(wDTO);
                    wDTO = null;
                }
            }
            c.close();
            log.info("R끝");
            redisMapper.setWordCount(seq,sList);
            return sList;
        }
        return redisMapper.getWordCount(seq);
    }
}