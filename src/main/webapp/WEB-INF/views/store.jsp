<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>가게 상세 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> <!--icon-->
    <link href="/css/store.css" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style>
        body {
            overflow: hidden;
            overscroll-behavior-x: none;
            position: relative;
        }
        .mobile-view {
            /*중앙 배치*/
            float: none;
            margin: 0 auto;
            /*모바일 기준 너비 고정*/
            /*width: 491px;*/
            width: 100%;
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

        #categoryImg {
            height: 40px;
            width: auto;
        }

        /*footer와 header 제외한 content 공간*/
        #content{
            position: relative;
            top: 75px;
        }

        #map-section {
            height: 600px;
            z-index: 0;
        }

        #content-main-board {
            position: absolute;
            top: 70%;
            left: 10%;
            width: 80%;
            height: auto;
            padding: 15px;
        }

        #content {
            position: relative;
            border: none;
        }

        #content-information {
            position: absolute;
            top: 30px;
            width: 30%;
            height: 40%;
            padding: 15px;
        }

        #content-review {
            position: absolute;
            top: 160px;
            width: 100%;
            height: 660px;
            padding: 15px;
        }

        #header{
            padding: 15px;
            border-radius: 0 0 20px 20px;
        }

        #footer {
            border-radius: 20px 20px 0 0;
        }

        #my-location, #kakao-location{
            position: absolute;
            top: -40px;
            width: 30px;
            height: 30px;
            padding: 4px;
            border-radius: 50px;
        }

        #my-location{
            right: 5px;
            background-color: white;
            border: 1px solid #f55425;
        }

        #kakao-location{
            right: 50px;
            background-color: white;
            border: 1px solid #ffa600;
        }

        #ask-deletion {
            position: absolute;
            bottom: -40px;
            right: 5px;
            border: none;
            background-color: transparent;
        }

        #ask-deletion i {
            margin-right: 3px;
        }

        #my-location, #kakaotalk-sharing-btn i {
            color: #f55425;
        }
        #kakao-location i {
            color: #ffa600;
        }

        #kakaotalk-sharing-btn i {
            margin-right: 10px;
        }

        .smallTxt {
            font-size: smaller;
        }

        #distance > i, #stars > i{
            color: #f55425;
            margin-right: 6px;
            margin-left: 6px;
        }

        #distance, #stars {
            margin: auto;
            float: left;
        }

        .center{
            margin: auto;
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

        #dayList {
            list-style-type: none;
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

        #info-card{
            padding: 10px;
            width: 500px;
        }

        #review-container {
            height: 80%;
            width: 500px;
            overflow: scroll;
        }

        .review {
            position: relative;
            height: auto;
            width: 90%;
            align-self: center;
            margin-left: 17px;
            border-radius: 20px;
            margin-bottom: 10px;
            padding: 8px;
        }

        #btn-review, #btn-edit {
            position: absolute;
            top: 0px;
            color: white;
            background-color: #FF7B54;
            padding: 3px 0 3px 0;
            border-radius: 20px;
            padding: 10px 30px;
        }
        #btn-review{
            right: 800px;
        }
        .btn-review-finished{
            position: absolute;
            bottom: -120px;
            right: 0;
            color: white;
            background-color: #ffb700;
            padding: 3px 0 3px 0;
            border-radius: 20px;
            padding: 10px 30px;
        }
        #btn-edit {
            right: -120px;
        }

        #btn-review:hover, #btn-edit:hover {
            background-color: #f55425;
            font-weight: bold;
        }
        .btn-review-finished:hover{
            background-color: #ffa600;
            font-weight: bold;
        }

        #updateInfo {
            position: absolute;
            top: 17px;
            left: 120px;
            color: #5e5e5e;
        }

        .createDate-review {
            font-size: smaller;
            position: absolute;
            top: 10px;
            right: 20px;
            color: #7c7c7c;
        }

        .review-star-list {
            list-style-type: none;
            padding: 5px;
            margin-left: 10px;
            margin-bottom:0;

        }
        .review-star-list li {
            float: left;
            margin: 3px;
            color: #ffb700;
        }

        #review-score .review-star-list li{
            font-size: 30px;
        }

        .review-text {
            text-align: left;
            margin: 4px;
            height: 50px;
            width: 80%;
            overflow: scroll;
        }

        @media  screen and (min-width: 800px) {
            #large-left{
                position: relative;
                float: left;
                width: 70%;
                height: auto;
            }

            #large-right{
                positiion: relative;
                float: left;
                width: 30%;
                height: auto;
            }
        }

        #review-write-container{
            z-index: 100;
            width: 80%;
            height: 65%;
            position: absolute;
            border-radius: 20px;
            bottom: 0;
            left: 9.5%;
            margin: auto;
            padding: 20px;
        }

        #review-write-container button:active{
            border: none;
        }

        textarea{
            resize: none;
            border-color: #ffe49f;
            border-width: 4px;
            border-radius: 15px;
            padding: 20px;
            width: 100%;
            height: 100%;
            font-size: 20px;
            line-height: 150%;
            margin-bottom: 20px;
        }

        textarea:focus{
            outline: none;
        }

        #review-cancel {
            position:absolute;
            top: 30px;
            right: 30px;
            display: inline-block;
            width: 50px;
        }

        @media screen and (max-width: 800px) {
            body{
                overflow: visible;
            }
            .mobile-view{
                width: 491px;
            }
            #map-section{
                height: 350px;
            }
            #content-main-board{
                height: 60%;
                left: 50px;
                top: 300px;
            }
            #content-information{
                width: 100%;
                top: 570px;
            }
            #content-review{
                top: 800px;
            }
            #info-card{
                width: auto;
            }
            #review-container{
                width: auto;
            }
            #btn-review, #btn-edit{
                right: 30px;
            }
        }

    </style>
