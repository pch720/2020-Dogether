<%@ page import="poly.dto.GroupDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<GroupDTO> grList = (List<GroupDTO>)request.getAttribute("grList");
    List<GroupDTO> goList = (List<GroupDTO>)request.getAttribute("goList");
    String SS_name = (String)session.getAttribute("SS_USER_NAME");
%>
<html lang="en">
<head>

    <style>
        #wordcloud-wrapper{
            width: 100%;
            height: 500px;
        }
        .TitlePadding{
            padding-left: 10% !important;
            padding-right: 10% !important;
        }
        .GAH{
            height: 43.5vh;
            min-height: 435px;
            max-height: 500px;
        }
        .GA{
            font-size: xx-large !important;
            margin-bottom: 1%;
            margin-top: 0.5%;
        }.MB{
             width: 100% !important;
             height: auto !important;
         }
    </style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>메인페이지</title>

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
<!-- amchart -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<body id="page-top" style="height: auto;">

<!-- 네비게이션바 -->
<%@include file="include/nav.jsp"%>

<!-- 인기그룹 -->
<section class="bg-primary text-white TitlePadding GAH" style="margin-top: 98px;">
    <a class="navbar-brand GA" >Popular Group</a>
    <div style="display: flex;"class="PG">
        <ul class="a">
        <% if (grList!=null){
            for(int i=0; i<grList.size();i++){%>
            <li>
            <figure class="snip1200">
    <img src="../../img/bg-masthead.jpeg" style="width: 300px;height: 300px;" alt="sq-sample27" />
    <figcaption>
        <p>클릭 후 자세한 내용을 확인하세요.</p>
        <div class="heading">
            <%if(grList.get(i).getGroupName().length()<6){%>
            <h2>Do<span><%=grList.get(i).getGroupName()%></span></h2>
            <%}else{%>
            <h2>Do<span><%=grList.get(i).getGroupName().substring(0,5)%>...</span></h2>
            <%}%>
        </div>
    </figcaption>
    <a href="#" id="group<%=i%>" data-toggle="modal" data-target="#grModal<%=i%>"></a>
    </figure>
            </li>
        <%}}else{%>
            아직 그룹이 없습니다.
            <%}%>
        </ul>
    </div>
</section>
<%--인기목표--%>
<section class="bg-warning text-white TitlePadding GAH">
    <a class="navbar-brand GA">Popular Goal</a>
    <div style="display: flex;"class="PG">
        <ul class="a">
            <% if (!goList.equals("")){
                for(int i=0; i<goList.size();i++){%>
            <li>
                <figure class="snip1200">
                    <img src="/img/black.jpg" alt="sq-sample27" />
                    <figcaption>
                        <p>클릭 후 자세한 내용을 확인하세요.</p>
                            <div class="heading">
                                <%if(goList.get(i).getGroupName().length()<6){%>
                                <h2>Do<span><%=goList.get(i).getGroupName()%></span></h2>
                                <%}else{%>
                                <h2>Do<span><%=goList.get(i).getGroupName().substring(0,5)%>...</span></h2>
                                <%}%>
                        </div>
                    </figcaption>
                    <a href="#" data-toggle="modal" data-target="#goModal<%=i%>"></a>
                </figure>
            </li>
            <%}}else{%>
            아직 목표가 없습니다.
            <%}%>
        </ul>
    </div>
</section>

