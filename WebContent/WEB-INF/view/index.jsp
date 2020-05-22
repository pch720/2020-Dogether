<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>메인페이지</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.min.css" rel="stylesheet">
    <style>
        .modal {
            top: 20%;
            margin-top: -10%;
        }
        body::-webkit-scrollbar{display: none;}
    </style>
</head>

<body id="page-top">

<!-- Navigation -->
<a class="menu-toggle rounded" href="#">
    <i class="fas fa-bars"></i>
</a>
<nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <li class="sidebar-brand">
            <a style="color: white;">Dogether</a>
        </li>
        <li class="sidebar-nav-item">
            <a class="js-scroll-trigger" href="#page-top">홈</a>
        </li>
        <li class="sidebar-nav-item">
            <a class="js-scroll-trigger" href="#about">소개</a>
        </li>
        <li class="sidebar-nav-item">
            <a class="js-scroll-trigger" href="#services">개발 목적</a>
        </li>
        <li class="sidebar-nav-item">
            <a class="js-scroll-trigger" href="#portfolio">주요 기능</a>
        </li>
    </ul>
</nav>

<!-- 헤더 -->
<header class="masthead d-flex"
        style="padding-top: 6rem;">
    <div class="container text-center my-auto">
        <h1 class="mb-1">Dogether</h1>
        <h3 class="mb-5">
            <em>Do something together with somebody</em>
        </h3>
        <a class="btn btn-primary btn-xl js-scroll-trigger"
           href="#" data-toggle="modal" data-target="#loginModal">함께하기</a>
    </div>

</header>


<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            ...
        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>


<!-- 소개 -->
<section class="content-section bg-light" id="about">
    <div class="container text-center">
        <div class="content-section-heading text-center">
            <h3 class="text-secondary mb-0">DoGether's</h3>
            <h2 class="mb-5">소개</h2>
        </div>
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h2>이 사이트는 같은 목적을 가진 사람들이 모여서 활동할 것입니다!</h2>
                <p class="lead mb-5">한가지 일을 나누어서 하거나 한가지 일을 꾸준히 하기 위해서 사람들이 모일것입니다.</p>
            </div>
        </div>
    </div>
</section>

<!-- 개발목적 -->
<section class="content-section bg-primary text-white text-center" id="services">
    <div class="container">
        <div class="content-section-heading">
            <h3 class="text-secondary mb-0">dogether's</h3>
            <h2 class="mb-5">개발 목적</h2>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="fas fa-users"></i>
          </span>
                <h4>
                    <strong>COLLABORATION</strong>
                </h4>
                <p class="text-faded mb-0">목적이 같은 사람들과의 협동</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="far fa-calendar-check"></i>
          </span>
                <h4>
                    <strong>STEADINESS</strong>
                </h4>
                <p class="text-faded mb-0">일정 기간 동안의 꾸준함을 확인</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="far fa-comment-dots"></i>
          </span>
                <h4>
                    <strong>COMMUNICATION</strong>
                </h4>
                <p class="text-faded mb-0">목적이 같은 사람들과의 소통</p>
            </div>
            <div class="col-lg-3 col-md-6">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="far fa-sticky-note"></i>
          </span>
                <h4>
                    <strong>SHARE</strong>
                </h4>
                <p class="text-faded mb-0">목적을 이루면서 느낀것을 공유</p>
            </div>
        </div>
    </div>
</section>

<!-- 주요기능 -->
<section style="padding-top: 2rem;padding-bottom: 5rem;" id="portfolio">
    <div class="container">
        <div class="content-section-heading text-center">
            <h3 class="text-secondary mb-0">Dogether's</h3>
            <h2 class="mb-5">주요 기능과 설명</h2>
        </div>
        <div class="row no-gutters">
            <div class="col-lg-6">
                <a class="portfolio-item">
            <span class="caption">
              <span class="caption-content">
                <h2>작업방</h2>
                <p class="mb-0">목적이 같은사람들끼리 모여서 목적을 이루는 작업방</p>
              </span>
            </span>
                    <img class="img-fluid" src="img/talk.jpg" alt="">
                </a>
            </div>
            <div class="col-lg-6">
                <a class="portfolio-item">
            <span class="caption">
              <span class="caption-content">
                <h2>메신저</h2>
                <p class="mb-0">작업방 사람들끼리 서로 연락할수 있는 메신저</p>
              </span>
            </span>
                    <img class="img-fluid" src="img/chat.jpg" alt="">
                </a>
            </div>
            <div class="col-lg-6">
                <a class="portfolio-item">
            <span class="caption">
              <span class="caption-content">
                <h2>캘린더</h2>
                <p class="mb-0">일정 기간동안 한 작업의 양이나 꾸준함을 보여주는 캘린더</p>
              </span>
            </span>
                    <img class="img-fluid" src="img/calendar.jpg" alt="">
                </a>
            </div>
            <div class="col-lg-6">
                <a class="portfolio-item">
            <span class="caption">
              <span class="caption-content">
                <h2>게시판</h2>
                <p class="mb-0">일을 이루면서 발생한 문제나 느낀점 등을 공유할 수 있는 게시판</p>
              </span>
            </span>
                    <img class="img-fluid" src="img/post-it.jpg" alt="">
                </a>
            </div>
        </div>
    </div>
</section>
<!-- Footer -->
<footer class="footer text-center" style="background-color: #ecb807;">
    <div class="container">
        <ul class="list-inline mb-5">
            <li class="list-inline-item">
                <a class="social-link rounded-circle text-white mr-3" href="#">
                    <i class="icon-social-facebook"></i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="social-link rounded-circle text-white mr-3" href="#">
                    <i class="icon-social-twitter"></i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="social-link rounded-circle text-white" href="https://github.com/pch720">
                    <i class="icon-social-github"></i>
                </a>
            </li>
        </ul>
        <p class="text-muted small mb-0">KOPO_kangseo - 1920110014 &copy; 2020</p>
    </div>
</footer>

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

</html>
