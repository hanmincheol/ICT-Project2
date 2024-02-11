<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 기본 버튼 스타일 */
.button-like {
    display: inline-block;
    width: 90px;
    height: 60px;
    text-align: center;
    text-decoration: none;
    font-size: 14px;
    line-height: 100%;
    cursor: pointer;
    background-color:  #FFC3C3;
    white-space: pre-line;
    color:  #FFFFFF;
    border-radius: 6px;
}
.button-like div {
    line-height: 0.3; /* 버튼의 높이에 따라 조절 */
}

/* 마우스 호버 효과 */
.button-like:hover {
    background-color:#FFA07A;
}
:root {
	--primary-color: #AF937D;
	--secondary-color: #57B894;
	--black: #000000;
	--white: #ffffff;
	--gray: #efefef;
	--gray-2: #757575;
	--facebook-color: #4267B2;
	--google-color: #DB4437;
	--twitter-color: #1DA1F2;
	--insta-color: #E1306C;
}

@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap')
	;

* {
	font-family: 'Poppins', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	height: 100vh;
	overflow: hidden;
}

.container {
	position: relative;
	min-height: 100vh;
	overflow: hidden;
}

.row {
	display: flex;
	flex-wrap: wrap;
	height: 100vh;
}

.col {
	width: 50%;
}

