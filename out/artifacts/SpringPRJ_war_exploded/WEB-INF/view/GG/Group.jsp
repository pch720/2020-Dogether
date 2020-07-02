<%@ page import="poly.dto.GroupDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="poly.dto.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    GroupDTO gDTO = (GroupDTO) request.getAttribute("gDTO");
    List<BoardDTO> bfList = (List<BoardDTO>) request.getAttribute("bfList");
    int Fsize = bfList.size();
    List<BoardDTO> bnList = (List<BoardDTO>) request.getAttribute("bnList");
    int Nsize = bnList.size();
    List<BoardDTO> bwList = (List<BoardDTO>) request.getAttribute("bwList");
    int Wsize = bwList.size();
    List<GroupDTO> user = (List<GroupDTO>)request.getAttribute("user");
    String SS_name =(String)session.getAttribute("SS_USER_NAME");
    List<BoardDTO> reply = (List<BoardDTO>) request.getAttribute("reply");
    int Rsize = reply.size();
    String[] like = (String[]) request.getAttribute("like");
    List<BoardDTO> Chat = (List<BoardDTO>) request.getAttribute("Chat");
    int Csize = Chat.size();
%>
<html lang="en">
<head>
    <style>
        .TitlePadding{
            padding-left: 10% !important;
            padding-right: 10% !important;
        }
        .floatMenu{
            position: absolute;
            margin-top: 120px;
        }
        .Menu1 {
            width: 220px;
            height: 200px;
            left: 5%;
            top: 10px;
        }
        .Menu2 {
            width: 250px;
            height: 200px;
            right: 4%;
            top: 10px;
        }
        .Menu3 {
            width: 220px;
            height: 300px;
        }
        /* front pane, placed above back */
        .front{
            transform: rotateY(0deg);
        }
        /* back, initially hidden pane */
        .back {
            transform: rotateY(180deg);
        }
        /* flip the pane when hovered */
        .flip-container.hover .flipper {
            transform: rotateY(180deg);
        }
        .flip-container, .front, .back {
            width: 250px;
            height: 260px;
        }
        /* flip speed goes here */
        .flipper {
            transition: 0.5s;
            /* 하위요소에 3D 좌표값 지정 */
            transform-style: preserve-3d;
            position: relative;
        }
        /* hide back of pane during swap */
        .front, .back{
            position: absolute;
            backface-visibility:hidden;
        }
        section{
            text-align: -webkit-center;
            margin-top: 130px;
        }
    </style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>그룹 페이지</title>

    <!-- hover -->
    <link href="/css/hover.css" rel="stylesheet">

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.min.css" rel="stylesheet">

</head>
<!-- jQuery load -->
<script
        src="https://code.jquery.com/jquery-3.5.0.js"
        integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
        crossorigin="anonymous"
