<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/template/Top.jsp" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            display: flex;
    		flex-direction: column;
        }

        .custom-form {
            border: 1px solid #ced4da;
            padding: 15px;
            border-radius: 8px;
        }
        .custom-form .row {
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
    <div class="col-md-7 col-lg-5 custom-form" style="text-align-last: center;text-align: center;user-select: auto !important;margin-top: 65vh;">
        <h4 class="mb-3">회원정보 수정하기</h4>
        <form class="needs-validation" action="<c:url value='/mybbs/EditData.ict'/>" method="POST" id="form1" enctype="multipart/form-data">
            	<div class="row">
            	<div class="col">
                <label for="password" class="form-label"  >비밀번호</label>
                <input type="password" class="form-control form-control-sm" id="pwd1" name="pwd1"
                    placeholder="비밀번호를 입력하세요." required>
                </div>
                <div class="col">
                <label for="password" class="form-label">비밀번호 확인</label>
                <input type="password" class="form-control form-control-sm" id="pwd2" name="pwd2"
                    placeholder="다시한번 입력하세요.">
            	</div>
            	</div>
                <div class="row">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" class="form-control form-control-sm" id="name" name="name" placeholder="${dto.name}">
                </div>	
            <div class="row">
                <div class="col">
                    <label for="resident1" class="form-label">주민번호</label>
                    <div class="input-group">
                        <input type="text" class="form-control form-control-sm" id="pid1" placeholder="${personId1}" name="pid1" autocomplete="off">
                        <span class="input-group-text" style="user-select: auto !important;font-size: 10px;">-</span>
                        <input type="text" class="form-control form-control-sm" id="pid2" placeholder="${personId2}" name="pid2" autocomplete="off">
                    </div>
                </div>
            </div>
			<div class="input-group" style="user-select: auto !important; justify-content: center; margin-bottom:20px; margin-top:20px">
				<span class="custom-control custom-radio mr-2">
					<input type="radio" class="custom-control-input" name="gender" value="M" id="male" <c:if test='${dto.gender eq "M"}'>checked="checked"</c:if>>
					<label for="male" class="custom-control-label">남자</label>
				</span>
				<span class="custom-control custom-radio">
					<input type="radio" class="custom-control-input" name="gender" value="W" id="female" <c:if test='${dto.gender eq "W"}'>checked="checked"</c:if>>
					<label for="female"	class="custom-control-label">여자</label>
				</span>
			</div>
			<div class="row">
			  <div class="col">
               <label for="resident1" class="form-label">주소</label>
                <div class="input-group">
				    <input type="text" class="form-control form-control-sm" id="sample4_postcode" placeholder="${arr1}" name = "addr" style="margin-right:10px; margin-bottom:10px;">
				    <input type="button" onclick="sample4_execDaumPostcode()" class="btn-sm btn-dark" value="우편번호 찾기" style="margin-bottom:10px;"><br>
				</div>
					<div class="input-group">
					    <input type="text" class="form-control form-control-sm" id="sample4_roadAddress" name = "addr1" placeholder="${arr2}" style="width: 400px; margin-bottom:10px;"><br/>
					</div>
					<div class="input-group">
					    <input type="text" class="form-control form-control-sm" id="sample4_jibunAddress" name = "addr2" placeholder="${arr3}" style="width: 400px; margin-bottom:10px;"><br/>
					</div>
					<div class="input-group">
					    <span id="guide" style="color:#999;display:none"></span>
					    <input type="text" class="form-control form-control-sm" id="sample4_detailAddress" name = "addr3" placeholder="${arr4}" style="width: 400px;">
					</div>
				</div>
			</div>
            <div class="row">
                <div class="col">
                    <label for="resident1" class="form-label">핸드폰 번호</label>
                    <div class="input-group">
                        <input type="text" class="form-control form-control-sm" id="ph1" placeholder="${ph1}" name="ph1" autocomplete="off">
                        <span class="input-group-text" style="user-select: auto !important;font-size: 10px;">-</span>
                        <input type="text" class="form-control form-control-sm" id="ph2"  name="ph2" placeholder="${ph2}" autocomplete="off">
                        <span class="input-group-text" style="user-select: auto !important;font-size: 10px;">-</span>
                        <input type="text" class="form-control form-control-sm" id="ph3" name="ph3" placeholder="${ph3}" autocomplete="off">
                    </div>
                </div>
            </div>
			<div class="col" style="margin-bottom:25px;">
            	<div>
            	<label for="resident1" class="form-label">관심사항</label>
				</div>
				<div style="user-select: auto !important;display: flex;justify-content: center;">
				<span class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter" value="동물" id="동물"  <c:if test='${fn:contains(dto.inters, "동물")}'>checked="checked"</c:if>>
					<label class="custom-control-label" for="동물">동물</label>
				</span>
				<span class="custom-control custom-checkbox mx-2">
					<input type="checkbox" class="custom-control-input" name="inter" value="영화" id="영화"   <c:if test='${fn:contains(dto.inters, "영화")}'>checked="checked"</c:if>>
					<label class="custom-control-label" for="영화">영화</label>
				</span>
				<span class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter" value="연예" id="연예" <c:if test='${fn:contains(dto.inters, "연예")}'>checked="checked"</c:if>>
					<label class="custom-control-label" for="연예">연예</label>
				</span>
				<span class="custom-control custom-checkbox ml-2">
					<input type="checkbox" class="custom-control-input" name="inter" value="스포츠" id="스포츠" <c:if test='${fn:contains(dto.inters, "스포츠")}'>checked="checked"</c:if>>
					<label class="custom-control-label" for="스포츠">스포츠</label>
				</span>
				</div>
			</div>
			<div style="margin-bottom: -20px;user-select: auto !important;">
           		<label for="grade" class="form-label">최종학력</label>
			</div>
				<select name="grade" class="custom-select mt-3 custom-select-sm" id="grade">
					<option value="">학력을 선택하세요</option>
					<option value="초등학교" <c:if test='${dto.education eq "초등학교"}'>selected="selected"</c:if>>초등학교</option>
					<option value="중학교" <c:if test='${dto.education eq "중학교"}'>selected="selected"</c:if>>중학교</option>
					<option value="고등학교" <c:if test='${dto.education eq "고등학교"}'>selected="selected"</c:if>>고등학교</option>
					<option value="대학교" <c:if test='${dto.education eq "대학교"}'>selected="selected"</c:if>>대학교</option>
				</select>
			<div class="col" style="margin-top:25px">
           		<label for="resident1" class="form-label">자기소개</label>
				<textarea class="form-control" rows="5" name="self" id="self" placeholder="${dto.selfIntroduce}"></textarea>
			</div>
			<div class="col">
		       <img id="preview" style="width: 300px; height: 300px; margin-top: 10px" src="/image/${image}" />
		       <input type="file" name="image" id="ocr" style="display:inline-block" /><br />
		     </div>
            <button class="btn btn-primary" style="margin-top:25px" id="data">수정하기</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
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
   document.querySelector('#ocr').onchange=(e)=>{
   	const reader = new FileReader();
       reader.readAsDataURL(e.target.files[0]);
       reader.onload=(event)=>{
       document.querySelector('#preview').src=event.target.result;
       };
   };
	window.addEventListener('DOMContentLoaded',function(){

		var pwd1 = document.querySelector("#pwd1");
		var pwd2 = document.querySelector("#pwd2");
		var name = document.querySelector("#name");
		var pid1 = document.querySelector("#pid1");
		var pid2 = document.querySelector("#pid2");
		var ph1 = document.querySelector("#ph1");
		var ph2 = document.querySelector("#ph2");
		var ph3 = document.querySelector("#ph3");
		var self =  document.querySelector("#self");
		var form1 = document.querySelector("#form1");
		var btn = document.querySelector("#data");
		
		pwd1.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			pwd1.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		pwd2.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			pwd2.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		name.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			name.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		pid1.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			pid1.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		pid2.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			pid2.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		ph1.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			ph1.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		ph2.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			ph2.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		ph3.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			ph3.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		self.onfocus = function(e){
			var temp = e.target.placeholder;
			e.target.placeholder="";
			self.onblur = function(e){
				if(e.target.value.trim() == "")
				e.target.placeholder=temp
			}
		}
		form1.onsubmit = function(e){
			if(pwd1.value != pwd2.value){
	            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다!");
	            pwd2.placeholder = "";
	            pwd2.focus();
	            e.preventDefault();
	        }else if(pid1.value.trim() != ""){
	        	if(pid2.value == null || pid2.value.trim().length==0){
	        		console.log(pid1.value)
	        		alert("주민번호를 입력하세요!");
	                pid2.placeholder = "";
	                pid2.focus();
	                e.preventDefault();
	        	}
	        }else if(ph1.value.trim() != ""){
	        	if(ph2.value.trim() == ""){
	        		alert("핸드폰 번호를 입력하세요!");
	        		ph2.placeholder = "";
	        		ph2.focus();
	                e.preventDefault();
	        	}else if(ph3.value.trim() == ""){
	        		alert("핸드폰 번호를 입력하세요!");
	        		ph3.placeholder = "";
	        		ph3.focus();
	                e.preventDefault();
	        	}
	        }
		}
	});
</script>
</body>
</html>
<jsp:include page="/template/Footer.jsp" />
