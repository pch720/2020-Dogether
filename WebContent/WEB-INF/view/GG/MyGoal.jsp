<%@ page import="poly.dto.GroupDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<GroupDTO> gList = (List<GroupDTO>)request.getAttribute("gList");
    int size = gList.size();
    int a=size/2;
    if (a<4)
        a=size;
    else if (size<10)
        a=4;
    String SS_name = (String)session.getAttribute("SS_USER_NAME");
%>
<html lang="en">
<head>

    <style>
        .TitlePadding{
            padding-left: 10% !important;
            padding-right: 10% !important;
        }
        .GAH{
            height: 43.5vh;
            min-height: 435px;
        }
        .GA{
            font-size: xx-large !important;
            margin-bottom: 1%;
            margin-top: 0.5%;
        }
        .PTS{
            width: 100%;
            margin-top: .25rem;
            font-size: 80%;
            color: #dc3545;
            display: none;
        }
        .Lcount{
            text-align: end;
            font-size: small;
            margin-bottom: -3%;
            margin-right: 2%;
        }
    </style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>내 목표</title>

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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<body class="bg-warning" style="height: auto">

<!-- 네비게이션바 -->
<%@include file="../include/nav.jsp"%>

<!-- 내 목표 -->
<section class="text-white TitlePadding GAH" style="margin-top: 98px;">
    <a class="navbar-brand GA" >My Goal</a>
    <div style="display: flex;" class="PG">
    <ul class="a">
        <li>
            <figure class="snip1200">
                <img src="/img/black.jpg" alt="sq-sample27" />
                <figcaption>
                    <p>새로운 목표를 만들고 활동해 보세요.
                        <br><br><i class="fas fa-plus-circle" style="font-size: xxx-large;"></i></p>
                    <div class="heading">
                        <h2>목표<span> 만들기</span></h2>
                    </div>
                </figcaption>
                <a href="#" data-toggle="modal" data-target="#MakeModal"></a>
            </figure>
        </li>
        <% for(int i=0; i<a;i++){%>
        <li>
            <figure class="snip1200">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
                <figcaption>
                    <%if(gList.get(i).getGreeting().equals("")){%>
                    <p>따로 입력된 <br>그룹의 설명이 없습니다.</p>
                    <%}else{%>
                    <p><%=gList.get(i).getGreeting()%></p>
                    <%}%>
                    <div class="heading">
                        <%if(gList.get(i).getGroupName().length()<6){%>
                        <h2>Do<span><%=gList.get(i).getGroupName()%></span></h2>
                        <%}else{%>
                        <h2>Do<span><%=gList.get(i).getGroupName().substring(0,5)%>...</span></h2>
                        <%}%>
                    </div>
                </figcaption>
                <a href="#" data-toggle="modal" data-target="#G<%=i%>"></a>
            </figure>
        </li>
        <%}%>
    </ul>
</div>
    <div style="display: flex;" class="PG">
        <ul class="a">
            <% for(int i=a; i<size;i++){%>
            <li>
                <figure class="snip1200">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
                    <figcaption>
                        <%if(gList.get(i).getGreeting().equals("")){%>
                        <p>따로 입력된 <br>그룹의 설명이 없습니다.</p>
                        <%}else{%>
                        <p><%=gList.get(i).getGreeting()%></p>
                        <%}%>
                        <div class="heading">
                            <%if(gList.get(i).getGroupName().length()<6){%>
                            <h2>Do<span><%=gList.get(i).getGroupName()%></span></h2>
                            <%}else{%>
                            <h2>Do<span><%=gList.get(i).getGroupName().substring(0,5)%>...</span></h2>
                            <%}%>
                        </div>
                    </figcaption>
                    <a href="#" data-toggle="modal" data-target="#G<%=i%>"></a>
                </figure>
            </li>
            <%}%>
        </ul>
    </div>
</section>
<!-- 목표 들어가기 및 목표 탈퇴 창 -->
<% for(int i=0; i<gList.size();i++){%>
<div class="modal fade" id="G<%=i%>" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="/Delgu.do" method="POST" class="needs-validation" onsubmit="return Del()" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title"><%=gList.get(i).getGroupName()%></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <input type="hidden" name="count" value="<%=gList.get(i).getCount()%>">
                <input type="hidden" name="Gname" value="<%=gList.get(i).getGroupName()%>">
                <input type="hidden" name="user" value="<%=SS_name%>">
                <div class="modal-body">
                    <button type="button" class="btn btn-primary MB" onclick="location.href='Group.do?seq=<%=gList.get(i).getGroupSeq()%>'">목표로 가기</button>
                    <button class="btn btn-danger MB" type="submit" >목표 그만두기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%}%>
<!-- 목표 만들기 창 -->
<div class="modal fade" id="MakeModal" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="/MakeGroup.do" method="POST"id="make" class="needs-validation" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">목표 만들기</h5>
                    <button type="button" id="LC" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <input type="text" class="form-control" id="Gname" name="gname" placeholder="목표의 이름을 입력해주세요." maxlength="20">
                        <input hidden="hidden" />
                        <div id="Gl" class="Lcount">
                            (0/20)
                        </div>
                        <div id="nGname" class="PTS">
                            목표의 이름을 입력해주세요.
                        </div>
                        <div id="jbGname" class="PTS">
                            이미 사용중인 목표입니다.
                        </div>
                    </div>
                    <input type="hidden" value="1" name="function">
                    <div class="mb-3">
                        <textarea class="form-control" id="Greet" name="greet" placeholder="목표에 대한 설명을 자유롭게 작성해주세요.(선택)"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" id="MG" type="button">만들기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function Del() {
        const res = confirm("탈퇴 하시겠습니까?")
        if (!res)
            return false;
    }
    const Gname = $('#Gname');
    let a=0;
    function m(){
        $.ajax({
            url : "/Gncheck.do",
            type : 'POST',
            data : {"Gname":Gname.val()},
            success: function (data) {
                if (data=="1"){
                    $('#jbGname').attr('style','display:block');
                    $('#nGname').attr('style','display:none');
                    Gname.removeClass("is-valid");
                    Gname.addClass("is-invalid");
                    a=0;
                }else{
                    if (Gname.val().length<1){
                        $('#jbGname').attr('style','display:none');
                        $('#nGname').attr('style','display:block');
                        Gname.removeClass("is-valid");
                        Gname.addClass("is-invalid");
                        a=0;
                    }else{
                        $('#nGname').attr('style','display:none');
                        $('#jbGname').attr('style','display:none');
                        Gname.removeClass("is-invalid");
                        Gname.addClass("is-valid");
                        a=1;
                    }
                }
            }
        });
    }
    $('#LC').click(function () {
        const res=confirm("목표 만들기 창을 닫으시면 입력하신 정보가 초기화됩니다.\n정말 닫으시겠습니까?")
        if(res){
            document.getElementById('Gname').value = '';
            document.getElementById('Greet').value = '';
            Gname.removeClass("is-valid");
            Gname.removeClass("is-invalid");
            $('#jbGname').attr('style','display:none');
            $('#nGname').attr('style','display:none');
            document.getElementById('Gl').innerHTML = '(0/20)';
        }else
            return false;
    });
    Gname.keyup(function () {
        const Glength = Gname.val().length;
        document.getElementById('Gl').innerHTML = '(' + Glength + '/20)';
        m();
    });
    $('#MG').click(function () {
        m();
        if(a===0)
            return false;
        else
            $('#make').submit();
    })
</script>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/stylish-portfolio.min.js"></script>
<script src="/js/scroll.js"></script>
</body>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script></body>
</html>