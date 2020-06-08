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
        }
        .GA{
            font-size: xx-large !important;
            margin-bottom: 1%;
            margin-top: 0.5%;
        }
    </style>

    <script>
        $(".hover").mouseleave(
            function () {
                $(this).removeClass("hover");
            }
        );
    </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>내 그룹</title>

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
<body id="page-top">

<!-- Navigation -->
<nav class="TitlePadding navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/main.do" style="color: #ecb807;font-weight: 700;font-size: -webkit-xxx-large;">Dogether</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="justify-content: flex-end;">
        <ul class="navbar-nav mr-2">
            <li class="nav-item">
                <a class="nav-link active" href="#">내 그룹</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">내 목표</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">공지사항</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    마이메이지
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">회원정보 수정</a>
                    <a class="dropdown-item" href="#">그룹 및 목표 확인</a>
                    <a class="dropdown-item" href="/logout.do">로그아웃</a>
                    <a class="dropdown-item" href="#">회원탈퇴</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<!-- 내 그룹 -->
<section class="bg-primary text-white TitlePadding GAH" style="height: 94.5vh;">
    <a class="navbar-brand GA" >My Group</a>
    <div style="display: flex;">
        <figure class="snip1200">
            <figcaption>
                <p>새로운 그룹을 만들고 활동해 보세요.
                    <br><br><i class="fas fa-plus-circle" style="font-size: xxx-large;"></i></p>
                <div class="heading">
                    <h2>그룹<span> 만들기</span></h2>
                </div>
            </figcaption>
            <a href="#" data-toggle="modal" data-target="#MakeModal"></a>
        </figure>
        <% for(int i=0; i<4;i++){%>
        <figure class="snip1200">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
            <figcaption>
                <p>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</p>
                <div class="heading">
                    <h2>Do<span> 토익 공부</span></h2>
                </div>
            </figcaption>
            <a href="#"></a>
        </figure>
        <%}%>
    </div>
    <div style="display: flex;">
        <% for(int i=4; i<9;i++){%>
        <figure class="snip1200">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
            <figcaption>
                <p>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</p>
                <div class="heading">
                    <h2>Do<span> 토익 공부</span></h2>
                </div>
            </figcaption>
            <a href="#"></a>
        </figure>
        <%}%>
    </div>
</section>

<!-- 그룹 만들기 창 -->
<div class="modal fade" id="MakeModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="/MakeGroup.do" method="POST" class="needs-validation" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">그룹 만들기</h5>
                    <button type="button" id="LC" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <input type="text" class="form-control" id="Gname" name="gname" placeholder="그룹명을 입력해주세요." required>
                        <div class="invalid-feedback">
                            그룹명을 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <textarea class="form-control" id="Greet" name="greet" placeholder="그룹에 대한 설명을 자유롭게 작성해주세요.(선택)"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="submit">만들기</button>
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
</body>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script></body>
</html>