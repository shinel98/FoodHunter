<%--
  Created by IntelliJ IDEA.
  User: jang-yujin
  Date: 2022/12/31
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="representCategoryId" value="${store.categoryId}" />
<html>
<head>
    <title>방문 인증</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> <!--icon-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892&libraries=services,clusterer,drawing"></script>
<%--    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=453d03fdea794867e41a9d927cff2cac"></script>--%>
    <script type="text/javascript" src="/js/visit.js"></script>
    <script type="text/javascript" src="/js/store.js"></script>
    <style>
        .mobile-view {
            /*중앙 배치*/
            float: none;
            margin: 0 auto;
            /*모바일 기준 너비 고정*/
            width: 100%;
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
            top: -10%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 4;
            font-weight: 700;
        }

        #map {
            position: absolute;
            top: 60px;
            width: 80%;
            /*mobile -> height: 450px;*/
            height: 500px;
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

        #my-location, #kakao-location, #store-location{
            position: absolute;
            bottom: 20px;
            width: 30px;
            height: 30px;
            padding: 4px;
            border-radius: 50px;
        }

        #store-location i{
            color: #0f4bac;
            font-size: 17px;
        }
        #store-location{
            z-index:3;
            right: 20px;
            background-color: white;
            border: 1px solid #0f4bac;
        }

        #my-location{
            right: 70px;
            background-color: white;
            border: 1px solid #f55425;
        }

        #kakao-location{
            right: 120px;
            background-color: white;
            border: 1px solid #ffa600;
        }

        #my-location i {
            color: #FF7B54;
        }

        #kakao-location{
            color: #ffb700;
        }

        .progress>div>img, .progress>div>input {
            position: absolute;
            right: 13px;
            top: 16px;
        }

        .progress {
            width: 95%;
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
            /*left: 37%;*/
        }

        #info-text{
            position: relative;
        }
        #info-text p{
            position: absolute;
            left: 50px;
        }
        #info-text p:nth-child(2){
            top: 30px;
        }

        .categoryImg{
            margin-right: 6%;
        }

        .btn-category-apply-modal{
            color: white;
            background-color: #ffb700;
            border-radius: 20px;
            padding: 10px 20px;
            width: 100px;
            float: left;
            margin-top: 37px;
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
                <div id="map" class="card shadow">
                    <h4>가게 근처에서<br>방문인증을 할 수 있어요!</h4>
                    <div id="info" class="row">
                        <div class="col-1" style="padding-top: 5px;padding-bottom:5px;">
                            <c:forEach var="cat" items="${categoryList}">
                                <c:if test="${cat.id == representCategoryId}">
                                    <img class="categoryImg" src="${cat.icon}" alt="category image">
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="col-6" id="info-text">
                            <p id="name">${store.name}</p>
                            <p id="category">
                                <c:forEach var="cat" items="${categoryList}">
                                    <c:if test="${cat.id == representCategoryId}">#${cat.categoryName}</c:if>
                                </c:forEach>
                            </p>
                        </div>
                    </div>
                    <div id="map-section" class="card">
                        <!--카카오 지도 열기 & 길찾기 : link 마지막에 가게 이름, 위도, 경도 넣으면 도착지로 자동 설정할 수 있음-->
                        <a id="kakao-location" href="https://map.kakao.com/link/to/${store.name},${storeMarker.xLocation},${storeMarker.yLocation}" title="길찾기" style="z-index:3;"><i class="bi bi-map-fill"></i></a>
                        <!--현재 내 위치로 이동 버튼-->
                        <button id="my-location" onclick="mylocation();" style="z-index: 3;" title="현재 내 위치로 이동"><i class="bi bi-geo-alt-fill"></i></button>
                        <!--가게 위치로 이동 버튼-->
                        <button id="store-location" onclick="storeLocation();" title="가게 위치로 이동"><i class="bi bi-shop"></i></button>
                    </div>
                </div>
            </div>

            <!--footer-->
            <footer id="footer" class="fixed-bottom border border-black mobile-view bg-white shadow">
                <form action="/visit/authenticate" onsubmit="return validateForm();">
                    <input type="hidden" name="userId" value=1>
                    <input type="hidden" name="storeId" value=${visitForm.storeId}>

                    <p>5m 이내에 접근하면 붕어빵 아이콘을 눌러서 인증하세요.</p>
                    <!--방문인증하기-->
                    <div class="progress">
                        <!--남은 거리에 따라 width %로 진행 상황 표시-->
                        <div id="progress-bar" class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                                <input class="col btn-category-apply-modal" type="submit" id="submit-btn" value="인증하기">
                            <p id="left-distance">인증까지 m</p>
                        </div>
                    </div>
                </form>
            </footer>

        </div>
    </div>
</div>

<script>
    $(function(){
        calculateDistance();
        storeLocation();
    });

    function storeLocation(){

        // 처음 위치는 가게 table에 저장된 위도, 경도로 설정
        const container = document.getElementById('map-section'); //지도를 담을 영역의 DOM 레퍼런스



        const options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(${storeMarker.xLocation}, ${storeMarker.yLocation}), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };
        const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        // 마커 이미지의 이미지 주소입니다
        const imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        const imageSize = new kakao.maps.Size(24, 35);

        // 마커 이미지를 생성합니다
        const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: new kakao.maps.LatLng(${storeMarker.xLocation}, ${storeMarker.yLocation}), // 마커를 표시할 위치
            title: "${store.name}", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage // 마커 이미지
        });
    }
    function calculateDistance(){

        var myLat, myLon;
        var destLat, destLon;   // Todo : DB 연동해서 목적지 주소 넣기
        // 목적지 -> 임의로 테스트
        destLat =  ${storeMarker.xLocation};
        destLon = ${storeMarker.yLocation};
        var destLatSec = destLat.toFixed(15)*60*60;
        var destLonSec = destLon.toFixed(15)*60*60;
        var element = document.getElementById("left-distance");

        setInterval(function(){
            if (navigator.geolocation) {
                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function(position) {
                    myLat = position.coords.latitude; // 위도
                    myLon = position.coords.longitude; // 경도
                });
            }
            var myLatSec = (myLat.toFixed(15))*60*60;
            var myLonSec = (myLon.toFixed(15))*60*60;
            var gapLat = (myLatSec > destLatSec) ? myLatSec - destLatSec : destLatSec - myLatSec;
            var gapLon = (myLonSec > destLonSec) ? myLonSec - destLonSec : destLonSec - myLonSec;
            var meterLat = gapLat*30.887;
            var meterLon = gapLon*24.778;
            var distance = Math.sqrt(Math.pow(meterLon, 2) + Math.pow(meterLat, 2));
            element.innerHTML = "인증까지 " + distance.toFixed(0) + " m";
        }, 10);
    }

    function validateForm(){
        var element = document.getElementById("left-distance");
        var str = element.innerText.split(" ");
        if(str[1] > 5){
            alert("5m 이내에 접근해야 인증이 가능합니다.")
            return false;
        }
    }
</script>
</body>
</html>

