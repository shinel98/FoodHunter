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

        #my-location, #kakao-location{
            position: absolute;
            bottom: 20px;
            width: 30px;
            height: 30px;
            padding: 4px;
            border-radius: 50px;
        }

        #my-location{
            right: 20px;
            background-color: white;
            border: 1px solid #f55425;
        }

        #kakao-location{
            right: 70px;
            background-color: white;
            border: 1px solid #ffa600;
        }

        #my-location i {
            color: #FF7B54;
        }

        #kakao-location{
            color: #ffb700;
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
                            <img class="categoryImg" src="/img/category-fish-bread.png" alt="category image">
                        </div>
                        <div class="col-6" id="info-text">
                            <p id="name">그할마 붕어빵</p>
                            <p id="category">#붕어빵</p>
                        </div>
                    </div>
                    <div id="map-section" class="card">
                        <!--카카오 지도 열기 & 길찾기
                                link 마지막에 가게 이름, 위도, 경도 넣으면 도착지로 자동 설정할 수 있음.
                            -->
                        <a id="kakao-location" href="https://map.kakao.com/link/to/test,37.402056,127.108212" title="길찾기" style="z-index:3;"><i class="bi bi-map-fill"></i></a>
                        <!--현재 내 위치로 이동 버튼-->
                        <button id="my-location" onclick="mylocation();" style="z-index: 3;" title="현재 내 위치로 이동"><i class="bi bi-geo-alt-fill"></i></button>
                        <script>
                            /** Todo : 현재 위치에 마커 생성되도록 수정!! **/
                            function mylocation(){
                                const container = document.getElementById('map-section'); //지도를 담을 영역의 DOM 레퍼런스
                                // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
                                if (navigator.geolocation) {
                                    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                                    navigator.geolocation.getCurrentPosition(function(position) {

                                        var lat = position.coords.latitude; // 위도
                                        var lon = position.coords.longitude; // 경도

                                        const options = { //지도를 생성할 때 필요한 기본 옵션
                                            center: new kakao.maps.LatLng(lat, lon), //지도의 중심좌표.
                                            level: 3 //지도의 레벨(확대, 축소 정도)
                                        };
                                        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

                                        var message = '<div style="padding:5px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다

                                        // 마커와 인포윈도우를 표시합니다
                                        displayMarker(map, message);
                                    });
                                }
                            }

                            // 지도에 마커와 인포윈도우를 표시하는 함수입니다
                            function displayMarker(locPosition, message) {

                                // 마커를 생성합니다
                                var marker = new kakao.maps.Marker({
                                    map: map,
                                    position: locPosition
                                });

                                var iwContent = message, // 인포윈도우에 표시할 내용
                                    iwRemoveable = true;

                                // 인포윈도우를 생성합니다
                                var infowindow = new kakao.maps.InfoWindow({
                                    content : iwContent,
                                    removable : iwRemoveable
                                });

                                // 인포윈도우를 마커위에 표시합니다
                                infowindow.open(map, marker);

                                // 지도 중심좌표를 접속위치로 변경합니다
                                map.setCenter(locPosition);
                            }
                        </script>
                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=453d03fdea794867e41a9d927cff2cac"></script>
                        <script>
                            // 처음 위치는 가게 table에 저장된 위도, 경도로 설정
                            const container = document.getElementById('map-section'); //지도를 담을 영역의 DOM 레퍼런스
                            const options = { //지도를 생성할 때 필요한 기본 옵션
                                center: new kakao.maps.LatLng(36.10367691445477, 129.38881155932162), //지도의 중심좌표.
                                level: 3 //지도의 레벨(확대, 축소 정도)
                            };
                            const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
                        </script>
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

