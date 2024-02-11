<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/template/Top.jsp" />
<div class="container" style="min-height: 100vh; margin-top: 60px; background: linear-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0.7)), url('/HanMinCheolProj2/images/view.jpg') no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">
	<div class="container" style="margin-top: 50px">
		<div class="jumbotron">
			<h1>
				글 상세보기 <small>상세보기 페이지 입니다</small>
			</h1>
		</div>
		<table class="table table-bordered">
			<tbody class="table-sm">
				<tr>
					<th class="w-25 bg-dark text-white text-center">번호</th>
					<td>${noRank}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">올린이</th>
					<td>${record.id}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">등록일</th>
					<td>${record.postDate}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">조회수</th>
					<td id="down-count">${record.vistCount}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">다운수</th>
					<td id="down-count">${record.downCount}</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">자료 파일</th>
					<td>
						<ul class="list-unstyled">
	
							<c:forEach var="file" items="${fn:split(record.attachFile,',') }">
								<li>
									<a class="down-file${loop.count}" href="<c:url value="/bbs/Download.ict?filename=${file}&no=${record.no}"/>">${file}
										<c:if test="${file.length()!=0}">
										[${file.length()}KB]
										</c:if>
									</a>
								</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<th class="w-25 bg-dark text-white text-center">제목</th>
					<td>${record.title}</td>
				</tr>
				<tr>
					<th class="bg-dark text-white text-center" colspan="2">내 용</th>
				</tr>
				<tr>
					<td colspan="2">${record.content}</td>
				</tr>
			</tbody>
		</table>
		<c:if test="${record.id == sessionScope.id}">
		<!-- 수정/삭제/목록 컨트롤 버튼 -->
		<div class="text-center"
			style="display: flex; justify-content: center; align-items: center; gap: 7px;">
		<form>
			<a href="<c:url value="/bbs/Edit.ict"/>?no=${record.no}"
					class="btn btn-success">수정</a>
		</form>
		<form action="<c:url value="/bbs/Delete.ict"/>" method="POST"
				id="delete">
			<input type="hidden" name="no" value="${record.no}" /> <input
					type="hidden" name="nowPage" value="${param.nowPage}" /> <input
					type="hidden" name="orignalFileName" value="${record.attachFile }" />
			<input type="submit" class="btn btn-success" value="삭제" />
		</form>
		</c:if>
			<form>
				<a href="<c:url value="/bbs/List.ict"/>" class="btn btn-success">목록</a>
			</form>
		</div>
		<!-- 댓글 -->
		<form id="form" class="form-inline col-sm-12 d-flex justify-content-center mt-3">
			<input type="hidden" name="no" value="${record.no}" />
			<input type="hidden" name="id" value="${record.id}" />
			<!-- 댓글 수정용 -->
			<input type="hidden" name="cno" /> 
			<input type="text" id="text" name="text" class="form-control mx-2 w-50" placeholder="한줄 댓글을 입력하세요" /> 
			<input type="button" class="btn btn-danger mx-2" value="등록" id="submit" />
		</form>
		<div class="row d-flex justify-content-center mt-3">
			<div class="col-sm-8">
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th class="col-2">작성자:</th>
							<th>코멘트</th>
							<th class="col-2">작성일</th>
							<th class="col-2">삭제</th>
						</tr>
					</thead>
					<tbody class="table-sm down-file-body" id="comments-list">
						<c:if test="${empty comments}" var="isEmpty">
							<tr id="empty-comment">
								<td colspan="4">등록된 한줄 댓글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not isEmpty }">
							<c:forEach var="comment" items="${comments}">
								<tr >
									<td>${comment.id}</td>
									<td class="text-left" title="${comment.cNo}">${comment.text}</td>
									<td>${comment.writeDate}</td>
									<td>
									<c:if test="${sessionScope.id==comment.id}" var="isSame">
										<button class="btn btn-info btn-sm my-delete" id="in">입력</button> 
										<button class="btn btn-info btn-sm my-delete" id="de">삭제</button> 
									</c:if>
									<c:if test="${not isSame }">
										삭제불가
									</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
	
					</tbody>
				</table>
			</div>
		</div>
	<div>
	<!-- 페이징 출력 -->
	${pagingString}
	<!-- 이전글/다음글 -->
<div class="row" style="user-select: auto !important;margin-bottom: 66px;" >
  <!-- 이전글 -->
  <div class="col-6" style="user-select: auto !important;margin-bottom: 38px;">
    <div class="card btn-outline-danger mb-3" style="opacity:0.8; width: 100%; height:100%;">
      <div class="card-header">이전글</div>
      <div class="card-body">
        <c:if test="${map.get('PREV') == null}" var="result">
          <p class="card-text">이전글이 없습니다</p>
        </c:if>
        <c:if test="${!result}">
          <a href="<c:url value='/bbs/View.ict?no=${map.get("PREV").getNo()}'/>" style="color: red" id="pre">${map.get("PREV").getTitle()}</a>
        </c:if>
      </div>
    </div>
  </div>
  <!-- 다음글 -->
  <div class="col-6" style="user-select: auto !important;margin-bottom: 38px;">
    <div class="card btn-outline-success mb-3" style="opacity:0.8; width: 100%; height:100%;">
      <div class="card-header">다음글</div>
      <div class="card-body">
        <c:if test="${map.get('NEXT') == null}" var="result1">
          <p class="card-text">다음글이 없습니다</p>
        </c:if>
        <c:if test="${!result1}">
          <a href="<c:url value='/bbs/View.ict?no=${map.get("NEXT").getNo()}'/>" style="color: green" id="nex">${map.get("NEXT").getTitle()}</a>
        </c:if>
      </div>
    </div>
  </div>
