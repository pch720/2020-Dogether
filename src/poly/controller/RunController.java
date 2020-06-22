package poly.controller;

import org.apache.log4j.Logger;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RunController {

    private Logger log = Logger.getLogger(this.getClass());

    @RequestMapping(value = "RConnect")
    public String RConnect() throws RserveException {
        System.out.println("RConnect 연결");
        RConnection c = new RConnection();
        c.eval("library(tidyverse)");
        c.eval("library(KoNLP)");
        c.eval("useNIADic()");
        c.eval("library(stringr)");
        c.eval("library(reshape2)");
        c.eval("library(dbplyr)");
        c.eval("library(RColorBrewer)");
        c.eval("library(wordcloud)");
        c.close();
        log.info("RConnect 연결 끝");

        return "/index";
    }
}