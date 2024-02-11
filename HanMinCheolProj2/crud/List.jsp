<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/template/Top.jsp" />
<style>
	a {
		color: #8B4513;
	}
    .btn {
        background-color: #F5F5DC;
        color: #8B4513;
        border-color: #8B4513;
        animation: glowing 2s infinite;
    }
    .btn:hover {
        background-color: #DEB887;
        border-color: #8B4513; /* 버튼 테두리 색상을 갈색으로 변경 */
    }
     @keyframes glowing {
        0% { box-shadow: 0 0 2px #8B4513, 0 0 2px #8B4513, 0 0 2px #8B4513, 0 0 2px #8B4513; }
        100% { box-shadow: 0 0 3px #8B4513, 0 0 3px #8B4513, 0 0 3px #8B4513, 0 0 4px #8B4513; }
    }
</style>
<div class="container" style="min-height: 100vh; margin-top: 50px; background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)), url('/HanMinCheolProj2/images/back.jpg') no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">
	<div class="jumbotron bg-light" style="background: rgba(255,255,255,0.7);">
		<h1 class="text" style="color: #8B4513;">
			게시판 목록
		</h1>
	</div>
<div class="text-right mb-2">
    <a href="<c:url value='/data/Write.ict'/>" class="btn btn-outline-primary">글쓰기</a>
</div>
	<div class="table-responsive">
		<table class="table table-striped table-hover text-center shadow-lg" style="background: rgba(255,255,255,0.7);">
			<thead class="thead-light">
				<tr>
					<th scope="col" class="col-1">글번호</th>
					<th scope="col" class="col-4">제목</th>
					<th scope="col" class="col-1">작성자</th>
					<th scope="col" class="col-2">자료파일</th>
					<th scope="col" class="col-1">다운수</th>
					<th scope="col" class="col-1">조회수</th>
					<th scope="col" class="col-1">좋아요</th>
					<th scope="col" class="col-2">등록일</th>
				</tr>
			</thead>
		<tbody class="table-sm down-file-body">
			<c:if test="${empty records}" var="isEmpty">
				<tr>
					<td colspan="8">등록된 자료가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not isEmpty}">
				<c:forEach var="record" items="${records}" varStatus="loop">
					<tr>
						<td>${record.noRank}</td>
						<td class="text-left"><a href="<c:url value="/bbs/View.ict?no=${record.no}&noRank=${record.noRank}"/>">${record.title}[${record.totalR}]</a></td>
						<td>${record.id}</td>
						<td class="text-left">
							<ul class="list-unstyled">
								<c:forEach  var="file" items="${fn:split(record.attachFile,',') }">
									<li><a class="down-file${loop.count}" href="<c:url value="/bbs/Download.ict?filename=${file}&no=${record.no}"/>"/>${file}
									<c:if test="${file.length()!=0}">
									[${file.length()}KB]</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</td>
						<td>${record.downCount}</td>
						<td>${record.vistCount}</td>
						<td><a class="likes" href="#" title="${record.no}">${record.likes == null ? "0" : record.likes}</a></td>
						<td>${record.postDate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	${pagingString}
	<form class="form-inline justify-content-center" method="post">
	    <select class="form-control" name="searchColumn">
	        <option value="title">제목</option>
	        <option value="content">내용</option>
	        <option value="name">작성자</option>
	    </select> 
	    <input type="text" class="form-control mx-2 my-2" placeholder="검색어를 입력하세요" name="searchWord" />
	    <button type="submit" class="btn btn-primary">검색</button>
	</form>
</div>
<jsp:include page="/template/Footer.jsp" />
<script>
	var tbody = document.querySelector('.down-file-body');
	var file = document.querySelector('.list-unstyled');
	file.onclick=(e)=>{
		if(e.target.nodeName==='A'){
			var className = e.target.className;
			var numbering = className.substring('down-file'.length,className.length);
			var td = e.target.parentElement.parentElement.parentElement.nextElementSibling
			var downCount=parseInt(td.textContent);
			td.textContent = downCount+1;
		}
	};
	var likesElements = document.querySelectorAll('.likes');
	likesElements.forEach(like => {
		like.onclick=(e)=>{
			if(e.target.nodeName==='A'){
	        var no = like.title;
	        fetch("<c:url value='/bbs/AjaxLikes.ict?no="+no+"'/>", {
	            method: 'GET',
	            headers: {
	                'Content-Type': 'application/json'
	            }
	        })
	        .then(response => response.json())
	        .then(data => {
	            like.textContent = data.likes;
	        })
	        .catch(error => {
	            console.error('Error:', error);
	        });
		}
	}
});
</script>
