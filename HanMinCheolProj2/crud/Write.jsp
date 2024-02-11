<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/template/Top.jsp" />
<div class="container" style="min-height: 100vh; margin-top: 50px; background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)), url('/HanMinCheolProj2/images/write.jpg') no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">
	<div class="container" style="margin-top: 50px">
	        <div class="jumbotron">
	            <h1>
	                <i class="fas fa-pencil-alt"></i> 글 작성 <small>글을 등록하세요</small>
	            </h1>
	        </div>
		<c:if test="${! empty ERROR}">
			<div class="alert alert-danger alert-dismissible">
				<button class="close" data-dismiss="alert">&times;</button>
				<strong>${ERROR}</strong>
			</div>
		</c:if>
	 <form method="post" action="<c:url value="/data/Write.ict"/>"
	        enctype="multipart/form-data">
	            <div class="form-group">
	                <label><i class="fas fa-heading"></i> 제목</label> 
	                 <input type="text"	class="form-control" placeholder="제목을 입력하세요" name="title"
					value="${ empty param.title ?"":param.title}" required>
			</div>
			<div class="form-group">
	                <label><i class="fas fa-file-alt"></i> 자료 파일</label>
	                 <input type="file"	multiple name="attachFile" class="form-control-file border">
				<!-- JSP로 포워드할 때, <input type="file">로 선택한 파일은 기본적으로 포워딩되지 않는다 -->
			</div>
			<div class="form-group">
	                <label><i class="fas fa-align-left"></i> 내용</label> 
				<textarea class="form-control" rows="5" name="content" required>${ empty param.content ?"": param.content}</textarea>
			</div>
			<button type="submit" class="btn btn-primary"><i class="fas fa-check"></i> 등록</button>
		</form>
	</div>
</div>
<jsp:include page="/template/Footer.jsp" />
