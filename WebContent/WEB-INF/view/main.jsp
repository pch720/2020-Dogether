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
        }
    </style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>메인페이지</title>

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
    <a class="navbar-brand" href="#" style="color: #ecb807;font-weight: 700;font-size: -webkit-xxx-large;">Dogether</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="justify-content: flex-end;">
        <ul class="navbar-nav mr-2">
            <li class="nav-item">
                <a class="nav-link" href="#">내 그룹</a>
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
<section class="bg-primary text-white TitlePadding GAH">
    <a class="navbar-brand" style="font-weight: 300;font-size: xx-large;">My Group</a>
    <div class="container">
        <a class="card" style="width: 250px;height: 250px; text-decoration: none" href="#">
            <img src="/img/bg-masthead.jpg" class="card-img-top" alt="..." style="height: 60%;">
            <div class="card-body" style="color: black;">
                <h5 class="card-title">공부하는 스터디 그룹</h5>
                <p class="card-text">300명</p>
            </div>
        </a>
    </div>

</section>
<!-- 내 목표 -->
<section class="text-white TitlePadding GAH">
    <a class="navbar-brand" style="font-weight: 300;font-size: xx-large;">My Group</a>
    <div class="container">
        <div class="card" style="width: 250px;height: 250px;">
            <img src="/img/bg-masthead.jpg" class="card-img-top" alt="..."style="height: 60%;">
            <div class="card-body" style="color: black;">
                <h5 class="card-title">공부하는 스터디 그룹</h5>
                <p class="card-text">300명과
                    <a href="#" class="btn btn-primary stretched-link">함께하기</a></p>
            </div>
        </div>
    </div>

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
<script src="js/index.js"></script>
</body>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script></body>
</html>