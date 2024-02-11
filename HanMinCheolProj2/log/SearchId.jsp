<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="col-md-7 col-lg-5 custom-form" style="user-select: auto !important; text-align-last: center;">
        <h4 class="mb-3">아이디 찾기</h4>
        <form class="needs-validation" action="<c:url value='/log/SearchId.ict'/>" method="POST" >
            <div class="row">
                <div class="col">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" required>
                    <div class="invalid-feedback">
                        이름을 입력하세요.
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <label for="resident1" class="form-label">주민번호</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="resident1" placeholder="앞 6자리" name="resident1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" id="resident2" placeholder="뒤 7자리" name="resident2" required>
                        <div class="invalid-feedback">
                            주민번호를 입력하세요.
                        </div>
                    </div>
                </div>
            </div>

            <button class="btn btn-primary" type="submit">아이디 찾기</button>
        </form>

        <hr class="my-4">

        <h4 class="mb-3">비밀번호 찾기</h4>
        <form class="needs-validation" action="<c:url value='/log/SearchPwd.ict'/>" method="POST">
            <div class="row">
                <div class="col">
                    <label for="id" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="pid" placeholder="아이디를 입력하세요" name="pwid" required >
                    <div class="invalid-feedback">
                        아이디를 입력하세요.
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <label for="resident1" class="form-label">주민번호</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="resident3" placeholder="앞 6자리"  name="resident3" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" id="resident4" placeholder="뒤 7자리" name="resident4"required>
                        <div class="invalid-feedback">
                            주민번호를 입력하세요.
                        </div>
                    </div>
                </div>
            </div>

            <button class="btn btn-primary" type="submit">비밀번호 찾기</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>

</html>
