<%@ page import="poly.dto.GroupDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="poly.dto.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<BoardDTO> Notice = (List<BoardDTO>) request.getAttribute("Notice");
    int Nsize = Notice.size();
    String SS_name =(String)session.getAttribute("SS_USER_NAME");
%>
<html lang="en">
<head>
    <style>
        .TitlePadding{
            padding-left: 10% !important;
            padding-right: 10% !important;
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

    <title>공지사항</title>

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

<body id="page-top" class="bg-primary" style="height: auto;">

<!-- 네비게이션바 -->
<%@include file="include/nav.jsp"%>

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

<!-- 그룹 게시판 -->
<section id="board">
    <%if (auth.equals("1")){%>
    <a href="#" class="modal-content" data-toggle="modal" data-target="#MakeModal" style="margin-top: 130px; width: 56%; height: 150px; min-width: 650px;text-decoration: none;color: black;">
    <%}else{%>
        <a id="nonMN" class="modal-content" style="margin-top: 130px; width: 56%; height: 150px; min-width: 650px;text-decoration: none;color: black;">
            <%}%>
        공지사항을 입력해 주세요.
    </a>

    <%for(int i=Nsize-1;i>-1;i--){%>
    <div class="modal-content" style="margin-top: 10px; width: 56%; min-width: 650px;">
        <div>
            <%if (auth.equals("1")){%>
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
                <%if (Notice.get(i).getUpDate()==null){%>
                <div style="width:48%;display:inline-block;text-align:left;"><a style="color:gray;">작성자 : </a><%=Notice.get(i).getUserName()%></div>
                <div style="width:48%;display:inline-block;text-align:right;"><a style="color:gray;">
                    작성일 : </a><%=Notice.get(i).getRegDate()%></div>
                <%}else{%>
                <div style="width:48%;display:inline-block;text-align:left;"><a style="color:gray;">수정자 : </a><%=Notice.get(i).getUpId()%></div>
                <div style="width:48%;display:inline-block;text-align:right;"><a style="color:gray;">
                    수정일 : </a><%=Notice.get(i).getUpDate()%></div>
                <%}%>
            </div>
            <hr>
            <div id="content" style="margin:0 auto;width:40%;margin-top:3%;margin-bottom:2%;word-break: break-all;"><%=Notice.get(i).getContents()%></div>
            <hr>
        </div>
    </div>
    <%}%>
</section>

<!-- 게시글 수정 창 -->
<%for( int i=0;i<Nsize;i++){%>
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
                        <textarea style="height: 200px;" class="form-control" id="Mcontents<%=i%>"><%=Notice.get(i).getContents()%></textarea>
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

    /*게시글추가*/
    $('#nonMN').click(function () {
        alert("공지사항은 관리자만 작성할 수 있슴니다.")
    })
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
                    "seq": '0',
                    "group": '0',
                    "n" : '0'
                },
                success: function (data) {
                    if (data === 1)
                        alert("게시글이 추가되었습니다.");
                    window.location.reload(true);
                }
            })
        }
    });

    <%for(int i=0;i<Nsize;i++){%>
    /*게시글 수정*/
    $('#BMB<%=i%>').click(function () {

        const Mcontents =$(`#Mcontents<%=i%>`).val();
        console.log(Mcontents+`/<%=Notice.get(i).getContents()%>`);
        if (Mcontents===""){
            alert("수정하실 내용을 입력해 주세요.")
        }else if (Mcontents==`<%=Notice.get(i).getContents()%>`){
            alert("내용을 수정해 주세요.")
        }
        else{
            $.ajax({
                url: "/ModNotice.do",
                type: "POST",
                data:{
                    "seq" : '<%=Notice.get(i).getBoardSeq()%>',
                    "contents" : Mcontents,
                    "n": "1"
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

    /*게시글 삭제*/
    <%for(int i=0;i<Nsize;i++){%>
    $('#Ndel<%=i%>').click(function () {
        if(confirm("글을 지우시겠습니까?")){
            $.ajax({
                url: "/delwork.do",
                type: "POST",
                data:{
                    "seq" : <%=Notice.get(i).getBoardSeq()%>,
                    "n" : "1"
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