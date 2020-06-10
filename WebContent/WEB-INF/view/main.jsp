<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            max-height: 500px;
        }
        .GA{
            font-size: xx-large !important;
            margin-bottom: 1%;
            margin-top: 0.5%;
        }
        div.PG ul {
            display: block;
            white-space: nowrap;
            height: 300px;
            overflow-y: hidden;
            overflow-x: hidden;
            padding: 0;
            font-size: 0;
        }

        div.PG li {
            box-sizing: border-box;
            height: 300px;
            width: 300px;
            display: inline-block;
            margin-right: 5px;
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
<body id="page-top" style="height: auto;">

<!-- 네비게이션바 -->
<%@include file="include/nav.jsp"%>

<!-- 내 그룹 -->
<section class="bg-primary text-white TitlePadding GAH" style="margin-top: 98px;">
    <a class="navbar-brand GA" >Popular Group</a>
    <div style="display: flex;"class="PG">
        <ul class="a">
        <% for(int i=0; i<10;i++){%>
            <li>
            <figure class="snip1200">
    <img src="../../img/bg-masthead.jpeg" style="width: 300px;height: 300px;" alt="sq-sample27" />
    <figcaption>
        <p>클릭 후 자세한 내용을 확인하세요.</p>
        <div class="heading">
            <h2>Do<span> 토익 공부</span></h2>
        </div>
    </figcaption>
    <a href="#" data-toggle="modal" data-target="#TogetherModal"></a>
    </figure>
            </li>
        <%}%>
        </ul>
    </div>
</section>
<section class="text-white TitlePadding GAH" style="background: #EEFF55">
    <a class="navbar-brand GA">Popular Goal</a>
    <div style="display: flex;"class="PG">
        <ul class="a">
            <% for(int i=0; i<10;i++){%>
            <li>
                <figure class="snip1200">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
                    <figcaption>
                        <p>클릭 후 자세한 내용을 확인하세요.</p>
                            <div class="heading">
                            <h2>Do<span> 토익 공부</span></h2>
                        </div>
                    </figcaption>
                    <a href="#" data-toggle="modal" data-target="#TogetherModal"></a>
                </figure>
            </li>
            <%}%>
        </ul>
    </div>
</section>

<!-- 가입 창 -->
<div class="modal fade" id="TogetherModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="#" method="POST" class="needs-validation" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title">토익 공부</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="text-align: center;">
                    <h5 style="font-size: 100%;font-weight: 400;">토익 공부를 하기위해 만들어진 그룹입니다.</h5>
                    <button type="button" class="btn btn-secondary MB" onclick="return Greg()">10명과 함께하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/stylish-portfolio.min.js"></script>
<script src="js/index.js"></script>
<script>
    let diff = 0;
    let ticking = false;

    const wheelEvent = 'onwheel' in document.createElement("div") ? 'wheel' : 'mousewheel';

    const list = document.querySelector('.a');

    function doSomething(diff) {
        list.scrollLeft += (diff);
    }

    list.addEventListener('wheel', function(e) {
        diff = e.deltaY;
        if (!ticking) {
            window.requestAnimationFrame(function() {
                doSomething(diff);
                ticking = false;
            });
        }
        ticking = true;
    }, { passive: true });

    $(".a").on('mousewheel',function(e){

        var wheelDelta = e.originalEvent.wheelDelta;

        if(wheelDelta > 0){

            console.log("up");

            $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

        }else{

            console.log("down");

            $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

        }

    });
function Greg() {
    const res = confirm("그룹에 가입하시겠습니까?")
    if(res) {
        alert("가입되셨습니다.")
    }else
        alert("가입이 취소되었습니다.")
}

</script>
</body>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script></body>
</html>