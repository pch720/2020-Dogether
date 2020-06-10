<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<nav class="TitlePadding navbar navbar-expand-lg fixed-top navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/main.do" style="color: #ecb807;font-weight: 700;font-size: -webkit-xxx-large;">Dogether</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="justify-content: flex-end;">
        <ul class="navbar-nav mr-2">
            <li class="nav-item">
                <a class="nav-link" href="/MyGroup.do">내 그룹</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/MyGoal.do">내 목표</a>
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