></script>
<%if (gDTO.getFunction().equals("1")){%>
<body id="page-top" class="bg-warning" style="height: auto;">
    <%}else{%>
<body id="page-top" class="bg-primary" style="height: auto;">
<%}%>
<!-- 네비게이션바 -->
<%@include file="../include/nav.jsp"%>
<%if (gDTO.getFunction().equals("1")){%>
<div class="floatMenu Menu1" style="z-index: 100;">
    <%--떠다니는 진행상황--%>
    <div class="modal-content">
        <div class="modal-body" style="text-align: center;">
            <a href="/GCalander.do?seq=<%=gDTO.getGroupSeq()%>" class="btn btn-primary" type="button">내 목포 현황 확인</a>
        </div>
    </div>
    <%--떠다니는 그룹원--%>
    <div class="modal-content Menu3">
        <div class="modal-header" style="justify-content: center;">
            <h5 class="modal-title"><%=gDTO.getGroupName()%>(<%=gDTO.getCount()%>명)<a href="#" id="chat"><i class="fas fa-comments"></i></a>
                <a href="#" style="display: none;" id="goboard"><i class="fas fa-clipboard"></i></a></h5>
        </div>
        <div class="modal-body" style="text-align: center;">
            <%for (GroupDTO groupDTO : user) {
                if (!groupDTO.getUserName().equals(SS_name)) {%>
            <div><%=groupDTO.getUserName()%></div>
            <%}}%>
        </div>
    </div>
</div>
<div class="floatMenu Menu2" style="z-index: 100;">
    <%--떠다니는 메모장--%>
    <div class="modal-content">
        <div class="modal-header" style="justify-content: center;">
            <h5 class="modal-title">메모장</h5>
        </div>
        <div class="modal-footer" style="justify-content: center;">

            <label>
                <textarea cols="100" rows="7" class="form-control"></textarea>
            </label>
        </div>
    </div>
</div>
<%}else{%>
<div class="floatMenu Menu1" style="z-index: 100;">
    <%--떠다니는 진행상황--%>
    <div class="modal-content">
        <div class="modal-body" style="text-align: center;">
            <a href="/Calander.do?seq=<%=gDTO.getGroupSeq()%>" class="btn btn-primary" type="button">그룹 작업 현황 보기</a>
        </div>
    </div>
    <%--떠다니는 그룹원--%>
    <div class="modal-content Menu3">
        <div class="modal-header" style="justify-content: center;">
            <h5 class="modal-title"><%=gDTO.getGroupName()%>(<%=gDTO.getCount()%>명) <a href="#" id="chat"><i class="fas fa-comments"></i></a>
                <a href="#" style="display: none;" id="goboard"><i class="fas fa-clipboard"></i></a></h5>
        </div>
        <div class="modal-body" style="text-align: center;">
            <%for (GroupDTO groupDTO : user) {
                if (!groupDTO.getUserName().equals(SS_name)) {%>
            <div><%=groupDTO.getUserName()%></div>
            <%}}%>
        </div>
    </div>
    <%--떠다니는 메모장--%>
    <div class="modal-content">
        <div class="modal-header" style="justify-content: center;">
            <h5 class="modal-title">메모장</h5>
        </div>
        <div class="modal-footer" style="justify-content: center;">

            <label>
                <textarea cols="100" rows="7" class="form-control"></textarea>
            </label>
        </div>
    </div>
</div>
<div class="floatMenu Menu2" style="z-index: 100;">
    <!--떠다니는 해야될 일-->
    <div class="flip-container" ontouchstart="this.classList.toggle('hover');">
        <div class="flipper">
            <!-- front content -->
            <div class="modal-content front" style="position: absolute!important;">
                <div class="modal-header" style="justify-content: center;">
                    <h5 class="modal-title">할 일</h5>
                    <i id="add" class="fas fa-plus-circle" style="align-self: center; margin-left: 5px; font-size: x-large;"></i>
                </div>
                <form>
                    <div class="modal-body" style="display: block;overflow: scroll; height: 120px;">
                        <%for (int i= 0; i<Wsize; i++){%>
                        <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" value="<%=bwList.get(i).getBoardSeq()%>" id="do<%=i%>">
                            <label style="word-break: break-all;" class="custom-control-label" for="do<%=i%>"><%=bwList.get(i).getContents()%></label>
                        </div>
                        <%}%>
                    </div>
                    <div class="modal-footer" style="justify-content: center;">
                        <button class="btn btn-secondary" id="finish" type="button">한 일로 변경</button>
                        <button class="btn btn-danger" id="del" type="button">삭제</button>
                    </div>
                </form>
            </div>
            <!-- 할 일 추가 -->
            <div class="modal-content back">
                <div class="modal-header" style="justify-content: center;">
                    <h5 class="modal-title">할 일 추가</h5>
                </div>
                <div class="modal-footer">
                    <form style="text-align: center;">
                        <label>
                            <textarea cols="100" rows="4" class="form-control" id="contents"></textarea>
                        </label>
                        <input type="hidden" name="notice" value="2">
                        <button class="btn btn-primary" type="button" id="add1">할일보기</button>
                        <button class="btn btn-secondary" type="button" id="add2">추가하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%--떠다니는 한일--%>
    <div class="modal-content front" style="position: absolute!important;">
        <div class="modal-header" style="justify-content: center;">
            <h5 class="modal-title">한 일</h5>
        </div>
        <form>
            <div class="modal-body" style="display: block;overflow: scroll; height: 120px;">
                <%for (int i= 0; i<Fsize; i++){%>
                <div class="custom-control custom-checkbox mr-sm-2">
                    <input type="checkbox" class="custom-control-input" value="<%=bfList.get(i).getBoardSeq()%>" id="done<%=i%>">
                    <label style="word-break: break-all;" class="custom-control-label" for="done<%=i%>"><%=bfList.get(i).getContents()%></label>
                </div>
                <%}%>
            </div>
            <div class="modal-footer" style="justify-content: center;">
                <button class="btn btn-danger" id="dele" type="button">삭제</button>
            </div>
        </form>
    </div>
</div>
<%}%>
<!-- 그룹 게시판 -->
<section id="board">
    <a href="#" class="modal-content" data-toggle="modal" data-target="#MakeModal" style="margin-top: 130px; width: 56%; height: 150px; min-width: 650px;text-decoration: none;color: black;">
        내용을 입력해 주세요.
    </a>
    <%for(int i=Nsize-1;i>-1;i--){%>
    <div class="modal-content" style="margin-top: 10px; width: 56%; min-width: 650px;">
        <div>
            <%if (bnList.get(i).getUserName().equals(session.getAttribute("SS_USER_NAME"))){%>
            <div style="text-align:right;">
                <div class="btn-group dropright" style="font-size: larger;margin: 10px;margin-bottom: 0;">
                    <%--수정--%>
                    <i data-toggle="modal" data-target="#Nmod<%=i%>" class="fas fa-pencil-alt" style="margin-right: 15px;color: green;"></i>
                    <%--삭제--%>
                    <i class="fas fa-times-circle" id="Ndel<%=i%>" style="color: #DC3545;"></i>
                </div>
            </div><hr>
            <%}%>
            <div style="margin-top: 15px;">
                <%if (bnList.get(i).getUpDate()==null){%>
                <div style="width:48%;display:inline-block;text-align:left;"><a style="color:gray;">작성자 : </a><%=bnList.get(i).getUserName()%></div>
                <div style="width:48%;display:inline-block;text-align:right;"><a style="color:gray;"><i class="fas fa-heart" style="color:#DC3545;"> <%=bnList.get(i).getLike()%></i>
                    작성일 : </a><%=bnList.get(i).getRegDate()%></div>
                <%}else{%>
                <div style="width:48%;display:inline-block;text-align:left;"><a style="color:gray;">수정자 : </a><%=bnList.get(i).getUpId()%></div>
                <div style="width:48%;display:inline-block;text-align:right;"><a style="color:gray;"><i class="fas fa-heart" style="color:#DC3545;"> <%=bnList.get(i).getLike()%></i>
                    수정일 : </a><%=bnList.get(i).getUpDate()%></div>
                <%}%>
            </div>
            <hr>
            <div id="content" style="margin:0 auto;width:40%;margin-top:3%;margin-bottom:2%;word-break: break-all;"><%=bnList.get(i).getContents()%></div>
            <hr>
            <div id="3rep<%=i%>">
            <%int a=0;
                for (int j=0; j<Rsize ;j++){
                if(reply.get(j).getBoardSeq().equals(bnList.get(i).getBoardSeq())){
                    a++;
                    if (a==4)
                        break;
                    %>
            <div class="form-group" style="width: 90%;text-align: left;">
                <div style="width:100%;display:inline-flex;text-align:left;"><%=reply.get(j).getUserName()%><div style="font-size: x-small;margin-left: 6px;margin-top: 4px;"><%=reply.get(j).getRegDate()%></div></div>
                <div style="word-break: break-word;height: auto;margin-left: 1%;font-size: larger;">
                    <%if (reply.get(j).getUserName().equals(SS_name)){%>
                    <i class="fas fa-times-circle" id="Rdel<%=j%>" style="color: #DC3545;"></i>
                    <%}%>
                    <%=reply.get(j).getContents()%></div>
            </div>
            <% }}%>
                <%if (a>3) {%>
                <div style="font-size: small;" id="allrep<%=i%>">댓글모두보기</div>
                <%}%>
            </div>
            <div id="Arep<%=i%>" style="display: none;">
                <%for (int j=3; j<Rsize ;j++){
                        if(reply.get(j).getBoardSeq().equals(bnList.get(i).getBoardSeq())){%>
                <div class="form-group" style="width: 90%;text-align: left;">
                    <div style="width:48%;display:inline-flex;text-align:left;"><%=reply.get(j).getUserName()%><div style="font-size: x-small;margin-left: 6px;margin-top: 4px;"><%=reply.get(j).getRegDate()%></div></div>
                    <div style="word-break: break-word;height: auto;margin-left: 1%;font-size: larger;">
                        <%if (reply.get(j).getUserName().equals(SS_name)){%>
                        <i class="fas fa-times-circle" id="Rdel<%=j%>" style="color: #DC3545;"></i>
                        <%}%>
                        <%=reply.get(j).getContents()%></div>
                </div>
                <%}}%>
                <div style="font-size: small;" id="threp<%=i%>">댓글모두보기접기</div>
            </div>
            <label>
                <input class="form-control" id="mrep<%=i%>" type="text" style="width: 750px;">
            </label>
            <button id="Mrep<%=i%>" class="btn btn-info" style="margin-bottom: 5px;margin-left: -15px;">작성</button>
            <%if (like[i].equals("0")){%>
            <button id="li<%=i%>" value="0" class="btn btn-outline-danger" style="margin-bottom: 5px;border-radius: 20px;"><i id="ke<%=i%>" class="far fa-heart"> 좋아요</i></button>
            <%}else{%>
            <button id="li<%=i%>" value="1" class="btn btn-outline-danger" style="margin-bottom: 5px;border-radius: 20px;"><i id="ke<%=i%>" class="fas fa-heart"> 좋아요</i></button>
            <%}%>
        </div>
    </div><%}%>