.align-items-center {
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.form-wrapper {
	width: 100%;
	max-width: 28rem;
}

.form {
	padding: 1rem;
	background-color: var(--white);
	border-radius: 1.5rem;
	width: 100%;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	transform: scale(1);
	transition: .5s ease-in-out;
	transition-delay: 1s;
}

.input-group {
	position: relative;
	display:flex;
	width: 100%;
	margin: 0.5rem 0;
}

.hypen{
	font-size:22px;
	padding-top:5px;
	font-weight:bolder;
	scale: 1.4 1;
}

.input-group i {
	position: absolute;
	top: 50%;
	left: 1rem;
	transform: translateY(-50%);
	font-size: 1.4rem;
	color: var(--gray-2);
}

.input-group input {
	width: 100%;
	padding: 1rem 0rem;
	text-align:center;
	font-size: 1rem;
	background-color: var(--gray);
	border-radius: .5rem;
	border: 0.125rem solid var(--white);
	outline: none;
}

.input-group input:focus {
	border: 0.125rem solid var(--primary-color);
}

.form button {
	cursor: pointer;
	width: 100%;
	padding: .6rem 0;
	border-radius: .5rem;
	border: none;
	background-color: var(--primary-color);
	color: var(--white);
	font-size: 1.2rem;
	outline: none;
}

.form p {
	margin: 1rem 0;
	font-size: .7rem;
}

.flex-col {
	flex-direction: column;
}

.social-list {
	margin: 2rem 0;
	padding: 1rem;
	border-radius: 1.5rem;
	width: 100%;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	transform: scale(0);
	transition: .5s ease-in-out;
	transition-delay: 1.2s;
}

.social-list>div {
	color: var(--white);
	margin: 0 .5rem;
	padding: .7rem;
	cursor: pointer;
	border-radius: .5rem;
	cursor: pointer;
	transform: scale(0);
	transition: .5s ease-in-out;
}

.social-list>div:nth-child(1) {
	transition-delay: 1.4s;
}

.social-list>div:nth-child(2) {
	transition-delay: 1.6s;
}

.social-list>div:nth-child(3) {
	transition-delay: 1.8s;
}

.social-list>div:nth-child(4) {
	transition-delay: 2s;
}

.social-list>div>i {
	font-size: 1.5rem;
	transition: .4s ease-in-out;
}

.social-list>div:hover i {
	transform: scale(1.5);
}

.facebook-bg {
	background-color: var(--facebook-color);
}

.google-bg {
	background-color: var(--google-color);
}

.twitter-bg {
	background-color: var(--twitter-color);
}

.insta-bg {
	background-color: var(--insta-color);
}

.pointer {
	cursor: pointer;
}

.container.sign-in .form.sign-in, .container.sign-in .social-list.sign-in,
	.container.sign-in .social-list.sign-in>div, .container.sign-up .form.sign-up,
	.container.sign-up .social-list.sign-up, .container.sign-up .social-list.sign-up>div
	{
	transform: scale(1);
}

.content-row {
	position: absolute;
	top: 0;
	left: 0;
	pointer-events: none;
	z-index: 6;
	width: 100%;
}

.text {
	margin: 3rem;
	color: var(--white);
}

.text h2 {
	font-size: 3.5rem;
	font-weight: 800;
	margin: 2rem 0;
	transition: 1s ease-in-out;
}

.text p {
	font-weight: 600;
	transition: 1s ease-in-out;
	transition-delay: .2s;
}

.img img {
	width: 30vw;
	transition: 1s ease-in-out;
	transition-delay: .4s;
}

.text.sign-in h2, .text.sign-in p, .img.sign-in img {
	transform: translateX(-250%);
}

.text.sign-up h2, .text.sign-up p, .img.sign-up img {
	transform: translateX(250%);
}

.container.sign-in .text.sign-in h2, .container.sign-in .text.sign-in p,
	.container.sign-in .img.sign-in img, .container.sign-up .text.sign-up h2,
	.container.sign-up .text.sign-up p, .container.sign-up .img.sign-up img
	{
	transform: translateX(0);
}

/* BACKGROUND */
.container::before {
	content: "";
	position: absolute;
	top: 0;
	right: 0;
	height: 100%;
	width: 100%;
	background: url('/HanMinCheolProj2/images/background.jpg');
	background-size: contain;
	transition: 1s ease-in-out;
	z-index: 6;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.container.sign-in::before {
	transform: translate(0, 0);
	right: 50%;
}

.container.sign-up::before {
	transform: translate(100%, 0);
	right: 50%;
}
/* input::placeholder{
	font-size:15px;
} */

.c1 input::placeholder{
	font-size:14.5px;
}



/* 숨기기 */
.radio-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* 라디오 버튼 스타일 */
.radio-container {
    display: inline-block;
    position: relative;
    padding-left: 35px;
    margin: 0 15px;
    cursor: pointer;
    font-size: 16px;
    user-select: none;
}

/* 라디오 버튼 가상 요소 */
.radio-container .checkmark {
    position: absolute;
    top: 50%;
    left: 0;
    transform: translateY(-50%);
    height: 18px;
    width: 18px;
    background-color: #eee;
    border-radius: 50%;
}

/* 클릭 시 라디오 버튼 가상 요소 */
.radio-container input:checked~.checkmark {
    background-color: rgba(200, 105, 180, 0.5);
}

/* 라디오 버튼 가상 요소 내부 */
.radio-container .checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* 클릭 시 라디오 버튼 가상 요소 내부 */
.radio-container input:checked~.checkmark:after {
    display: block;
}

/* 클릭 시 라디오 버튼 가상 요소 내부 스타일 */
.radio-container .checkmark:after {
    top: 5px;
    left: 5px;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: white;
}


/* 체크박스 스타일 */
.checkbox-container {
    display: inline-block;
    position: relative;
    padding-left: 30px;
    margin-bottom: 12px;
    margin-right: 15px;
    cursor: pointer;
    font-size: 14px;
    user-select: none;
}

.checkbox-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

.checkbox-container .checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 20px;
    width: 20px;
    background-color: #eee;
}

.checkbox-container:hover input ~ .checkmark {
    background-color: #ccc;
}

.checkbox-container input:checked ~ .checkmark {
    background-color: #C19A6B;
}

.checkbox-container .checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

.checkbox-container input:checked ~ .checkmark:after {
    display: block;
}

.checkbox-container .checkmark:after {
    left: 7px;
    top: 3px;
    width: 6px;
    height: 10px;
    border: solid white;
    border-width: 0 2px 2px 0;
    transform: rotate(45deg);
}

/* 셀렉트박스 스타일 */
select {
    padding: 5px;
    margin: 5px 0;
    width: 100%;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}

select:focus {
    border-color: #AF937D;
    border-width: 2px;
    outline: none;
}

/* 자기소개 입력창 스타일 */
textarea {
    padding: 10px;
    width: 100%;
    height: 100px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
    box-shadow: 0 0 5px rgba(0,0,0,0.1);
    transition: box-shadow 0.3s ease;
    margin-bottom:5px; 
}

textarea:focus {
    border-color: #AF937D;
    box-shadow: 0 0 10px rgba(139,69,19,0.2);
    border-width: 2px;
    outline: none;
}
</style>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded',function(){

		var id = document.querySelector("#id");
		var form1 = document.querySelector("#form1");
		var pwd1 = document.querySelector("#pwd1");
		var pwd2 = document.querySelector("#pwd2");
		var name1 = document.querySelector("#name1");
		var pid1 = document.querySelector("#pid1");
		var pid2 = document.querySelector("#pid2");
		var regexp1 = /[0-9]{6}/;
		var regexp2 = /[0-9]{7}/;
		var male = document.querySelector("#male");
		var female = document.querySelector("#female");
		var addr = document.querySelector("#sample4_roadAddress");
		var ph1 = document.querySelector("#ph1");
		var ph2 = document.querySelector("#ph2");
		var ph3 = document.querySelector("#ph3");
		var regexp3 = /[0-9]{3}/;
		var regexp4 = /[0-9]{4}/;
		var inters =  document.querySelectorAll('input[name="inter"]');
		var grade =  document.querySelector("#grade");
		var intersCheck = 0;
		var strr = document.getElementById('strr');
		

		form1.onsubmit = function(e){
		for (var i in inters) {
		    if(inters[i].checked == true){ 
		    	intersCheck += 1;
		    }
		}
        if(id.value == null || id.value.trim().length==0){
            alert("아이디를 입력하세요!");
            id.placeholder = "";
            id.focus();
            e.preventDefault();
        }
        else if(strr.textContent.trim()=="" || strr.textContent.trim().startsWith("부") || strr.textContent.trim().startsWith("중")) {
        	alert("중복확인하세요!");
        	e.preventDefault();
        }
        else if(pwd1.value == null || pwd1.value.trim().length==0){
            alert("비밀번호를 입력하세요!");
            pwd1.placeholder = "";
            pwd1.focus();
            e.preventDefault();
        }
        else if(pwd1.value != pwd2.value){
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다!");
            pwd2.placeholder = "";
            pwd2.focus();
            e.preventDefault();
        }
        else if(name1.value == null || name1.value.trim().length==0){
        	alert("이름를 입력하세요!");
            name1.placeholder = "";
            name1.focus();
            e.preventDefault();
        }else if(pid1.value == null || pid1.value.trim().length==0){
            alert("주민번호를 입력하세요!");
            pid1.placeholder = "";
            pid1.focus();
            e.preventDefault();
        }
        else if(pid2.value == null || pid2.value.trim().length==0){
            alert("주민번호를 입력하세요!");
            pid2.placeholder = "";
            pid2.focus();
            e.preventDefault();
        }
        else if(!regexp1.test(pid1.value)){
            alert("주민번호가 올바르지 않습니다!");
            pid1.placeholder = "";
            pid1.focus();
            e.preventDefault();
        }
        else if(!regexp2.test(pid2.value)){
            alert("주민번호가 올바르지 않습니다!");
            pid2.placeholder = "";
            pid2.focus();
            e.preventDefault();
        }
        else if(!(male.checked != female.checked)) alert("성별을 체크해주세요!");
        else if(addr.value == null || addr.value.trim().length==0){
            alert("주소를 입력하세요!");
            addr.placeholder = "";
            addr.focus();
            e.preventDefault();
        }
        else if(ph1.value == null || ph1.value.trim().length==0){
            alert("핸드폰 번호를 입력하세요!");
            ph1.placeholder = "";
            ph1.focus();
            e.preventDefault();
        }
        else if(ph2.value == null || ph2.value.trim().length==0){
            alert("핸드폰 번호를 입력하세요!");
            ph2.focus();
            e.preventDefault();
        }
        else if(ph3.value == null || ph3.value.trim().length==0){
            alert("핸드폰 번호를 입력하세요!");
            ph3.focus();
            e.preventDefault();
        }
        else if(!regexp3.test(ph1.value)){
            alert("핸드폰 번호가 올바르지 않습니다!");
            ph1.placeholder = "";
            ph1.focus();
            e.preventDefault();
        }
        else if(!regexp4.test(ph2.value)){
            alert("핸드폰 번호가 올바르지 않습니다!");
            ph2.focus();
            e.preventDefault();
        }
        else if(!regexp4.test(ph3.value)){
            alert("핸드폰 번호가 올바르지 않습니다!");
            ph3.focus();
            e.preventDefault();
        }else if (intersCheck == 0) {
            alert("관심사를 하나 이상 체크해주세요!");
            e.preventDefault();
        }else if(grade.value == null || grade.value == ""){
            alert("학력을 선택해주세요!");
            e.preventDefault();
        }
        if(pid2.value.startsWith("1") || pid2.value.startsWith("3")) male.checked = true;
        else if(pid2.value.startsWith("2") || pid2.value.startsWith("4")) female.checked = true; 
    	};
    	
	});
	
