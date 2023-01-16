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
    <link href="/css/visit.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=453d03fdea794867e41a9d927cff2cac"></script>
    <script type="text/javascript" src="/js/visit.js"></script>
    <script type="text/javascript" src="/js/store.js"></script>
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
                            <img class="categoryImg" src="/img/category-fish-bread.png" alt="category image">
                        </div>
                        <div class="col-6" id="info-text">
                            <p id="name">그할마 붕어빵</p>
                            <p id="category">#붕어빵</p>
                        </div>
                    </div>
                    <div id="map-section" class="card">
                        <!--카카오 지도 열기 & 길찾기 : link 마지막에 가게 이름, 위도, 경도 넣으면 도착지로 자동 설정할 수 있음-->
                        <a id="kakao-location" href="https://map.kakao.com/link/to/test,37.402056,127.108212" title="길찾기" style="z-index:3;"><i class="bi bi-map-fill"></i></a>
                        <!--현재 내 위치로 이동 버튼-->
                        <button id="my-location" onclick="mylocation();" style="z-index: 3;" title="현재 내 위치로 이동"><i class="bi bi-geo-alt-fill"></i></button>
                    </div>
                </div>
            </div>

            <!--footer-->
            <footer id="footer" class="fixed-bottom border border-black mobile-view bg-white shadow">
                <form action="/visit/authenticate" method="post">
                    <!--임의로 1, 1로 설정해서 controller에 넘김-->
                    <input type="number" name="usrId" value=1 style="display:none">
                    <input type="number" name="storeId" value=1 style="display:none">

                    <p>5m이내에 접근하면 붕어빵 아이콘을 눌러서 인증하세요.</p>
                    <!--방문인증하기-->
                    <div class="progress">
                        <!--남은 거리에 따라 width %로 진행 상황 표시-->
                        <div id="progress-bar" class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                            <input class="col btn-category-apply-modal" type="submit" id="submit-btn" value="인증하기">
                            <!--<img class="categoryImg" src="/img/category-fish-bread.png" class="col" alt="category image">-->
                            <!--Todo: 남은 거리 계산-->
                            <p id="left-distance">인증까지 500m</p>
                        </div>
                    </div>
                </form>
            </footer>

        </div>
    </div>
</div>

<script>
    function calculateDistance(){

        var myLat, myLon;
        var destLat, destLon;   // Todo : DB 연동해서 목적지 주소 넣기
        // 목적지 -> 임의로 테스트
        destLat =  36.08618059199135;
        destLon = 129.41260195413844;
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
            element.innerHTML = distance.toFixed(0) + "m";
        }, 10);
    }
</script>
</body>
</html>

