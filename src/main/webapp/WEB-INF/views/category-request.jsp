<%--
  Created by IntelliJ IDEA.
  User: narinhan
  Date: 2023/01/03
  Time: 8:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>카테고리 신청</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <style>
        #btn-back {
            padding: 12px;
        }
    </style>
    <script>
        /** 뒤로가기 **/
        function back() {
            history.back();
        }
    </script>
</head>
<body>
<div class="container-fluid p-0">
    <div class="row g-0 text-center min-vh-100">
        <div class="col">공백</div>
        <div class="col border border-black">
            <header id="header" class="fixed-top border border-black mobile-view bg-white shadow">
                <!--뒤로 가기 버튼-->
                <div style="width: 10%; float: left;">
                    <button type="button" class="col btn" onclick="back();">
                        <i id="btn-back" class="bi bi-chevron-left"></i>
                    </button>
                </div>
                <div style="width: 80%; float:left;">
                    <h5 class="card-title text-center my-2 fw-light fs-5">카테고리 신청</h5>
                </div>
            </header>
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body bg-light p-4 p-sm-5">
                    <form method="post">
                        <input type="text" class="form-control mb-3" id="category" name="category" placeholder="카테고리를 입력해주세요!">
                        <div class="d-grid my-3">
                            <span class="text-muted small">카테고리 신청 후, 관리자 승인까지</span>
                            <span class="text-muted small">2-3일이 소요될 수 있습니다.</span>
                        </div>
                        <div class="d-grid my-3">
                            <button class="btn btn-block btn-warning" type="submit" value="신청하기">신청하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col">공백</div>
    </div>
</div>
</body>
</html>