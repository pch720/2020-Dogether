<%@ page import="poly.dto.GroupDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="poly.dto.BoardDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
    Date time = new Date();
    //String time1 = format1.format(time);
    GroupDTO gDTO = (GroupDTO) request.getAttribute("gDTO");
    List<BoardDTO> bfList = (List<BoardDTO>) request.getAttribute("bfList");
    int Fsize = bfList.size();
    List<BoardDTO> bwList = (List<BoardDTO>) request.getAttribute("bwList");
    int Wsize = bwList.size();
    List<GroupDTO> user = (List<GroupDTO>)request.getAttribute("user");
    String SS_name =(String)session.getAttribute("SS_USER_NAME");
    int pst = 0;
    if (Wsize==0&&Fsize==0)
        pst=0;
    else
        pst=Fsize*100/(Wsize+Fsize);
%>
<html>
<head>
    <meta charset='utf-8' />
    <link href='../packages/core/main.css' rel='stylesheet' />
    <link href='../packages/daygrid/main.css' rel='stylesheet' />
    <link href='../packages/timegrid/main.css' rel='stylesheet' />
    <script src='../packages/core/main.js'></script>
    <script src='../packages/interaction/main.js'></script>
    <script src='../packages/daygrid/main.js'></script>
    <script src='../packages/timegrid/main.js'></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const calendarEl = document.getElementById('calendar');
            let today = new Date();
            const calendar = new FullCalendar.Calendar(calendarEl, {
                plugins: ['interaction', 'dayGrid', 'timeGrid'],
                header: {
                    left: 'today prev',
                    center: 'title',
                    right : 'next today'
                },
                defaultDate: today,
                navLinks: false, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                select: function (arg) {
                    function x(data) {
                        let res=data.getFullYear();
                        let month = data.getMonth()*1+1;
                        if(month<10){
                            res += "-0" + month;
                        }else{
                            res += "-" + month;
                        }
                        if(data.getDate()<10){
                            res += "-0" +data.getDate();
                        }else{
                            res += "-" +data.getDate();
                        }
                        return res;
                    }
                    const start = x(arg.start);
                    const end = x(arg.end);
                    today = x(today);
                    const title = prompt('추가하실 일에 내용을 적어주세요.');
                    if (title) {
                        add3(title,start,end);
                    }
                    window.location.reload(true);
                    calendar.unselect()
                },
                locale:'ko',
                editable: false,
                eventLimit: true, // allow "more" link when too many events
                events: [
                    <%for (int i=0;i<Fsize;i++){%>
                    {
                        title: '<%=bfList.get(i).getContents()%>(끝난 일입니다.)',
                        color : "#ECB807",
                        textColor : "#FFFFFF",
                        <%if (bfList.get(i).getStDt().equals("")){%>
                        start: '<%=bfList.get(i).getRegDate()%>',
                        <%}else {%>
                        start: '<%=bfList.get(i).getStDt()%>',
                        <%}%>
                        end: '<%=bfList.get(i).getFinDt()%>'
                    },
                    <%}%>
                    <%for (int i=0;i<Wsize;i++){%>
                    {
                        <%if (bwList.get(i).getStDt().equals("")){%>
                        title: '<%=bwList.get(i).getContents()%>(기한이 없습니다.)',
                        color : "#FF69B4",
                        textColor : "#FFFFFF",
                        <%}else if (format1.parse(bwList.get(i).getStDt()).compareTo(time)==1){%>
                        title: '<%=bwList.get(i).getContents()%>(할 예정입니다.)',
                        color : "#00CCCC",
                        textColor : "#FFFFFF",
                        <%}else if (time.compareTo(format1.parse(bwList.get(i).getFinDt()))!=1){%>
                        title: '<%=bwList.get(i).getContents()%>(하는중입니다.)',
                        color : "#11AAFF",
                        textColor : "#FFFFFF",
                        <%}else {%>
                        title: '<%=bwList.get(i).getContents()%>(예정된 날보다 늦어지고 있습니다.)',
                        color : "#DC3545",
                        textColor : "#FFFFFF",
                        <%}%>
                        <%if (bwList.get(i).getStDt().equals("")){%>
                        start: '<%=bwList.get(i).getRegDate()%>',
                        <%}else {%>
                        start: '<%=bwList.get(i).getStDt()%>',
                        end: '<%=bwList.get(i).getFinDt()%>'
                        <%}%>
                    }<%if (i==Wsize-1)
                        break;%>
                    ,
                    <%}%>
                ]
            });

            calendar.render();
        });

    </script>
    <style>
        .TitlePadding{
            padding-left: 10% !important;
            padding-right: 10% !important;
        }
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1.3%;
            background-color: whitesmoke;
        }

    </style>

    <style>
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
        .progba{
            width: 56%;
            height: 30px !important;
            border-radius: 15px !important;
            margin-bottom: 1%;
        }
    </style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>나의 진행 상황</title>

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
<body class="bg-primary" style="height: auto;">
<!-- 네비게이션바 -->
<%@include file="../include/nav.jsp"%>
<div class="floatMenu Menu1" style="z-index: 100;">
    <%--떠다니는 진행상황--%>
    <div class="modal-content">
        <div class="modal-body" style="text-align: center;">
            <a href="/Group.do?seq=<%=gDTO.getGroupSeq()%>" class="btn btn-primary" type="button">그룹 게시글 보기</a>
        </div>
    </div>
    <%--떠다니는 그룹원--%>
    <div class="modal-content Menu3">
        <div class="modal-header" style="justify-content: center;">
            <h5 class="modal-title"><%=gDTO.getGroupName()%>(<%=gDTO.getCount()%>명)</h5>
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
<%--일진행바--%>
<div style="margin-top: 130px;text-align: -webkit-center;">
    <div class="progress progba">
        <div class="progress-bar progress-bar-striped bg-warning" role="progressbar" style="width: <%=pst%>%;color: teal;" aria-valuenow="<%=pst%>" aria-valuemin="0" aria-valuemax="100"><%=pst%>%</div>
    </div>
</div>
<%--달력--%>
<div id='calendar'></div>

<script>
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
    /*클릭시 할일한일 뒤집기*/
    $('#add1,#add').click(function() {
        $(this).closest('.flip-container').toggleClass('hover');
        $(this).css('transform, rotateY(180deg)');
    });
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
    function add3(contents,start,end){
        $.ajax({
            url: "/writework.do",
            type: "POST",
            data: {
                "contents": contents,
                "seq": <%=gDTO.getGroupSeq()%>,
                "group": '<%=gDTO.getGroupName()%>',
                "end":end,
                "start":start,
                "n" : '2'
            },
            success: function (data) {
                if (data === 1)
                    alert("할일이 추가되었습니다.");
                window.location.reload(true);
            }
        })
    }
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
</script>
</body>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script>
</html>
