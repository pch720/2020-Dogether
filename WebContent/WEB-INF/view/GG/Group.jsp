<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

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
             right: 5%;
             top: 10px;
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<body id="page-top" style="background-color: deepskyblue;">

<!-- 네비게이션바 -->
<%@include file="../include/nav.jsp"%>
<%--떠다니는 메뉴1--%>
    <div class="floatMenu Menu1">
        <div class="modal-content">
                <div class="modal-header" style="justify-content: center;">
                    <h5 class="modal-title">토익공부(10명)</h5>
                </div>
                <div class="modal-footer" style="justify-content: center;">
                    <button class="btn btn-secondary" type="button">현재 진행 상황 확인</button>
                </div>
        </div>
    </div>
<%--떠다니는 메뉴2--%>
<div class="floatMenu Menu2">
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

<!-- 그룹컨텐츠 -->
<section style="text-align: -webkit-center">
    <<a href="#" class="modal-content" style="margin-top: 100px; width: 56%; height: 150px; min-width: 650px;text-decoration: none;color: black;">
    내용을 입력해 주세요.
    </a>
    <%for(int i=0;i<10;i++){%>
    <div class="modal-content" style="margin-top: 10px; width: 56%; min-width: 650px;">
        <div>
            <div style="text-align:right;">
                <!-- Default dropright button -->
                <div class="btn-group dropright">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-top: 5px; margin-right: 5px;">
                        더보기
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">수정</a>
                        <a class="dropdown-item" href="#">삭제</a>
                    </div>
                </div>
            </div>
            <hr>
            <div>
                <div style="width:48%;display:inline-block;text-align:left;"><a style="color:gray;">작성자 : </a>유동현</div>
                <div style="width:48%;display:inline-block;text-align:right;"><a style="color:gray;">작성일 : </a>2020-02-02</div>
            </div>
            <hr>
            <div id="content" style="margin:0 auto;width:40%;margin-top:3%;margin-bottom:2%;">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
            <hr>
            <button id="li" value="0"class="btn btn-outline-danger" style="margin-bottom: 5px;border-radius: 20px;"><i class="fas fa-heart"> 좋아요</i></button>
            <button class="btn btn-outline-info" style="margin-bottom: 5px;border-radius: 20px;">댓글 달기</button>
        </div>
    </div><%}%>
</section>
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
    $('#li').click(function () {
        if ($('#li').val() === "0"){
            $('#li').attr('class', 'btn btn-danger')
            $('#li').attr('value', '1')
        }
        else {
            $('#li').attr('class', 'btn btn-outline-danger')
            $('#li').attr('value', '0')
        }
    })
</script>
</body>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script></body>
</html>