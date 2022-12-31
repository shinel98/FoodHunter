<%--
  Created by IntelliJ IDEA.
  User: jang-yujin
  Date: 2022/12/31
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>방문 인증</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> <!--icon-->
    <link href="/css/store.css" rel="stylesheet">
    <style>
        .mobile-view {
            /*중앙 배치*/
            float: none;
            margin: 0 auto;
            /*모바일 기준 너비 고정*/
            width: 491px;
            height: auto;
        }
        /*방문인증버튼*/
        .btn-visit {
            background-color: #FF7B54;
            padding: 3px;
            border-radius: 20px;
            padding: 10px 80px;
        }
        .btn-visit:hover {
            background-color: #f55425;
            font-weight: bold;
        }

        /*footer : 즐겨찾기, 방문인증하기*/
        footer > div{
            float: left;
        }

        footer {
            min-height: 80px;
        }

        .bi-heart, .bi-heart-fill {
            margin: 10px;
        }

        .bi-chevron-left {
            float: left;
        }

        .favoriteBtn {
            color: #f55425;
        }

        #btn-back {
            padding: 12px;
        }

        #main-row {
            min-height: 170px;
        }


        #header{
            padding: 15px;
            border-radius: 0 0 20px 20px;
        }

        #footer {
            border-radius: 20px 20px 0 0;
        }

        #ask-deletion i {
            margin-right: 3px;
        }

        #share i {
            margin-right: 10px;
        }


        #distance > i, #stars > i{
            color: #f55425;
            margin-right: 6px;
            margin-left: 6px;
        }

        #monthly > p {
            font-weight: 500;
            font-size: larger;
            margin-top: 8px;
        }

        h4 {
            text-align: left;
            margin-bottom:15px;
        }


        #dayList li {
            float: left;
            width: 30px;
            height: 30px;
            border-radius: 50px;
            border: 1px solid black;
            color: black;
            margin: 4px;
        }

        #payList li {
            float: left;
            margin-top: 12px;
            margin-bottom: 8px;
            margin-right: 50px;
        }

        .review-star-list li {
            float: left;
            margin: 3px;
            color: #ffb700;
        }

    </style>
</head>
<body>
<div class="container p-0">
    <div id="main-row" class="row g-0 text-center min-vh-100">
        <div class="mobile-view">
            <hearder id="header" class="fixed-top border border-black mobile-view bg-white shadow">
                <!--뒤로 가기 버튼-->
                <div style="width: 10%; float: left;">
                    <button type="button" class="col btn" onclick="back();"><i id="btn-back" class="bi bi-chevron-left"></i></button>
                </div>
                <!--카테고리 이미지-->
                <div style="width: 80%; float:left; text-align: center;">
                    <h4>방문 인증하기-수정예정</h4>
                </div>
            </hearder>

            <!--footer-->
            <footer id="footer" class="fixed-bottom border border-black mobile-view bg-white shadow">
                <!--즐겨찾기-->
                <div class="p-3" style="width: 40%;">
                    <button type="button" class="btn favorite" onclick="favorite();">
                        <i class="bi favoriteBtn bi-heart"></i>
                        즐겨찾기
                    </button>
                </div>
                <!--즐겨찾기-->
                <!--방문인증하기-->
                <div class="p-3" style="width: 60%;">
                    <button type="button" class="text-white btn btn-visit" onclick="visit();">방문인증하기</button>
                </div>
                <!--방문인증하기-->
            </footer>
            <!--footer-->
        </div>
    </div>
</div>
<script>

    /** header: "<" 뒤로가기 버튼 클릭 **/
    function back() {
        /** Todo : 이전화면으로 돌아가기 **/
    }

    /** footer: 방문인증하기 버튼 클릭 **/
    function visit() {
        /** Todo : 방문인증 페이지로 이동 **/
        location.href = "/visit";
    }

</script>
</body>
</html>

