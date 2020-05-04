<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.min.css">
    <title>전연규 자기소개페이지</title>
</head>


    <div id="home" />
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="container">
            <a href="index.html" class="navbar-brand">전연규로고</a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navCollapse">
                <!-- toggler는 마우스를 클릭하면 나타나고 다시클릭시 나타나지 않는상태를 반복 -->
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navCollapse">
                <!-- 버튼을 눌렀을때 나오는 창 만들기(id 값은 위에있는 데이터 타겟이랑 같게하면됨) -->
                <ul class="navbar-nav ml-auto">
                    <!-- ▲ 네비게이션 요소들 (왼쪽 마진은 auto로 줫음) -->
                    <li class="nav-item">
                        <!-- item을 이용해서 네비게이션 요소들을 집어 넣어줌 -->
                        <a href="#home" class="nav-link">메인</a>
                    </li>
                    <li class="nav-item">
                        <a href="#career" class="nav-link">경력</a>
                    </li>
                    <li class="nav-item">
                        <a href="#portfolio" class="nav-link">포트폴리오</a>
                    </li>
                    <li class="nav-item">
                        <a href="#contact" class="nav-link">연락처</a>
                    </li>
                </ul>
            </div>

        </div>

