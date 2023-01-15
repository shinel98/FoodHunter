<%--
  Created by IntelliJ IDEA.
  User: inhyeok
  Date: 2022/12/29
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <script src="https://kit.fontawesome.com/fc1b103f84.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>



<%--    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892"></script>--%>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892&libraries=services,clusterer,drawing"></script>
    <style>
        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
        .wrap * {padding: 0;margin: 0;}
        .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
        .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
        .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
        .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
        .info .close:hover {cursor: pointer;}
        .info .body {position: relative;overflow: hidden;}
        .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
        .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
        .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
        .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
        .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .info .link {color: #5085BB;}

        * {
            box-sizing: border-box;

        }

        #searchContainer {
            position:fixed;
            width:70%;

            /*margin: 0 20px 0 20px;*/
            top:10px;
            margin: 0 auto;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1;
        }

        #search_bar{
            width:50% !important;
            /*background-color: white;*/
            /*height: 40px;*/
            /*border: 1px solid black;*/
        }
        #webSearch_bar {
            width:50% !important;
        }
        .mobile {
            border: 1px solid #ececec;
        }
        #menuContainer {
            /*position: fixed;*/
            position: relative;
            display: flex;
            bottom:0px;
            width:100%;
            height: 70px;
            background-color: white;
            z-index:1;
            transform: translateY(-100%);
        }
        .menuIcon {
            width:35%;
        }
        .menuIcon i {
            margin-top:0.5em;
        }
        .stores {
            width: 30%;
            height: 100%;
            border-radius: 30px;
            z-index:1;
            background-color: white;
            margin-right: 10px;
            flex: 0 0 auto;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            blur-radius: 50px;
            padding: 4px;
            min-width: 300px;
        }

        #storesContainer::-webkit-scrollbar{
            display:none;
        }
        #storesContainer {
            width: 90%;
            /* justify-content: center; */
            margin-left: 60px;
            padding: 8px;
            position: absolute;
            display:flex;
            /*border: 1px solid black;*/
            /*background-color: white;*/

            height:20%;
            z-index:1;
            flex-wrap: nowrap;
            overflow-x: auto;
            transform: translateY(-170%);
            -ms-overflow-style: none;
        }
        #tagsContainer {
            width: 100%;
            /*justify-content: center;*/
            height: 6%;
            display: flex;
            flex-wrap: nowrap;
            overflow-x: auto;
            -ms-overflow-style: none;
            position:fixed;
            top:60px;
            margin-left: 7px;
            z-index:1;
            /*border: 1px solid black;*/
            /*background-color: white;*/
        }
        #tagsContainer::-webkit-scrollbar{
            display:none;
        }

        .tags {
            /*position:fixed;*/
            display: inline-block;
            margin-right: 10px;
            z-index: 1;
            background-color:white;
            /*width:20%;*/
            height:25px;
            padding:0 0.5em 0 0.5em;
            /*border: 1px solid black;*/
            border-radius: 20px;
            flex: 0 0 auto;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            blur-radius: 50px;

        }
        .all  {
            background-color: crimson;

        }
        .all a {
            color: white;
        }
        .storesInfoContainer {
            width: 50%;
            height: 40%;
            margin-left: 30%;
            margin-top: 2%;
            /*border: 1px solid black;*/
        }
        .storesIcon {
            float: left;
            margin-top: 3%;
            width: 40%;
            height: 40%;
            margin-right:-50px;
        }
        .storesIcon img{
            width: 80px;
            height: 80px;
        }
        .storesDetailContainer {
            display: flex;
            justify-content: space-evenly;
            margin-top: 10%;

        }
        .reportButton {
            text-decoration: none;
            border-radius: 20px;
            border: 0;
            border-radius: 30px;
            color: white;
            background-color: crimson;

        }
        .visitButton {
            text-decoration: none;
            border:0;
            border-radius: 30px;
            background-color: #ffba01
        }
        .storesName {
            font-weight: bold;
            font-size: 2em;
            padding: 0 !important;
            white-space: nowrap;
            overflow: auto;
            margin-left:20px;
            -ms-overflow-style: none;
        }
        .storesName::-webkit-scrollbar{
            display:none;
        }
        .storesTag {
            color:gray;
            margin-bottom: 7px;
            margin-top:-7px;
            font-size: 1.5em;

        }
        .storesDistance {
            margin-top: 1px;
        }
        a {
            text-decoration : none;
            color: black;
        }
        #webSearchContainer, #webStoresContainer, #webTagsContainer {
            display: none;
        }
        .fa-home:before {
            content: "\f015";
            font-size: smaller;
            color: gray;
        }
        .fa-pen:before {
            content: "\f304";
            font-size: smaller;
            color: gray;
        }
        .fa-user:before {
            content: "\f007";
            font-size: smaller;
            color: gray;
        }
        .menuIcon p {
            color: gray;
        }
        .clicked {
            background-color: crimson;
            color: white;
        }
        .leftContainer {
            display:none;
        }
        .rightContainer {
            display: none;
        }

        @media (min-width: 992px) {
            /* 데스크탑에 최적화된 예외 CSS 코드*/
            #webSearchContainer, #webStoresContainer, #webTagsContainer {
                display: block;
            }
            #searchContainer, #tagsContainer, #storesContainer {
                display: none;
            }
            #webStoresContainer::-webkit-scrollbar{
                display:none;
            }
            .reportButton {
                margin-right: -4%;
                margin-left: 20px;
            }
            .storesIcon img{
                width: 70px;
                height: 70px;
            }
            #webStoresContainer {
                padding: 8px;
                position: absolute;
                display:flex;
                /*border: 1px solid black;*/
                /*background-color: white;*/
                width:30%;
                height:69%;
                z-index:1;
                flex-wrap: nowrap;
                overflow-y: auto;
                margin-top: 12%;
                -ms-overflow-style: none;
                flex-direction: column;

            }

            .leftContainer {
                display:flex;
                /*justify-content: center;*/
                flex-direction: column;
                align-items: center;
            }
            .storesRate {
                margin-left: 0;
            }
            .rightContainer {
                display:none;
            }
            #webSearchContainer{
                width: 80%;
                margin-top: 8%;
            }
            #webTagsContainer {
                margin-top:3%;
                width:80%;
                height: 6%;
                display:flex;
                flex-wrap: nowrap;
                overflow-x: auto;
                -ms-overflow-style: none;
                z-index:1;
            }
            #webTagsContainer::-webkit-scrollbar{
                display:none;
            }
            .webStores{
                width: 100%;
                border-radius: 30px;
                z-index:1;
                background-color: white;
                /*margin-right: 10px;*/
                flex: 0 0 auto;
                box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
                blur-radius: 50px;
                padding: 4px;
                min-width: 400px;
                margin-top: 7%;
            }
        }

        #confirm{
            right: 20px;
            bottom: 20px;
        }
        #reportFinished-modal{
            z-index: 200;
            width: 500px;
            height: 300px;
            position: absolute;
            border-radius: 20px;
            bottom: 250px;
            left: 34%;
            padding: 20px;
            background-color: #f55425;
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
        .btn-review-finished:hover{
            background-color: #ffa600;
            font-weight: bold;
        }

        @media screen and (max-width: 800px){
            #reportFinished-modal{
                left: 0;
            }
        }
    </style>