</div>
<script>
	//수정/삭제버튼 클릭시 이벤트 처리
	var buttons = document.querySelectorAll('#delete');
	buttons.forEach(function(button) {
		button.addEventListener('click', function(event) {
			if (!confirm('정말로 삭제 하시겠습니까?')) {
				event.preventDefault();
			}
		});
	});
	
	
const form = document.querySelector('#form');
	
	document.querySelector("#submit").onclick=(e)=>{//버튼 클릭 이벤트 처리
		console.log(e.target.value);
		let url,method;
		 
		if(e.target.value==='등록'){
			url="<c:url value="/comments/Write.do"/>";
			method="POST";
		}
		else{
			url="<c:url value="/comments/Edit.do"/>";
			method="POST";
		}
		
		const comment = new FormData(form);
		
		const data = {};
	    for (let [key, value] of comment.entries()) {
	        data[key] = value;
	    }
	    console.log(data);
		//ajax로 요청
		fetch(url,
            {method: method,
            headers: {
                'Content-Type': 'application/json'
            },body: JSON.stringify(data)})
		.then(response=>response.json())
		.then(data=>{//서버에서 정상적으로 데이타 수신시
			console.log(data);
			if(e.target.value==='등록'){//등록후 화면 갱신
				//등록된 한줄 댓글이 없습니다. 삭제
				if(document.querySelector('#empty-comment')!=null){
					document.querySelector('#empty-comment').remove();
				}
				
				let tr = document.createElement("tr");
				
				const values=[data.id,data.text,data.writeDate,'<button class="btn btn-info btn-sm my-delete">삭제</button>'];
				for(let i=0;i < values.length ;i++){
					let td=document.createElement("td");
					if(i!=values.length-1){
						let textNode= document.createTextNode(values[i]);
						//제목뿌려주는 TD에는 텍스트 정렬용 클래스 추가
						if(i==1){
							td.setAttribute("class","text-left");
							td.setAttribute("title",data.cno);
						}
						td.append(textNode);
					}				
					else{
						td.innerHTML=values[i];
					}
					tr.append(td);
				}
				document.querySelector('#comments-list').prepend(tr);
				
			}
			else{//수정후 화면 갱신
				//다시 등록으로 버튼 텍스트 변경
				document.querySelector('#submit').value='등록';
				//입력한 값을 제목 수정
				document.querySelector("td[title='"+data.cno+"']").textContent=data.text;
				//수정한 제목 색상 바꾸기-눈에 띄라고
				//document.querySelector("td[title='"+data.cno+"']").style.color='#FF0000';
			}
			//입력값 클리어 및 포커스 주기
			document.querySelector('#text').value="";
			document.querySelector('#text').focus();
			
		})
		.catch(err=>console.log(err));
	};	
	
	//댓글 제목 클릭시 수정처리
	document.querySelector('#comments-list').onclick=(e)=>{
		console.log(e.target.nodeName);
		console.log(e.target.parentElement.children[1]);
		if(e.target.nodeName !=='BUTTON'){//TD인 경우 수정전 화면 변경
			//제목TD 노드 얻기
			const text= e.target.parentElement.children[1];			
			const cno = text.title;
			//위 댓글의 키로 아이디 얻기
			fetch("<c:url value="/comments/Edit.do?cno="/>"+cno)
			.then(response=>response.text())
			.then(id=>{
				console.log('댓글 작성자 아이디:',id);
				//세션영역의 아이디와 댓글 작성자의 아이디가 일치한 경우
				console.log("'${sessionScope.id}'===id",'${sessionScope.id}'===id)
				console.log('${id}')
				if('${sessionScope.id}'===id){
					//댓글 입력상자의 값을 클릭한 행의 제목으로 변경
					document.querySelector('#text').value=text.textContent;
					//버튼 텍스트를 수정으로 변경
					document.querySelector('#submit').value='수정';
					//히든타입인 NAME="cno"의 value를 댓글 키(cno)로 설정
					document.querySelector('input[name=cno]').value=cno;
				}
			})
			.catch(err=>console.log(err));			
		}//////////
		else if(e.target.nodeName==="BUTTON" && e.target.textContent==="삭제"){
			console.log(e.target.parentElement.previousElementSibling.previousElementSibling.title);
			const cno=e.target.parentElement.previousElementSibling.previousElementSibling.title;
			fetch("<c:url value="/comments/Delete.do"/>",
					{method:"POST",
					headers:{"Content-Type":"application/json"},
					body:JSON.stringify({"cno":cno})})
					.then(response=>response.text())
					.then(data=>{
						console.log(data+'행의 댓글이 삭제 되었어요');
						//클릭한 tr삭제
						e.target.parentElement.parentElement.remove();
					})
					.catch(err=>console.log(err));
		}
	};
	//메모글 삭제
	const isDelete=()=>{
		if(confirm("삭제 할래요?")){
			location.replace("<c:url value="/onememo/bbs/${record.no}/Delete.do"/>");
		}		
	};
	  const prevLink = document.querySelector('#pre');
	  const nextLink = document.querySelector('#nex');

	  prevLink.addEventListener('mouseover', function() {
	    prevLink.style.color = 'white';
	  });

	  prevLink.addEventListener('mouseout', function() {
	    prevLink.style.color = 'red';
	  });

	  nextLink.addEventListener('mouseover', function() {
	    nextLink.style.color = 'white';
	  });

	  nextLink.addEventListener('mouseout', function() {
	    nextLink.style.color = 'green';
	  });
</script>

<jsp:include page="/template/Footer.jsp" />