<!-- 그룹 가입 창 -->
<% for(int i=0; i<grList.size();i++){%>
<div class="modal fade" id="grModal<%=i%>" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="/join.do" method="POST" class="needs-validation" onsubmit="return Greg()" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title"><%=grList.get(i).getGroupName()%></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="text-align: center;">
                        <%if(grList.get(i).getGreeting().equals("")){%>
                        <h5 style="font-size: 100%;font-weight: 400;">따로 입력된 그룹의 설명이 없습니다.</h5>
                        <%}else{%>
                        <h5 style="font-size: 100%;font-weight: 400;"><%=grList.get(i).getGreeting()%></h5>
                        <%}%>
                        <div id="wordcloud-wrapper"></div>
                    <button type="submit" class="btn btn-secondary MB"><%=grList.get(i).getCount()%>명과 함께하기</button>
                    </div>
                </div>
                <input type="hidden" name="function" value="0">
                <input type="hidden" name="count" value="<%=grList.get(i).getCount()%>">
                <input type="hidden" name="name" value="<%=SS_name%>">
                <input type="hidden" name="group" value="<%=grList.get(i).getGroupName()%>">
            </form>
        </div>
    </div>
</div>
<%}%>
<!-- 목표 가입 창 -->
<% for(int i=0; i<goList.size();i++){%>
<div class="modal fade" id="goModal<%=i%>" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="/join.do" method="POST" class="needs-validation" onsubmit="return Greg()" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title"><%=goList.get(i).getGroupName()%></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="text-align: center;">
                        <%if(goList.get(i).getGreeting().equals("")){%>
                        <h5 style="font-size: 100%;font-weight: 400;">따로 입력된 목표의 설명이 없습니다.</h5>
                        <%}else{%>
                        <h5 style="font-size: 100%;font-weight: 400;"><%=goList.get(i).getGreeting()%></h5>
                        <%}%>
                        <button type="submit" class="btn btn-secondary MB"><%=goList.get(i).getCount()%>명과 함께하기</button>
                    </div>
                </div>
                <input type="hidden" name="function" value="1">
                <input type="hidden" name="count" value="<%=goList.get(i).getCount()%>">
                <input type="hidden" name="name" value="<%=SS_name%>">
                <input type="hidden" name="group" value="<%=goList.get(i).getGroupName()%>">
            </form>
        </div>
    </div>
</div>
<%}%>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/stylish-portfolio.min.js"></script>
<script src="/js/scroll.js"></script>
<script>
function Greg() {
    const res = confirm("그룹에 가입하시겠습니까?")
    if(!res)
        return false;
}
<%for(int i=0; i<grList.size();i++){%>
/*워드클라우드*/
$('#group<%=i%>').click(function () {
    console.log("<%=grList.get(i).getGroupSeq()%>번째입니다.");
    $.ajax({
        url: "/rConnect.do",
        type: "POST",
        dataType: "JSON",
        data:{
            "seq" : <%=grList.get(i).getGroupSeq()%>,
        },
        success: function (json) {
            if(json.length > 0) {
                am4core.ready(function() {
                    // Themes begin
                    am4core.useTheme(am4themes_animated);
                    // Themes end
                    const chart = am4core.create("wordcloud-wrapper", am4plugins_wordCloud.WordCloud);
                    const series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());
                    // series.labels.template.tooltipText = "{word}: {value}";
                    series.fontFamily = "";
                    series.data = json;
                    series.dataFields.word = "word";
                    series.dataFields.value = "wordCount";
                    series.fontWeight = "700"
                    series.accuracy = 4;
                    series.step = 15;
                    series.rotationThreshold = 0.7;
                    series.angles = [0,-90];
                    series.colors = new am4core.ColorSet();
                    series.colors.passOptions = {};
                    series.maxFontSize = am4core.percent(30);
                    series.randomness = 0;
                    series.events.on("arrangestarted", function(ev) {
                        ev.target.baseSprite.preloader.show(1);
                    });
                    series.events.on("arrangeprogress", function(ev) {
                        ev.target.baseSprite.preloader.progress = ev.progress;
                    });
                    $('path').hide();
                }); // end am4core.ready()
            } else {
                $("#wordcloud-wrapper").append(
                    "<div id='non-data'>등록된 프로젝트가 없습니다.</div>"
                )
                $("#non-data").css('text-align', 'center');
                $("#non-data").css('font-size', '3rem');
                $("#non-data").css('line-height', '450px');
                $("#non-data").css('color', 'gray');
            }
        },
        error: function (error) {
            alert("error : " + error);
        }
    })
})
<%}%>
</script>
</body>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script>
</html>