<%--    <script>--%>
<%--        $(function(){--%>
<%--            const searchParams = new URLSearchParams(location.search);--%>
<%--            for (const param of searchParams) {--%>
<%--                if(param.at(0) === "report"){--%>
<%--                    if(Boolean(param.at(1))) {--%>
<%--                        document.getElementById("reportFinished-modal").style.visibility = "visible";--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    </script>--%>

</head>
<body>

    <div class="container-fluid p-0" style="position:relative; margin:auto;">
        <!--가게 제보 완료 모달-->
        <div style="z-index: 100; margin: auto;">
            <div id="reportFinished-modal" class="card shadow bg-white" style="visibility: hidden">
                <div><h4>가게 제보가 완료되었습니다.</h4></div>
                <iframe src="https://embed.lottiefiles.com/animation/96081"  width="100%" style="margin: auto"></iframe>
                <button id="confirm" class="text-white btn btn-review-finished" onclick="confirm()">확인</button>
            </div>
        </div>
        <div class="row g-0 text-center min-vh-100">
            <div class="col mobile">
                <div id="map" style="width:100%;height:100%;" class="mobileMap"></div>
                <%--                <div id="clickLatlng"></div>--%>

                <div id="searchContainer">
                    <div class="input-group rounded">
                        <input id="search_bar" type="search" class="form-control rounded" placeholder="위치 검색 중.." aria-label="Search" aria-describedby="search-addon" readonly/>
                        <%--                        <div id="search_bar"></div>--%>
                        <span class="input-group-text border-0" id="search-addon">
                        <a href="./"><i class="fas fa-search"></i></a>
                        </span>
                    </div>
                </div>


                <div id="tagsContainer">
                    <c:forEach var="tagList" items="${allCategories}" varStatus="status">
                        <c:choose>
                            <c:when test="${status.first}">
                                <div class="tags clicked">${tagList.categoryName}</div>
                            </c:when>
                            <c:otherwise>
                                <div class="tags">${tagList.categoryName}</div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

                <div id="storesContainer">
                <c:forEach var="sList" items="${allMarkers}">
                    <div class="stores">
                        <div class="storesIcon"><img src="img/crucianbread.png" style="width:50px; height:50px;">
                        </div>
                        <div class="storesInfoContainer">
                            <div class="storesName">

                                ${sList.name}
                            </div>
                            <div class="storesTag">
                                ${sList.categoryName}
                            </div>
                        </div>
                        <div class="storesDetailContainer">
                            <div class="storesDistance"><img src="img/location.png" style="width:25px; height:25px;">1.0km</div>
                            <div class="storesRate"><img src="img/like.png" style="width:25px; height:25px; margin-bottom:5px">${sList.likeCnt}</div>
                            <button class="reportButton">신고하기</button>
                            <button class="visitButton">방문하기</button>
                        </div>
                    </div>
                </c:forEach>
                </div>


                <div id="menuContainer">
                    <div class="menuIcon">
                        <a href="./">
                            <i class="fas fa-home fa-2x"></i>
                            <p>홈</p>
                        </a>
                    </div>
                    <div class="menuIcon">
                        <a href="./"><i class="fas fa-pen fa-2x"></i><p>제보하기</p></a></div>
                    <div class="menuIcon"><a href="/mypage"><i class="fas fa-user fa-2x"></i><p>마이페이지</p></a></div>


                </div>

            </div>
            <div class="col leftContainer">
                <div id="webSearchContainer">
                    <div class="input-group rounded">
                        <input id="webSearch_bar" type="search" class="form-control rounded" placeholder="위치 검색 중.." aria-label="Search" aria-describedby="search-addon" readonly/>

                        <span class="input-group-text border-0" id="search-addon">
                        <a href="./"><i class="fas fa-search"></i></a>
                        </span>
                    </div>

                </div>
                <div id="webTagsContainer">
                    <c:forEach var="tagList" items="${allCategories}" varStatus="status">
                        <c:choose>
                            <c:when test="${status.first}">
                                <div class="tags clicked">${tagList.categoryName}</div>
                            </c:when>
                            <c:otherwise>
                            <div class="tags">${tagList.categoryName}</div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div id="webStoresContainer">
                    <c:forEach var="sList" items="${allMarkers}">
                        <div class="webStores">
                            <div class="storesIcon"><img src="img/crucianbread.png" style="width:50px; height:50px;">
                            </div>
                            <div class="storesInfoContainer">
                                <div class="storesName">
                                        ${sList.name}
                                </div>
                                <div class="storesTag">
                                    ${sList.categoryName}
                                </div>
                            </div>
                            <div class="storesDetailContainer">
                                <div class="storesDistance"><img src="img/location.png" style="width:25px; height:25px;">1.0km</div>
                                <div class="storesRate"><img src="img/like.png" style="width:25px; height:25px; margin-bottom:5px">${sList.likeCnt}</div>
                                <button class="reportButton">신고하기</button>
                                <button class="visitButton">방문하기</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>


            </div>
            <div class="col rightContainer"></div>
        </div>
    </div>

    <script>
        var latitude;
        var longitude;
        var testLon;
        var testLat;

        window.onload = function(){
        $(function(){
            const searchParams = new URLSearchParams(location.search);
            for (const param of searchParams) {
                if(param.at(0) === "report"){
                    if(Boolean(param.at(1))) {
                        document.getElementById("reportFinished-modal").style.visibility = "visible";
                    }
                }
            }
        });
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성

        // 마커를 표시할 위치와 title 객체 배열입니다
        // var positions = [
        //     {
        //         title: '카카오',
        //         latlng: new kakao.maps.LatLng(33.450705, 126.570677)
        //     },
        //     {
        //         title: '생태연못',
        //         latlng: new kakao.maps.LatLng(33.450936, 126.569477)
        //     },
        //     {
        //         title: '텃밭',
        //         latlng: new kakao.maps.LatLng(33.450879, 126.569940)
        //     },
        //     {
        //         title: '근린공원',
        //         latlng: new kakao.maps.LatLng(33.451393, 126.570738)
        //     },
        //     {
        //         title: '참 붕어빵',
        //         latlng: new kakao.maps.LatLng(36.082952670249654, 129.40151471459686)
        //     },
        //     {
        //         title: '황금 붕어빵',
        //         latlng: new kakao.maps.LatLng(36.084442828651305, 129.38510461130596)
        //     },
        //     {
        //         title: '맛있는 붕어빵',
        //         latlng: new kakao.maps.LatLng(36.084097839579634, 129.3897560855043)
        //     },
        //     {
        //         title: '호떡 트럭',
        //         latlng: new kakao.maps.LatLng(36.084732871079254, 129.39044130634628)
        //     }
        // ];



<%--        <c:forEach items="${allMarkers}" var="location" varStatus="">--%>
<%--            let temp = ${location.xLocation}--%>
<%--            console.log(temp);--%>

<%--        </c:forEach>--%>


        // kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        //
        //     // 클릭한 위도, 경도 정보를 가져옵니다
        //     var latlng = mouseEvent.latLng;
        //
        //     // 마커 위치를 클릭한 위치로 옮깁니다
        //     marker.setPosition(latlng);
        //
        //     var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        //     message += '경도는 ' + latlng.getLng() + ' 입니다';
        //
        //     var resultDiv = document.getElementById('clickLatlng');
        //     resultDiv.innerHTML = message;
        //
        // });
        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";


        <c:forEach items="${allMarkers}" var="location">
        // for (var i = 0; i < positions.length; i ++) {

            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(24, 35);

            // 마커 이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            // 마커를 생성합니다
            var latlng = new kakao.maps.LatLng(${location.xLocation}, ${location.yLocation});
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                // position: positions[i].latlng, // 마커를 표시할 위치
                position: latlng, // 마커를 표시할 위치
                //title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                title : '${location.name}', // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지
            });
            // var content = '<div class="wrap">' +
            //     '    <div class="info">' +
            //     '        <div class="title">' +
            //     '            카카오 스페이스닷원' +
            //     '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
            //     '        </div>' +
            //     '        <div class="body">' +
            //     '            <div class="img">' +
            //     '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
            //     '           </div>' +
            //     '            <div class="desc">' +
            //     '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' +
            //     '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
            //     '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
            //     '            </div>' +
            //     '        </div>' +
            //     '    </div>' +
            //     '</div>';
            //
            //
            // var overlay = new kakao.maps.CustomOverlay({
            //     content: content,
            //     map: map,
            //     position: marker.getPosition()
            // });
            //
            // kakao.maps.event.addListener(marker, 'click', function() {
            //     overlay.setMap(map);
            // });
            //
            // function closeOverlay() {
            //     overlay.setMap(null);
            // }
        //}
            </c:forEach>
        function setCenter(position) {
            // var loca = new kakao.maps.LatLng(latitude, longitude);
            map.setCenter(position);
        }

        function myLocation(locPosition, message){
            var marker = new kakao.maps.Marker({
                map: map,
                position: locPosition
            });

            var infowindow = new kakao.maps.InfoWindow({
                content: message,
                removable: true
            });
            infowindow.open(map,marker);
            setCenter(locPosition);
        }

        function success({ coords, timestamp }) {
            latitude = coords.latitude;   // 위도
            longitude = coords.longitude; // 경도
            let searchbar = document.getElementById('search_bar');
            let webSearchbar = document.getElementById('webSearch_bar');
            let coord = new kakao.maps.LatLng(latitude, longitude);
            let geocoder = new kakao.maps.services.Geocoder();
            console.log("현재 위치 불러오기 성공");
            let callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {

                    console.log(result[0].address.address_name);
                    searchbar.placeholder =  result[0].address.address_name;
                    webSearchbar.placeholder =  result[0].address.address_name;
                }
            }
            var position = new kakao.maps.LatLng(latitude, longitude);
            var message = '<div style="padding:5px;">현위치</div>';
            myLocation(position, message)
            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
        }

        let options = {
            enableHighAccuracy: false,
            maximumAge: 0,
            timeout: Infinity
        };

        function error(error) {
            error.code;    // 에러 코드: 1 = PERMISSION_DENIED, 2 = POSITION_UNAVAILABLE, 3 = TIMEOUT
            error.message; // 메시지
        }
        function getUserLocation() {
            if (!navigator.geolocation) {
                throw "위치 정보가 지원되지 않습니다.";
            }
            navigator.geolocation.watchPosition(success, error ,options);
        }
        function ajaxCall(lat, lon){
            $.ajax({
                url: "calDistance", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                data: {
                    xLocation: lat,
                    yLocation: lon
                }, // HTTP 요청과 함께 서버로 보낼 데이터
                method: "GET", // HTTP 요청 메소드(GET, POST 등)
                dataType: "json", // 서버에서 보내줄 데이터의 타입
                success:function(data){

                    console.log("ajax 성공!");
                    console.log(data);
                },
                error:function(){
                    console.log("ajax 실패ㅠ");
                }
            });
        }

        function calculateDistance(){

            var myLat, myLon;
            // var destLat, destLon;   // Todo : DB 연동해서 목적지 주소 넣기
            // 목적지 -> 임의로 테스트
            // destLat =  36.08618059199135;
            // destLon = 129.41260195413844;
            // var destLatSec = destLat.toFixed(15)*60*60;
            // var destLonSec = destLon.toFixed(15)*60*60;
            // var element = document.getElementsByClassName("storesDistance");

            setInterval(function(){
                if (navigator.geolocation) {
                    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                    navigator.geolocation.getCurrentPosition(function(position) {
                        myLat = position.coords.latitude; // 위도
                        myLon = position.coords.longitude; // 경도
                        console.log("myLat: " + myLat);
                        console.log("myLon: " + myLon);
                        var myLatSec = myLat
                        var myLonSec = myLon
                        ajaxCall(myLatSec, myLonSec);
                    });
                }


                // element.innerHTML = distance + "m";
            }, 1000);


        }

        getUserLocation();
        calculateDistance()


        function confirm(){
            location.href = "/main";
        }

        // 선택한 태그 색상 변경
        var currentMenu;
        var menuLinks = document.querySelectorAll('.tags');

        function clickMenuHandler(){
            // if (currentMenu){
            //     currentMenu.classList.remove('clicked');
            // }
            for (var i = 0; i < menuLinks.length; i++){
                menuLinks[i].classList.remove('clicked');
                console.log(menuLinks[i]);
            }
            this.classList.add('clicked');
            currentMenu = this;
        }


        for (var i = 0; i < menuLinks.length; i++){    /* 단점: 메뉴가 백만개라면....? 또한 addEventListener는 시스템 성능에 악영향을 끼친다고 함 */
            menuLinks[i].addEventListener('click', clickMenuHandler);
        }

        }
    </script>
</body>
</html>