</script>
</head>
<body>
<div id="container" class="container">
	<!-- FORM SECTION -->
	<div class="row">
		<!-- SIGN UP -->
		<div class="col align-items-center flex-col sign-up">
			<div class="form-wrapper align-items-center">
				<div class="form sign-up" id="form1">
				<form action="${pageContext.request.contextPath}/login/join.ict" method="post">
					<div class="input-group">
						<input type="text" placeholder="아이디" name="id" id="id" style="height:45px">
						<a href="javascript:void(0);" onclick="checkId()" class="button-like" style="height:45px">
						    중복확인
						</a>
						<div id="strr" style="color: #FF0000; font-weight:bold; font-size:16px;"></div>
					</div>
					<div class="input-group">
						<input type="password"
							placeholder="비밀번호" name="password" id="pwd1" style="height:45px">
					</div>
					<div class="input-group">
						<input type="password" placeholder="비밀번호 확인" name="password1" id="pwd2" style="height:45px">
					</div>
					<div class="input-group">
						<input type="text" placeholder="이름" name="name" id="name1" style="height:45px">
					</div>
					<div class="input-group c1">
						<input type="text" placeholder="주민번호 앞자리" name="pid1" id="pid1" style="height:45px">
						<div class="hypen">-</div>
						<input type="text" placeholder="주민번호 뒷자리" name="pid2" id="pid2" style="height:45px">
					</div>
					<!--  
					<div class="d-flex">
						<span class="custom-control custom-radio mr-2">
							<input type="radio" class="custom-control-input" name="gender" value="M" id="male" >
							<label for="male" class="custom-control-label">남자</label>
						</span>
						<span class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" name="gender" value="W" id="female">
							<label for="female"	class="custom-control-label">여자</label>
						</span>
					</div>
					-->
					<div class="d-flex">
					    <label class="radio-container" for="male">남자
					        <input type="radio" name="gender" value="M" id="male" >
					        <span class="checkmark"></span>
					    </label>
					    <label class="radio-container" for="female">여자
					        <input type="radio" name="gender" value="W" id="female">
					        <span class="checkmark"></span>
					    </label>
					</div>
					<div class="input-group">
					    <input type="text" id="sample4_postcode" placeholder="우편번호" name = "addr" style="height:45px">
					    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height: 45px;user-select: auto !important;line-height: 55%;"><br>
					</div>
					<div class="input-group">
					    <input type="text" id="sample4_roadAddress" name = "addr1" placeholder="도로명주소" style="height:45px;"><br/>
					</div>
					<div class="input-group">
					    <input type="text" id="sample4_jibunAddress" name = "addr2" placeholder="지번주소" style="height:45px"><br/>
					</div>
					<div class="input-group">
					    <span id="guide" style="color:#999;display:none"></span>
					    <input type="text" id="sample4_detailAddress" name = "addr3" placeholder="상세주소" style="height:45px">
					</div>
					<div class="input-group">
						<input type="text" placeholder="010" name="ph1" id="ph1" style="height:45px;">
						<div class="hypen">-</div>
						<input type="text" placeholder="" name="ph2" id="ph2" style="height:45px;">
						<div class="hypen">-</div>
						<input type="text" name="ph3" id="ph3" style="height:45px;">
					</div>
					<!-- <div class="d-flex">
						<span class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="inter" value="동물">
							<label class="custom-control-label" for="POL">동물</label>
						</span>
						<span class="custom-control custom-checkbox mx-2">
							<input type="checkbox" class="custom-control-input" name="inter" value="영화">
							<label class="custom-control-label" for="ECO">영화</label>
						</span>
						<span class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="inter" value="연예">
							<label class="custom-control-label" for="ENT">연예</label>
						</span>
						<span class="custom-control custom-checkbox ml-2">
							<input type="checkbox" class="custom-control-input" name="inter" value="스포츠">
							<label class="custom-control-label" for="SPO">스포츠</label>
						</span>	
					</div>
					<div class="form-group" style="user-select: auto !important;margin-top: 15px;">
						<label><kbd class="lead">학력사항</kbd></label>
						<select name="grade" class="custom-select mt-3 custom-select-lg" id="grade">
							<option value="">학력을 선택하세요</option>
							<option value="초등학교">초등학교</option>
							<option value="중학교">중학교</option>
							<option value="고등학교">고등학교</option>
							<option value="대학교">대학교</option>
						</select>
					</div>

					<div class="form-group" style="user-select: auto !important;display: flex;flex-direction: column;margin: 10px;">
						<label style="user-select: auto !important;margin-bottom: 10px;">자기소개</label>
						<textarea class="form-control" rows="5" name="self"></textarea>
					</div> -->
					<div class="d-flex">
				    <label class="checkbox-container">동물
				        <input type="checkbox" name="inter" value="동물">
				        <span class="checkmark"></span>
				    </label>
				    <label class="checkbox-container">영화
				        <input type="checkbox" name="inter" value="영화">
				        <span class="checkmark"></span>
				    </label>
				    <label class="checkbox-container">연예
				        <input type="checkbox" name="inter" value="연예">
				        <span class="checkmark"></span>
				    </label>
				    <label class="checkbox-container">스포츠
				        <input type="checkbox" name="inter" value="스포츠">
				        <span class="checkmark"></span>
				    </label>
					</div>
					
					<div class="form-group">
					    <label>학력사항</label>
					    <select name="grade" id="grade">
					        <option value="">학력을 선택하세요</option>
					        <option value="초등학교">초등학교</option>
					        <option value="중학교">중학교</option>
					        <option value="고등학교">고등학교</option>
					        <option value="대학교">대학교</option>
					    </select>
					</div>
					
					<div class="form-group">
					    <label>자기소개</label>
					    <textarea name="self" rows="3"></textarea>
					</div>
					<button type="submit">회원가입하기</button>
					</form>
					
					<p style="user-select: auto !important;font-size: 14px;">
						<span> 이미 계정이 있으신가요? </span> <b onclick="toggle()"
							class="pointer"> 여기를 눌러주세요 </b>
					</p>
	
				</div>
			</div>

		</div>
		<!-- END SIGN UP -->
		<!-- SIGN IN -->
		<div class="col align-items-center flex-col sign-in">
			<div class="form-wrapper align-items-center">
				<div class="form sign-in">
				<form action="${pageContext.request.contextPath}/login/check.ict" method="post">
						<div class="input-group">
							<i class='bx bxs-user'></i> 
							<input type="text" placeholder="아이디" name="id">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> 
							<input type="password" placeholder="비밀번호" name="pwd">
					</div>
					<button type="submit">로그인</button>
				</form>
					<p style="user-select: auto !important;font-size: 15px;">
						<a href="<c:url value="/log/SearchId.jsp"/>"> 아이디 찾기 or 비밀번호 찾기</a>
					</p>
					<p style="user-select: auto !important;font-size: 14px;">
						<span> 계정이 없으신가요? </span> <b onclick="toggle()"
							class="pointer"> 여기를 눌러주세요 </b>
					</p>
				</div>
			</div>
			<div class="form-wrapper"></div>
		</div>
		<!-- END SIGN IN -->
	</div>
	<!-- END FORM SECTION -->
	<!-- CONTENT SECTION -->
	<div class="row content-row">
		<!-- SIGN IN CONTENT -->
		<div class="col align-items-center flex-col">
			<div class="text sign-in">
				<h2>환영합니다</h2>

			</div>
			<div class="img sign-in"></div>
		</div>
		<!-- END SIGN IN CONTENT -->
		<!-- SIGN UP CONTENT -->
		
		<div class="col align-items-center flex-col">
			<div class="img sign-up"></div>
			<div class="text sign-up">
				<h2 style="color:black; z-index:1000;">가입해주세요!</h2>
			</div>
		</div>
		
		
		<!-- END SIGN UP CONTENT -->
	</div>
	<!-- END CONTENT SECTION -->