</section>
<!-- 채팅 -->
<section id="chating" style="display: none;">
    <div class="modal-content" style="margin-top: 10px; width: 56%; min-width: 650px;height: 80vh">
        <div>
            <div id="ccon" style="padding-top: 5px;overflow-y: scroll;height: 70vh;">
                <%for (int i=0;i<Csize;i++){
                    if (SS_name.equals(Chat.get(i).getUserName())){%>
                <div class="form-group" style="width: 90%;text-align: right;">
                    <div style="width:100%;text-align:right;">
                        <%=Chat.get(i).getUserName()%></div>
                    <div style="word-break: break-word;height: auto;font-size: larger;"><%=Chat.get(i).getContents()%></div>
                </div>
                <%}else{%>
                <div class="form-group" style="width: 90%;text-align: left;">
                    <div style="width:100%;"><%=Chat.get(i).getUserName()%></div>
                    <div style="word-break: break-word;height: auto;font-size: larger;"><%=Chat.get(i).getContents()%></div>
                </div>
                <%}}%>

            </div>
        </div>
        <div style="margin-top: 3%;">
            <label>
                <input class="form-control" id="Chatcon" type="text" style="width: 750px;">
            </label>
            <button id="MChat" class="btn btn-info" style="margin-bottom: 5px;margin-left: -15px;">전송</button>
        </div>
    </div>
