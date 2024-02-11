<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    
    <script src="https://kit.fontawesome.com/0b4621b427.js" crossorigin="anonymous"></script>
    <title></title>
    <style>
        /*점보트론 세로폭 및 마진바툼 줄이기*/
        .jumbotron{
            padding-top:1rem;
            padding-bottom:1rem;            
            margin-bottom: .5rem;
            
            border-top-left-radius:0;
            border-top-right-radius:0;
        }
       .navbar-brand, .navbar-text, .nav-link {
            color: #8B4513 !important;
            transition: color 0.5s;
        }
        .navbar {
            background-color: #DEB887 !important;
            transition: background-color 0.5s;
        }
        .page-footer {
            background-color: #DEB887;
            color: #8B4513;
            position: fixed;
            left: 0; /* 왼쪽에 고정 */
            bottom: 0; /* 하단에 고정 */
            width: 100%; /* 너비를 100%로 설정 */
            height: 50px; /* 높이를 50px로 설정 */
            animation: fadeIn 1s;
        }
        
       .form-group label {
            color: #8B4513;
            font-weight: bold;
        }
        .form-control, .form-control-file {
            background-color: #F5F5F5;
            border-color: #8B4513;
        }
        .form-control:focus, .form-control-file:focus {
            border-color: #8B4513;
            box-shadow: 0 0 0 0.2rem rgba(139, 69, 19, 0.25);
        }
        /* 애니메이션 효과 */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        /* 버튼 스타일 */
        .btn {
            background-color: #E8C1A0;
            color: #8B4513;
            border-color: #8B4513;
            animation: glowing 2s infinite alternate-reverse;
        }
        .btn:hover {
            background-color: #DEB887;
            border-color: #8B4513;
        }
        /* 애니메이션 효과 */
        @keyframes glowing {
            0% { box-shadow: 0 0 1px #8B4513, 0 0 2px #8B4513, 0 0 3px #8B4513, 0 0 4px #8B4513; }
            100% { box-shadow: 0 0 5px #8B4513, 0 0 6px #8B4513, 0 0 7px #8B4513, 0 0 8px #8B4513; }
        }
        
        /* 작성 설명 스타일 */
         .jumbotron {
            background-color: #D3D3D3;
        }
        .jumbotron small {
            background-color:  #D3D3D3;
            padding: 0.2em 0.4em;
            border-radius: 0.2em;
        }
        
        @keyframes fadeIn {
		  0% {opacity: 0;}
		  100% {opacity: 1;}
		}
		.card {
		  animation: fadeIn 1s ease-in;
		}
		

    </style>
</head>
<body>
	    <!-- 네비게이션 바  -->
    <nav class="navbar navbar-expand-sm navbar-dark fixed-top">   
        <!--Brand / Logo 표시-->      
        <a class="navbar-brand" href="<c:url value="/bbs/List.ict"/>">
            <i class="bi bi-house-door-fill"></i>
        </a>
        <!-- Navbar text-->
        <span class="navbar-text">
            민철이의 게시판~~!
        </span>
      
      <!-- Toggler/collapsibe Button -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
       
         <!-- Links -->
        <ul class="navbar-nav mr-2"><!--mr-2은 Navbar text와의 여백용-->
        	<!-- 세션 기반 인증 -->
          <c:if test="${islogin}" var="result">
          <li class="nav-item">
            <a class="nav-link" href="<c:url value="/log/Login.jsp" />">로그인 <i class="fa fa-user-o"></i></a>
          </li>
          </c:if>
          <!--Navbar With Dropdown-->
          <!--하단고정일때는 dropdown을 dropup으로-->
          <li class="nav-item dropdown mr-3">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">메뉴</a>
            <div class="dropdown-menu">
				<a class="dropdown-item " href="<c:url value="/bbs/List.ict"/>">게시판 <i class='bi bi-card-list'></i></a>
				<a class="dropdown-item " href="<c:url value="/mybbs/MyPage.ict"/>">마이페이지 <i class='bi bi-person-square'></i></a>
				<a class="dropdown-item " href="<c:url value="/mybbs/EditData.ict"/>">회원정보 수정하기 <i class="bi bi-pencil-square"></i></a>
				<a class="dropdown-item " href="<c:url value="/log/out.ict"/>">회원탈퇴하기 <i class='fa fa-user-o'></i></a>
            </div>
          </li>
          <c:if test="${!result}">
          <li class="nav-item mr-3"><!--로그아웃 마진 조정-->
            <a class="nav-link " href="<c:url value="/log/Logout.ict" />">로그아웃 <i class="bi bi-emoji-expressionless"></i></a>
          </li>
          </c:if>
        </ul>
      </div>
    </nav>