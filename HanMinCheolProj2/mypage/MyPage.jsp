<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/template/Top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
    body {
      background-color: #d8e4ef;
    }
</style>


</head>
<body>
<div class="container" style="margin-top: 60px">
<div class="card mb-3" style="max-width: 100%;">
 <div class="container marketing">
    <!-- Three columns of text below the carousel -->
<div class="row" style="margin-top: 20px">
    <div class="col-lg-4">
        <img id="preview" class="img-thumbnail" src="/image/${image}" alt="${data.name}'s image" style="width: 100%; height: 343px;" />
    </div>
    <div class="col-lg-8">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title">${data.name}</h2>
                <p class="card-text">자기소개 : ${data.selfIntroduce}</p>
                <table class="table table-striped">
                    <tbody>
                        <tr>
                            <th scope="row" style="text-align: center;">주소</th>
                            <td>${data.addr}</td>
                        </tr>
                        <tr>
                            <th scope="row" style="text-align: center;">핸드폰 번호</th>
                            <td>${data.phoneNumber}</td>
                        </tr>
                        <tr>
                            <th scope="row" style="text-align: center;">관심사항</th>
                            <td>${data.inters}</td>
                        </tr>
                        <tr>
                            <th scope="row" style="text-align: center;">학력</th>
                            <td>${data.education}</td>
                        </tr>
                        <tr>
                            <th scope="row" style="text-align: center;">아이디 만든 날짜</th>
                            <td>${data.regidate}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>




    <hr class="featurette-divider">
   <div class="container featurette">
    <div class="row">
      <div class="col-md-12">
        <h2 class="text-center font-size-24 font-weight-bold text-info-emphasis">내가 쓴 게시글</h2>
        <div class="table-responsive">
          <table class="table table-striped table-hover text-center">
            <!-- Table header -->
              <tr>
                <td>글번호</td>
                <td>제목</td>
                <td>작성자</td>
                <td>자료파일</td>
                <td>다운수</td>
                <td>조회수</td>
                <td>좋아요</td>
                <td>등록일</td>
              </tr>
            <!-- Table body -->
              <c:if test="${empty records}" var="isEmpty">
				<tr>
					<td colspan="8">등록된 자료가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not isEmpty}">
				<c:forEach var="record" items="${records}" varStatus="loop">
					<tr>
						<td>${record.noRank}</td>
						<td class="text-left"><a href="<c:url value="/bbs/View.ict?no=${record.no}"/>">${record.title}</a></td>
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
          </table>
        </div>
        <div class="d-flex justify-content-center">
          <!-- Pagination -->
          ${pagingString}
        </div>
        <div class="mt-3">
          <!-- Search form -->
          <form class="form-inline justify-content-center" style=";margin-bottom: 35px;" method="post">
            <select class="form-control" name="searchColumn">
              <option value="title">제목</option>
              <option value="content">내용</option>
              <option value="name">작성자</option>
            </select>
            <input type="text" class="form-control mx-2 my-2" placeholder="검색어를 입력하세요" name="searchWord" />
            <button type="submit" class="btn btn-primary">검색</button>
          </form>
        </div>
      </div>
    </div>
  </div>   
    
    
<%-- 
    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">내가 쓴 게시글 </h2>
       <table class="table table-dark table-hover text-center" style="width:1050px">
		<thead>
			<tr>
				<th class="col-1">글번호</th>
				<th class="col-4">제목</th>
				<th class="col-1">작성자</th>
				<th class="col-2">자료파일</th>
				<th class="col-1">다운수</th>
				<th class="col-1">조회수</th>
				<th class="col-1">좋아요</th>
				<th class="col-2">등록일</th>
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
						<td class="text-left"><a href="<c:url value="/bbs/View.ict?no=${record.no}"/>">${record.title}</a></td>
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
<div style="width:1050px">
	<!-- 페이징 출력 -->
	${pagingString}
</div>
<div>
		<!-- 검색 UI -->
	<form class="form-inline justify-content-center" method="post" style="width:1050px">
		<select class="form-control" name="searchColumn">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="name">작성자</option>
		</select> 
		<input type="text" class="form-control mx-2 my-2"
			placeholder="검색어를 입력하세요" name="searchWord" />
		<button type="submit" class="btn btn-primary">검색</button>
	</form>
</div>
 --%>
<script>
	var tbody = document.querySelector('.down-file-body');
	var file = document.querySelector('.list-unstyled');
	file.onclick=(e)=>{
		if(e.target.nodeName==='A'){
			var className = e.target.className;
			var numbering = className.substring('down-file'.length,className.length);
			console.log('넘버링:',numbering);
			var td = e.target.parentElement.parentElement.parentElement.nextElementSibling
			var downCount=parseInt(td.textContent);
			console.log('다운수:',downCount);
			td.textContent = downCount+1;
		}
	};
	var likesElements = document.querySelectorAll('.likes');
	likesElements.forEach(like => {
		like.onclick=(e)=>{
			if(e.target.nodeName==='A'){
				//like.textContent=parseInt(like.textContent)+1;
			var no = like.title;
	        fetch("<c:url value='/bbs/AjaxLikes.ict?no="+no+"'/>", {
	            method: 'GET',
	            headers: {
	                'Content-Type': 'application/json'
	            },
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

      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
<jsp:include page="/template/Footer.jsp" />
</html>