</div>
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	let container = document.getElementById('container');
	
	toggle = () => {
	  container.classList.toggle('sign-in');
	  container.classList.toggle('sign-up');
	}
	
	setTimeout(() => {
	  container.classList.add('sign-in');
	}, 200)
	
	function checkId(){
	fetch("<c:url value='/login/checkId.ict?id="+id.value+"'/>", {
           method: 'GET',
           headers: {
               'Content-Type': 'application/json'
           },
       })
       .then(response => response.json())
       .then(data => {
           let str = document.createElement('span');
           str.textContent = data.message;
           let targetElement = document.getElementById('strr');
           targetElement.innerHTML="";
           targetElement.appendChild(str);
       })
       .catch(error => {
           console.error('Error:', error);
       });
}
	pid1.addEventListener("keyup()",(e)=>{
		if(pid1.value.trim().length >= 6){
    		pid2.placeholder = "";
        	pid2.focus();
    		}
	})
	
	ph1.addEventListener("keyup",(e)=>{
		if(e.target.value.trim().length >= 3){
        	ph2.focus();
    		}
	});
	
	ph2.addEventListener("keyup",(e)=>{
		if(e.target.value.trim().length >= 4){
        	ph3.focus();
    		}
	});
	
	pid2.addEventListener("keyup",(e)=>{
		if(e.target.value.startsWith("1") || e.target.value.startsWith("3")){
			male.checked = true;
		} else if(e.target.value.startsWith("2") || e.target.value.startsWith("4")){
			female.checked = true;
		}
	});
	
	var themeObj = {
            bgColor: "#162525", //바탕 배경색
            searchBgColor: "#162525", //검색창 배경색
            contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
            pageBgColor: "#162525", //페이지 배경색
            textColor: "#FFFFFF", //기본 글자색
            queryTextColor: "#FFFFFF", //검색창 글자색
            //postcodeTextColor: "", //우편번호 글자색
            //emphTextColor: "", //강조 글자색
            outlineColor: "#444444" //테두리
            };
       function sample4_execDaumPostcode() {
    	   new daum.Postcode({
            theme : themeObj,
            popupTitle: '우편번호 검색-ICT',
            width:550,
            height:600,
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();	   
    }
</script>
</body>
</html>