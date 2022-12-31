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

        #content {
            position: relative;
            border: none;
            top: 130px;
        }

        /*footer : 즐겨찾기, 방문인증하기*/
        footer > div{
            float: left;
        }

        footer {
            min-height: 80px;
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
            height: 86px;
        }

        #footer {
            border-radius: 20px 20px 0 0;
            padding-left: 15px;
            padding-top: 30px;
        }

        h4 {
            text-align: center;
            position: absolute;
            top: 40px;
            left: 28%;
            font-weight: 700;
        }

        #map {
            position: absolute;
            top: 130px;
            width: 80%;
            height: 450px;
            margin-left: 10%;
            border-radius: 20px;
            padding: 15px;
        }

        #name {
            text-align: left;
            font-size: 20px;
            font-weight: 500;
            margin: 0;
        }

        #category {
            text-align: left;
        }

        .categoryImg {
            height: 50px;
            width: auto;
        }

        #map-section {
            height: 80%;
        }

        #my-location{
            position: absolute;
            bottom: 20px;
            right: 20px;
            width: 30px;
            height: 30px;
            padding: 4px;
            border-radius: 50px;
            background-color: white;
            border: 1px solid #f55425;
        }

        #my-location i {
            color: #FF7B54;
        }

        .progress>div>img {
            position: absolute;
            right: 13px;
            top: 16px;
        }
        .progress {
            width: 90%;
        }

        #left-distance {
            position: absolute;
            bottom: -10px;
            left: 40%;
            color: black;
            font-weight: 700;
        }

        footer>p {
            position: absolute;
            top: -35px;
            left: 70px;
        }

    </style>
</head>
<body>
<div class="container p-0">
    <div id="main-row" class="row g-0 text-center min-vh-100">
        <div class="mobile-view">
            <hearder id="header" class="fixed-top border border-black mobile-view bg-white shadow">
                <!--뒤로 가기 버튼-->
                <div style="width: 10%; float: left; padding-top: 10px;">
                    <button type="button" class="col btn" onclick="back();"><i id="btn-back" class="bi bi-x-lg"></i></button>
                </div>
                <div style="width: 80%; float:left; text-align: center; margin-top: 13px;">
                    <h5>방문 인증하기</h5>
                </div>
            </hearder>
            <div id="content">
                <h4>가게 근처에서<br>방문인증을 할 수 있어요!</h4>
                <div id="map" class="card shadow">
                    <div id="info" class="row">
                        <div class="col-3" style="padding-top: 5px;padding-bottom:5px;">
                            <img class="categoryImg" src="/img/category-fish-bread.png" alt="category image">
                        </div>
                        <div class="col-6">
                            <p id="name">그할마 붕어빵</p>
                            <p id="category">#붕어빵</p>
                        </div>
                    </div>
                    <div id="map-section" class="card">
                        <!--현재 내 위치로 이동 버튼-->
                        <button id="my-location"><i class="bi bi-geo-alt"></i></button>
                        지도 넣을 예정
                    </div>
                </div>
            </div>

            <!--footer-->
            <footer id="footer" class="fixed-bottom border border-black mobile-view bg-white shadow">
                <p>5m이내에 접근하면 붕어빵 아이콘을 눌러서 인증하세요.</p>
                <!--방문인증하기-->
                <div class="progress">
                    <!--남은 거리에 따라 width %로 진행 상황 표시-->
                    <div id="progress-bar" class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                        <img class="categoryImg" src="/img/category-fish-bread.png" class="col" alt="category image" onclick="authenticate();">
                        <!--Todo: 남은 거리 계산-->
                        <p id="left-distance">인증까지 500m</p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>
<script>

    /** header: "<" 뒤로가기 버튼 클릭 **/
    function back() {
        history.back();
    }

    /** footer: 방문인증하기 버튼 클릭 **/
    function visit() {
        /** Todo : 방문인증 페이지로 이동 **/
        location.href = "/visit";
    }

    function authenticate() {
        // distance : 남은 거리 -> 임의로 설정 후 로직만 짜둠
        //let distance = 4;
        let distance = 10;
        let answer;
        if(distance > 5){
            alert("5m 이내로 접근해야 인증할 수 있습니다.");
        }
        else {
            answer = confirm("인증하시겠습니까?");
            if(answer == true) {
                alert("방문인증 되었습니다.")
            }
        }

    }

</script>
</body>
</html>