</section>
<!-- 게시글 만들기 창 -->
<div class="modal fade" id="MakeModal" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form method="POST"id="make" class="needs-validation" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">게시글 쓰기</h5>
                    <button type="button" id="LC" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <textarea style="height: 200px;" class="form-control" id="Ncontents" name="Ncontents" placeholder="내용을 입력해 주세요."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" id="MN" type="button">작성하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 게시글 수정 창 -->
<%for(int i=0;i<Nsize;i++){%>
<div class="modal fade" id="Nmod<%=i%>" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form method="POST" class="needs-validation" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title">글 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <textarea style="height: 200px;" class="form-control" id="Mcontents<%=i%>"><%=bnList.get(i).getContents()%></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" id="BMB<%=i%>" type="button">수정하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%}%>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/stylish-portfolio.min.js"></script>
<script>
    /*채팅*/
    $('#MChat').click(function () {
        if ($("#Chatcon").val()=="")
            alert("내용을 입력해주세요.");
        else {
            $.ajax({
                url: "/writechat.do",
                type: "POST",
                data: {
                    "contents": $("#Chatcon").val(),
                    "group": '<%=gDTO.getGroupSeq()%>'
                },
                success: function (data) {
                    console.log(data)
                    window.location.reload();
                }
            })
        }
    });
    /*채팅이동*/
    $('#chat').click(function () {
        $('#board').attr('style','display:none');
        $('#chat').attr('style','display:none');
        $('#goboard').attr('style','display:inline-block');
        $('#chating').attr('style','display:block');
        $('#ccon').scrollTop($('#ccon')[0].scrollHeight);
    });
    $('#goboard').click(function () {
        $('#board').attr('style','display:block');
        $('#chat').attr('style','display:inline-block');
        $('#goboard').attr('style','display:none');
        $('#chating').attr('style','display:none');
    });
    $(document).ready(function() {
        // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
        const floatPosition = parseInt($(".floatMenu").css('top'));
        // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
        $(window).scroll(function() {
            // 현재 스크롤 위치를 가져온다.
            const scrollTop = $(window).scrollTop();
            const newPosition = scrollTop + floatPosition + "px";
            /* 애니메이션 없이 바로 따라감
             $("#floatMenu").css('top', newPosition);
             */
            $(".floatMenu").stop().animate({
                "top" : newPosition
            }, 500);
        }).scroll();
    });
    /*좋아요개수 수정*/
    <%for(int i=0;i<Nsize;i++){%>
    $('#li<%=i%>').click(function () {
        if ($('#li<%=i%>').val() === "0"){
            $('#ke<%=i%>').removeClass('far');
            $('#ke<%=i%>').addClass('fas');
            $('#li<%=i%>').attr('value', '1');
            $.ajax({
                url : "/like.do",
                type : 'POST',
                data :{
                    seq : <%=bnList.get(i).getBoardSeq()%>,
                    like : <%=bnList.get(i).getLike()%>,
                    a:'1'
                },success : function (data) {
                    if (data===1)
                        console.log("좋아요증가")
                    window.location.reload();
                }

            })
        }
        else {
            $('#ke<%=i%>').removeClass('fas');
            $('#ke<%=i%>').addClass('far');
            $('#li<%=i%>').attr('value', '0')
            $.ajax({
                url : "/like.do",
                type : 'POST',
                data :{
                    seq : <%=bnList.get(i).getBoardSeq()%>,
                    like : <%=bnList.get(i).getLike()%>,
                    a:'0'
                },success : function (data) {
                    if (data===1)
                        console.log("좋아요감소")
                    window.location.reload();
                }

            })
        }
    });
    <%}%>
    /*클릭시 할일한일 뒤집기*/
    $('#add1,#add').click(function() {
        $(this).closest('.flip-container').toggleClass('hover');
        $(this).css('transform, rotateY(180deg)');
    });
    /*게시글추가*/
    $('#MN').click(function () {
        if ($("#Ncontents").val()===""){
            alert("내용을 입력해주세요.");
            return false;
        }
        else {
            $.ajax({
                url: "/writework.do",
                type: "POST",
                data: {
                    "contents": $("#Ncontents").val(),
                    "seq": <%=gDTO.getGroupSeq()%>,
                    "group": '<%=gDTO.getGroupName()%>',
                    "n" : '1'
                },
                success: function (data) {
                    if (data === 1)
                        alert("게시글이 추가되었습니다.");
                    window.location.reload(true);
                }
            })
        }
    });
    /*댓글추가*/
    <%for(int i=0;i<Nsize;i++){%>
    $('#Mrep<%=i%>').click(function () {
        if ($("#mrep<%=i%>").val()===""){
            alert("댓글을 입력해주세요.");
            return false;
        }
        else {
            $.ajax({
                url: "/writerep.do",
                type: "POST",
                data: {
                    "contents": $("#mrep<%=i%>").val(),
                    "seq": <%=bnList.get(i).getBoardSeq()%>,
                    "group": '<%=gDTO.getGroupSeq()%>'
                },
                success: function (data) {
                    console.log(data)
                    if (data === 1)
                        alert("댓글이 입력되었습니다.");
                    window.location.reload(true);

                }
            })
        }
    });
    /*댓글모두보기*/
    $('#allrep<%=i%>').click(function () {
        $('#allrep<%=i%>').attr('style','display:none;')
        $('#Arep<%=i%>').attr('style','display:block;')
    })
    $('#threp<%=i%>').click(function () {
        $('#allrep<%=i%>').attr('style','display:block;')
        $('#Arep<%=i%>').attr('style','display:none;')
    })
    /*게시글 수정*/
    $('#BMB<%=i%>').click(function () {

        const Mcontents =$(`#Mcontents<%=i%>`).val();
        console.log(Mcontents+`/<%=bnList.get(i).getContents()%>`);
        if (Mcontents===""){
            alert("수정하실 내용을 입력해 주세요.")
        }else if (Mcontents==`<%=bnList.get(i).getContents()%>`){
            alert("내용을 수정해 주세요.")
        }
        else{
            $.ajax({
                url: "/ModNotice.do",
                type: "POST",
                data:{
                    "seq" : '<%=bnList.get(i).getBoardSeq()%>',
                    "contents" : Mcontents
                },
                success: function (data) {
                    console.log(data)
                    if (data===1) {
                        alert("게시글이 수정되었습니다.");
                        window.location.reload(true);
                    }
                }
            })
        }
    });
    <%}%>
    <%for (int j = 0; j<reply.size();j++){%>
    /*댓글삭제*/
    $('#Rdel<%=j%>').click(function () {
        const res = confirm("선택하신 댓글을 지우시겠습니까?")
        if (res){
            $.ajax({
                url:"/delrep.do",
                type : 'POST',
                data: {
                    seq: <%=reply.get(j).getRep()%>
                },success : function (data) {
                    if (data===1)
                        alert('댓글이 삭제되었습니다.')
                    window.location.reload(true);
                }
            })
        }
    })
    <%}%>
    /*할일추가*/
    $('#add2').click(function () {
        if ($("#contents").val()===""){
            alert("할 일을 입력해주세요.");
            return false;
        }
        else {
            $.ajax({
                url: "/writework.do",
                type: "POST",
                data: {
                    "contents": $("#contents").val(),
                    "seq": <%=gDTO.getGroupSeq()%>,
                    "group": '<%=gDTO.getGroupName()%>',
                    "n" : '2'
                },
                success: function (data) {
                    if (data === 1)
                        alert("할일이 추가되었습니다.");
                    window.location.reload(true);
                }
            })
        }
    });
    /*한일로 변경*/
    $('#finish').click(function () {
        let seq=[];
        let checked=0;
        for (let i=0;i<<%=bwList.size()%>;i++){
            if ($('#do'+i).prop("checked")){
                seq[checked]=$('#do'+i).val();
                checked++;
            }
        }
        console.log(seq.join(","))
        if (seq.length<1)
            alert("한일로 변경할 항목을 선택해주세요.");
        else{
            $.ajax({
                url: "/finwork.do",
                type: "POST",
                data:{
                    "seq" : seq.join(",")
                },
                success: function (data) {
                    console.log(data)
                    if (data===1) {
                        alert("한일로 변경되었습니다.");
                        window.location.reload(true);
                    }
                }
            })
        }
    });
    /*할일삭제*/
    $('#del').click(function () {
        let seq=[];
        let checked=0;
        for (let i=0;i<<%=bwList.size()%>;i++){
            if ($('#do'+i).prop("checked")){
                seq[checked]=$('#do'+i).val();
                checked++;
            }
        }
        console.log(seq.join(","))
        if (seq.length<1)
            alert("삭제할 항목을 선택해주세요.");
        else{
            $.ajax({
                url: "/delwork.do",
                type: "POST",
                data:{
                    "seq" : seq.join(",")
                },
                success: function (data) {
                    console.log(data)
                    if (data===1) {
                        alert("할일이 삭제되었습니다.");
                        window.location.reload(true);
                    }
                }
            })
        }
    });
    /*한일삭제*/
    $('#dele').click(function () {
        let seq=[];
        let checked=0;
        for (let i=0;i<<%=bfList.size()%>;i++){
            if ($('#done'+i).prop("checked")){
                seq[checked]=$('#done'+i).val();
                checked++;
            }
        }
        console.log(seq.join(","))
        if (seq.length<1)
            alert("삭제할 항목을 선택해주세요.");
        else{
            $.ajax({
                url: "/delwork.do",
                type: "POST",
                data:{
                    "seq" : seq.join(",")
                },
                success: function (data) {
                    console.log(data)
                    if (data===1) {
                        alert("한일이 삭제되었습니다.");
                        window.location.reload(true);
                    }
                }
            })
        }
    });
    /*게시글 삭제*/
    <%for(int i=0;i<Nsize;i++){%>
    $('#Ndel<%=i%>').click(function () {
        if(confirm("글을 지우시겠습니까?")){
            $.ajax({
                url: "/delwork.do",
                type: "POST",
                data:{
                    "seq" : <%=bnList.get(i).getBoardSeq()%>
                },
                success: function (data) {
                    console.log(data)
                    if (data===1) {
                        alert("게시글이 삭제되었습니다.");
                        window.location.reload(true);
                    }
                }
            })
        }
    });
    <%}%>
</script>
</body>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script>
</html>