</head>
<body>
    <script>
        $(function (){
            const searchParams = new URLSearchParams(location.search);

            for (const param of searchParams) {
                if(Boolean(param.at(1))) alert("이미 리뷰를 작성했습니다. 다시 작성하려면 기존 리뷰를 삭제하세요.");
            }
        });
    </script>
    <div class="container p-0 m-0">
        <div id="main-row" class="row g-0 text-center min-vh-100">
            <div class="mobile-view">
                <hearder id="header" class="fixed-top border border-black mobile-view bg-white shadow">
                    <!--뒤로 가기 버튼-->
                    <div style="width: 10%; float: left;">
                        <button type="button" class="col btn" onclick="back();"><i id="btn-back" class="bi bi-chevron-left"></i></button>
                    </div>
                    <!--카테고리 이미지-->
                    <div style="width: 80%; float:left;">
                        <img id="categoryImg" src="/img/category-fish-bread.png" class="col" alt="category image">
                    </div>
                </hearder>
                <div id="content">
                    <div id="large-left">
                        <!--지도-->
                        <div id="map-section" class="border-bottom"></div>
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
                        <!--메인 보드-->
                        <div id="content-main-board" class="border card shadow">
                            <!--카카오 지도 열기 & 길찾기
                                link 마지막에 가게 이름, 위도, 경도 넣으면 도착지로 자동 설정할 수 있음.
                            -->
                            <a id="kakao-location" href="https://map.kakao.com/link/to/test,37.402056,127.108212" title="길찾기"><i class="bi bi-map-fill"></i></a>
                            <!--현재 내 위치로 이동 버튼-->
                            <button id="my-location" onclick="mylocation();" title="현재 내 위치로 이동"><i class="bi bi-geo-alt-fill"></i></button>
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
                            000 님의 제보
                            <h2>그할마 붕어빵</h2>
                            <div class="center">
                                <div id="distance" type="button">
                                    <i class="bi bi-compass"></i>
                                    <span id="distance-text" class="smallTxt"></span>
                                </div>
                                <div id="stars">
                                    <i class="bi bi-star-fill"></i>
                                    <span class="smallTxt">별점 평균</span>
                                </div>
                            </div>
                            <div>
                                <button id="kakaotalk-sharing-btn" href="javascript:;" type="button" class="btn">
                                    <i class="bi bi-share"></i>
                                    공유하기
                                </button>
                                <button type="button" class="btn favorite" onclick="favorite();">
                                    <i class="bi favoriteBtn bi-heart"></i>
                                    즐겨찾기
                                </button>
                            </div>
                            <!-- Todo: 방문인증한 사람 수 DB 연동 -->
                            <div id="monthly">
                                <p>한 달 동안 0명이 다녀간 가게에요!</p>
                            </div>
                            <!--삭제 요청 버튼-->
                            <button type="button" id="ask-deletion" class="btn" onclick="deletion();">
                                <i class="bi bi-exclamation-circle"></i>
                                <span class="smallTxt">삭제 요청</span>
                            </button>
                        </div>
                    </div>
                    <div id="large-right">
                        <!--상세 정보-->
                        <div id="content-information">
                            <!--수정하기 버튼-->
                            <button id="btn-edit" type="button" class="btn" onclick="infoEdit();">정보수정하기</button>
                            <!--가게 정보 update 날짜-->
                            <!--Todo : 업데이트 날짜 DB 연동-->
                            <span id="updateInfo">2022.12.31 업데이트</span>
                            <h4>가게 정보</h4>
                            <div class="shadow border card" id="info-card">
                                <div class="row">
                                    <div class="col-3 subtitle" style="margin: auto 0;font-weight: 600">출몰 시기</div>
                                    <div class="col-8" style="padding: 0;">
                                        <ul id="dayList">
                                            <li>일</li>
                                            <li>월</li>
                                            <li>화</li>
                                            <li>수</li>
                                            <li>목</li>
                                            <li>금</li>
                                            <li>토</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--리뷰-->
                        <div id="content-review">
                            <!--리뷰 작성하기 버튼-->
                            <a href="#main-row">
                                <button id="btn-review" type="button" class="btn" onclick="reviewWrite();" >리뷰작성하기</button>
                            </a>

                            <!--Todo : 리뷰 총 개수 DB 연동-->
                            <!--Todo : js로 동적으로 코드 생산하기-->
                            <h4>리뷰 0개</h4>
                            <div id="review-container">
                                <!--리뷰 카드-->
                                <div class="shadow border card review">
                                    <!--가게 리뷰 create 날짜-->
                                    <!--Todo : 리뷰 생성 날짜 DB 연동-->
                                    <span class="createDate-review">2022.12.31</span>
                                    <div class="row">
                                        <ul class="review-star-list">
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li style="color: black;">yujin9747</li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <p class="review-text">사장님이 친절하세요!! 추천입니다!사장님이 친절하세요!! 추천입니다!사장님이 친절하세요!! 추천입니다!사장님이 친절하세요!! 추천입니다!사장님이 친절하세요!! 추천입니다!사장님이 친절하세요!! 추천입니다!사장님이 친절하세요!! 추천입니다!</p>
                                        <!--Todo : trash icon 배치하기-->
                                    </div>
                                    <div class="row">
                                        <!--Todo: 이미지 존재 여부에 따라 img 태그 삽입-->
                                        <img class="review-img" src="/img/review-img-sample.jpg" height="300" width="300">
                                    </div>
                                </div>
                                <!--리뷰 카드-->
                                <div class="shadow border card review">
                                    <!--가게 리뷰 create 날짜-->
                                    <!--Todo : 리뷰 생성 날짜 DB 연동-->
                                    <span class="createDate-review">2022.12.31</span>
                                    <div class="row">
                                        <ul class="review-star-list">
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li style="color: black;">yujin9747</li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <p class="review-text"> 이미지 없는 경우</p>
                                        <!--Todo : trash icon 배치하기-->
                                    </div>
                                    <div class="row">
                                    </div>
                                </div>
                                <!--리뷰 카드-->
                                <!--리뷰 카드-->
                                <div class="shadow border card review">
                                    <!--가게 리뷰 create 날짜-->
                                    <!--Todo : 리뷰 생성 날짜 DB 연동-->
                                    <span class="createDate-review">2022.12.31</span>
                                    <div class="row">
                                        <ul class="review-star-list">
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li style="color: black;">yujin9747</li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <p class="review-text"> 이미지 없는 경우</p>
                                        <!--Todo : trash icon 배치하기-->
                                    </div>
                                    <div class="row">
                                    </div>
                                </div>
                                <!--리뷰 카드-->
                                <!--리뷰 카드-->
                                <div class="shadow border card review">
                                    <!--가게 리뷰 create 날짜-->
                                    <!--Todo : 리뷰 생성 날짜 DB 연동-->
                                    <span class="createDate-review">2022.12.31</span>
                                    <div class="row">
                                        <ul class="review-star-list">
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li style="color: black;">yujin9747</li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <p class="review-text"> 이미지 없는 경우</p>
                                        <!--Todo : trash icon 배치하기-->
                                    </div>
                                    <div class="row">
                                    </div>
                                </div>
                                <!--리뷰 카드-->
                                <!--리뷰 카드-->
                                <div class="shadow border card review">
                                    <!--가게 리뷰 create 날짜-->
                                    <!--Todo : 리뷰 생성 날짜 DB 연동-->
                                    <span class="createDate-review">2022.12.31</span>
                                    <div class="row">
                                        <ul class="review-star-list">
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li style="color: black;">yujin9747</li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <p class="review-text"> 이미지 없는 경우</p>
                                        <!--Todo : trash icon 배치하기-->
                                    </div>
                                    <div class="row">
                                    </div>
                                </div>
                                <!--리뷰 카드-->
                                <!--리뷰 카드-->
                                <div class="shadow border card review">
                                    <!--가게 리뷰 create 날짜-->
                                    <!--Todo : 리뷰 생성 날짜 DB 연동-->
                                    <span class="createDate-review">2022.12.31</span>
                                    <div class="row">
                                        <ul class="review-star-list">
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li style="color: black;">yujin9747</li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <p class="review-text"> 이미지 없는 경우</p>
                                        <!--Todo : trash icon 배치하기-->
                                    </div>
                                    <div class="row">
                                    </div>
                                </div>
                                <!--리뷰 카드-->
                                <!--리뷰 카드-->
                                <div class="shadow border card review">
                                    <!--가게 리뷰 create 날짜-->
                                    <!--Todo : 리뷰 생성 날짜 DB 연동-->
                                    <span class="createDate-review">2022.12.31</span>
                                    <div class="row">
                                        <ul class="review-star-list">
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li style="color: black;">yujin9747</li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <p class="review-text"> 이미지 없는 경우</p>
                                        <!--Todo : trash icon 배치하기-->
                                    </div>
                                    <div class="row">
                                    </div>
                                </div>
                                <!--리뷰 카드-->
                                <!--리뷰 카드-->
                                <div class="shadow border card review">
                                    <!--가게 리뷰 create 날짜-->
                                    <!--Todo : 리뷰 생성 날짜 DB 연동-->
                                    <span class="createDate-review">2022.12.31</span>
                                    <div class="row">
                                        <ul class="review-star-list">
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star-fill"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li><i class="bi bi-star"></i></li>
                                            <li style="color: black;">yujin9747</li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <p class="review-text"> 이미지 없는 경우</p>
                                        <!--Todo : trash icon 배치하기-->
                                    </div>
                                    <div class="row">
                                    </div>
                                </div>
                                <!--리뷰 카드-->
                            </div>

                        </div>
                    </div>
                </div>
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
    <div id="black-bg" style="z-index: 99;">
        <div id="review-write-container" class="card shadow bg-white" style="visibility: hidden;">
            <!--취소 버튼-->
            <button type="button" class="btn" onclick="reviewCancel();"><i id="review-cancel" class="bi bi-x-lg"></i></button>
            <form id="review-form" action="/store/review" method="post" style="position: relative;">
                <div id="review-score">
                    <ul class="review-star-list">
                        <li><i class="bi bi-star-fill"></i></li>
                        <li><i class="bi bi-star-fill"></i></li>
                        <li><i class="bi bi-star-fill"></i></li>
                        <li><i class="bi bi-star"></i></li>
                        <li><i class="bi bi-star"></i></li>
                    </ul>
                </div>
                <div id="review-text">
                    <textarea placeholder="리뷰를 작성해주세요." id="form-text" name="content"></textarea>
                </div>
                <input type="file" accept="image/png, image/jpeg" name="photo">
                <button type="submit" class="text-white btn btn-review-finished">저장하기</button>
            </form>
        </div>
    </div>

    <!--카카오 공유 SDK-->
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
            integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous">
    </script>
    <!--카카오 공유 초기화-->
    <script>
        Kakao.init('453d03fdea794867e41a9d927cff2cac'); // 사용하려는 앱의 JavaScript 키 입력
        console.log(Kakao.isInitialized());
    </script>
    <!--카카오 공유 버튼 생성-->
    <script>
        /**
         * content->title == addressTitle
         * 가게 이미지 -> 카테고리별 기본 이미지를 사용할 것인가? 가게 등록할 때 이미지를 넣도록 할 것인가?
         * webUrl에 /store로 들어가면 해당 가게에 대한 정보 페이지로 넘어가는지 확인해야 함.
         * **/
        Kakao.Share.createDefaultButton({
            container: '#kakaotalk-sharing-btn',
            objectType: 'location',
            address: '경기 성남시 분당구 판교역로 235', // 공유할 위치의 주소
            addressTitle:'그할마 붕어빵', // 카카오 지도 내 지도 뷰에서 사용될 타이틀
            content: {
                title: '그할마 붕어빵',      // 가게 이름
                description: '#붕어빵',    // 카테고리 태그
                imageUrl:
                    'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
                link: {
                    // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
                    mobileWebUrl: 'https://developers.kakao.com',
                    webUrl: 'https://developers.kakao.com',
                },
            },
            social: {
                likeCount: 286, // 즐겨찾기 추가한 사람 수
                commentCount: 45,   // 리뷰 수
                // sharedCount: 845,    // 공유한 숫자는 넣을지 말지 고민
            },
            buttons: [
                {
                    title: '웹으로 보기',
                    link: {
                        // 모바일은 현재 localhost라 연결 안되는 상태. 배포 후에 점검해보기
                        mobileWebUrl: 'http://localhost:8080/store',
                        webUrl: 'http://localhost:8080/store',
                    },
                },
                // 위치 보기 버튼은 자동 생성됨
            ],
        });
    </script>
    <script>
        /** footer: 즐겨찾기 버튼 클릭 **/
        /** Todo : icon의 초기 값을 DB와 연동 및 수정 **/
        function favorite(){
            let favoriteBtn =  document.getElementsByClassName("favoriteBtn");
            let favoriteIcon = favoriteBtn.item(0).classList.item(2);
            if(favoriteIcon == "bi-heart") {
                for(let i=0; i<favoriteBtn.length; i++){
                    favoriteBtn[i].classList.remove('bi-heart');
                    favoriteBtn.item(i).classList.add('bi-heart-fill');
                }
            }
            else {
                for(let i=0; i<favoriteBtn.length; i++){
                    favoriteBtn[i].classList.remove('bi-heart-fill');
                    favoriteBtn.item(i).classList.add('bi-heart');

                }
            }
        }

        /** header: "<" 뒤로가기 버튼 클릭 **/
        function back() {
            history.back();
        }

        /** footer: 방문인증하기 버튼 클릭 **/
        function visit() {
            location.href = "/visit";
        }

        /** 삭제 요청 **/
        function deletion() {

        }


        /** 리뷰 작성하기 **/
        function reviewWrite() {
            // black-bg 효과 안먹음. 수정하기
            document.getElementById("review-write-container").style.visibility = "visible";

        }

        /** 리뷰 작성 취소 **/
        function reviewCancel(){
            document.getElementById("review-form").reset();
            document.getElementById("review-write-container").style.visibility = "hidden";
        }

        /** 정보 수정하기 **/
        function infoEdit() {

        }

    </script>
    <!--Todo: 새로 고침 시 말고는 0km로 나오는 문제 해결-->
    <!--Todo: 위도 경도로 거리 계산하는 식 수정 -> m로 단위 환산-->
    <script>
        var distance;
        var myLat, myLon;
        var destLat, destLon;   // Todo : DB 연동해서 목적지 주소 넣기
        // 목적지 -> 포항대학교로 테스트
        destLat = 36.10367691445477;
        destLon = 129.38881155932162;
        var element = document.getElementById("distance-text");

        // 1초마다 계산한 거리 업데이트하기
        function calculateDistance(){
            setInterval(function(){
                if (navigator.geolocation) {
                    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                    navigator.geolocation.getCurrentPosition(function(position) {

                        myLat = position.coords.latitude; // 위도
                        myLon = position.coords.longitude; // 경도
                    });
                }
                var latGap = Math.abs(myLat-destLat);
                var lonGap = Math.abs(myLon-destLon);
                var distance = Math.sqrt(latGap^2 + lonGap^2);
                distance += "km";
                element.innerHTML = distance;
            }, 1000);
        }
    </script>
</body>
</html>