<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/template/Top.jsp" />
<div class="container" style="margin-top: 50px">
	<div class="jumbotron bg-info">
		<h1>
			자료실 수정 <small>자료 파일을 수정하세요</small>
		</h1>
	</div>
	<c:if test="${! empty ERROR}">
		<div class="alert alert-danger alert-dismissible">
			<button class="close" data-dismiss="alert">&times;</button>
			<strong>${ERROR}</strong>
		</div>
	</c:if>
	<form method="post" action="<c:url value="/bbs/Edit.ict"/>"
		enctype="multipart/form-data">
		<input type="hidden" name="no" value="${record.no}"/>
		<input type="hidden" name="originalFileName" value="${record.attachFile}"/>
		<div class="form-group">
			<label><kbd class="lead">제목</kbd></label> <input type="text"
				class="form-control" placeholder="제목을 입력하세요" name="title"
				value="${record.title}">
		</div>
		<div class="form-group">
			<label><kbd class="lead">자료 파일</kbd> </kbd></label> <input type="file"
				multiple name="attachFile" class="form-control-file border">
				${record.attachFile}
			<!-- JSP로 포워드할 때, <input type="file">로 선택한 파일은 기본적으로 포워딩되지 않는다 -->
		</div>

		<div class="form-group">
			<label><kbd class="lead">내용</kbd></label>
			<textarea class="form-control" rows="5" name="content">${record.content}</textarea>
		</div>
		<button type="submit" class="btn btn-primary">수정</button>
	</form>
</div>
<script>
	/*
	[0]은 첫번째 파일 의미
	파일 객체은 input type="file" 요소를 의미
    파일 사이즈(바이트):파일객체(자스 DOM).files[0].size
		파일 명:파일객체(자스 DOM).files[0].name
		파일 컨텐츠 타입:파일객체(자스 DOM).files[0].type
	
	*/
	
	var attatches=document.querySelector("input[type=file][name=attachFile]");
	
	//이해를 추가 코드
	attatches.onchange=()=>{
		console.log(attatches.files);//FileList타입(원소는 File타입)
		//attatches.files[0]:File타입
		console.log(attatches.files.length !=0 ? attatches.files[0]:"");
	};	
		
	var form = document.querySelector("form[enctype='multipart/form-data']");
	var totalSize=0;
	form.onsubmit=()=>{
		var files = attatches.files;
		for(var i=0; i < files.length;i++){
			console.log('파일명:%s,크기:%s바이트,컨텐츠 타입:%s',files[i].name,files[i].size,files[i].type);
			totalSize+=files[i].size;
			if(files[i].size > 1024 * 1024){
				alert("파일 하나의 최대 업로드 용량(1MB)를 초과 했어요");
				return false;
			}
		}///for
		if(totalSize > 1024 * 1024 * 5){
			alert("총 파일 최대 업로드 용량(5MB)를 초과 했어요");
			return false;
		}
	};
	
</script>

<jsp:include page="/template/Footer.jsp" />
