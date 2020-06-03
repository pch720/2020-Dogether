<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String USER_NAME=(String)session.getAttribute("SS_USER_NAME");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        .Lcount{
            text-align: end;
            font-size: small;
            margin-bottom: -3%;
            margin-right: 2%;
        }
        .PTS{
            width: 100%;
            margin-top: .25rem;
            font-size: 80%;
            color: #dc3545;
            display: none;
        }
        .MB{
            width: 49%;
            height: 100px;
        }
        .regcheck{
            text-align: end;
            margin-top: -5%;
            margin-right: 3%;
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
        style="padding-top: 6rem;height: 100vh;">
    <div class="container text-center my-auto">
        <h1 class="mb-1">Dogether</h1>
        <h3 class="mb-5">
            <em>Do something together with somebody</em>
        </h3>
        <%if (USER_NAME==null){%>
        <a class="btn btn-primary btn-xl js-scroll-trigger"
           href="#" data-toggle="modal" data-target="#loginModal">함께하기</a>
    </div><%}else{%>
    <a class="btn btn-primary btn-xl js-scroll-trigger"
       href="#" data-toggle="modal" data-target="#userModal">함께하기</a>
    </div><%}%>
</header>

<!-- 회원 창 -->
<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="/logout.do" method="POST" class="needs-validation" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title">함께 하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <button type="button" class="btn btn-secondary MB">메인으로 가기</button>
                    <button class="btn btn-primary MB" type="submit">로그아웃</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 로그인창 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="/login.do" method="POST" class="needs-validation" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그인 하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <div>이메일 주소</div>
                        <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$">
                        <div class="invalid-feedback">
                            형식에 맞게 이메일주소를 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <div>비밀번호</div>
                        <input type="password" class="form-control" id="pw" name="pw" placeholder="영문, 숫자, 특수문자 조합 8-15자 입니다." required>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button style="width: 90px;" class="btn btn-primary" type="submit">로그인</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" data-toggle="modal" data-target="#regModal">회원가입</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 회원가입창 -->
<div class="modal fade" id="regModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="Regis">
                <div class="modal-header">
                    <h5 class="modal-title">회원가입 하기</h5>
                    <button type="button" class="close regclose" data-dismiss="modal"data-toggle="modal" data-target="#loginModal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <div>닉네임</div><div id="c1" class="regcheck" style="display: none;"><i id="check1" class="fas fa-check"></i></div>
                        <input type="text" class="form-control" id="Regname" placeholder="10자 이내로 입력해주세요."  maxlength="10" onkeyup="return name1()">
                        <div id="Nl" class="Lcount">
                            (0/10)
                        </div>
                        <div id="nname" class="PTS">
                            닉네임을 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <div>이메일 주소</div><div id="c2" class="regcheck" style="display: none;"><i id="check2" class="fas fa-check"></i></div>
                        <input type="text" class="form-control" id="Regemail" placeholder="you@example.com"  onkeyup="return email1()">
                        <div id="nemail" class="PTS">
                            형식에 맞게 이메일주소를 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <div>비밀번호</div><div id="c3" class="regcheck" style="display: none;"><i id="check3" class="fas fa-check"></i></div>
                        <input type="password" class="form-control" id="Regpw" placeholder="영문, 숫자조합 8-15자로 입력해주세요." maxlength="15" onkeyup="return pw1()">
                        <div id="Pl" class="Lcount">
                            (0/15)
                        </div>
                        <div id="npw" class="PTS">
                            형식에 맞게 비밀번호를 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <div>비밀번호 확인</div><div id="c4" class="regcheck" style="display: none;"><i id="check4" class="fas fa-check"></i></div>
                        <input type="password" class="form-control" id="Regpwc" placeholder="비밀번호 확인을 입력해주세요."  maxlength="15" onkeyup="return pwc1()">
                        <div id="Pcl" class="Lcount">
                            (0/15)
                        </div>
                        <div id="npwc" class="PTS">
                            비밀번호와 동일하게 입력해주세요.
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary regclose" data-dismiss="modal"data-toggle="modal" data-target="#loginModal">취소</button>
                    <input style="width: 90px;" class="btn btn-primary" type="button" onclick="return Reg();"value="회원가입">
                </div>
            </form>
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
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="js/form-validation.js"></script></body>
</html>
