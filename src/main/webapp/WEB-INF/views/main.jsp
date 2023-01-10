<%--
  Created by IntelliJ IDEA.
  User: inhyeok
  Date: 2022/12/29
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/fc1b103f84.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892"></script>
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
            width:25%;

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
            /*position: absolute;*/
            /*width: 23em;*/
            /*height: 10em;*/
            width: 80%;
            height: 100%;

            border-radius: 30px;
            z-index:1;
            background-color: white;
            margin-right: 10px;
            flex: 0 0 auto;
            /*transform: translate(, 20%);*/
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            blur-radius: 50px;
            padding: 4px;
            min-width: 270px;
        }

        #storesContainer::-webkit-scrollbar{
            display:none;
        }
        #storesContainer {
            padding: 8px;
            position: absolute;
            display:flex;
            /*border: 1px solid black;*/
            /*background-color: white;*/
            width:30%;
            height:20%;
            z-index:1;
            flex-wrap: nowrap;
            overflow-x: auto;
            transform: translate(10%, -170%);
            -ms-overflow-style: none;
        }
        #tagsContainer {
            width:32%;
            height: 6%;

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
            height:30px;
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
            margin-top: 5%;
            /*border: 1px solid black;*/
        }
        .storesIcon {
            float: left;
            margin-top: 8%;
            width: 30%;
            height: 40%;
        }
        .storesDetailContainer {
            display: flex;
            justify-content: space-evenly;
            margin-top: 6%;

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
            font-size: 1.6em;
            padding: 0 !important;
            height: 31px;
            margin: 0 !important;
        }
        .storesTag {
            color:gray;
            margin-bottom: 7px;

        }
        .storesDistance {
            margin-top: 1px;
        }
        a {
            text-decoration : none;
            color: black;
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
    <script>
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
    </script>

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
            <div class="col"></div>
            <div class="col">

                <div id="map" style="width:100%;height:100%;"></div>
<%--                <div id="clickLatlng"></div>--%>

                <div id="searchContainer">
                    <div class="input-group rounded">
                        <input id="search_bar" type="search" class="form-control rounded" placeholder="경상북도 포항시 북구 양덕동77" aria-label="Search" aria-describedby="search-addon" readonly/>
<%--                        <div id="search_bar"></div>--%>
                        <span class="input-group-text border-0" id="search-addon">
                        <a href="./"><i class="fas fa-search"></i></a>
                        </span>
                    </div>
                </div>


                <div id="tagsContainer">
                    <div class="tags all"><a href="./">전체</a></div>
                    <div class="tags"><a href="./">붕어빵</a></div>
                    <div class="tags"><a href="./">호떡</a></div>
                    <div class="tags"><a href="./">타코야키</a></div>
                    <div class="tags"><a href="./">오뎅</a></div>
                    <div class="tags"><a href="./">오뎅</a></div>
                    <div class="tags"><a href="./">오뎅</a></div>
                    <div class="tags"><a href="./">오뎅</a></div>
                    <div class="tags"><a href="./">오뎅</a></div>
                </div>
<%--                <div class="window">--%>
                    <div id="storesContainer">
                        <div class="stores">
                            <div class="storesIcon"><img src="img/crucianbread.png" style="width:50px; height:50px;">
                            </div>
                            <div class="storesInfoContainer">
                                <div class="storesName">
                                    참 붕어빵
                                </div>
                                <div class="storesTag">
                                    #붕어빵
                                </div>
                            </div>
                            <div class="storesDetailContainer">
                                <div class="storesDistance"><img src="img/location.png" style="width:25px; height:25px;">1.0km</div>
                                <div class="storesRate"><img src="img/like.png" style="width:25px; height:25px; margin-bottom:5px">4</div>
                                <button class="reportButton">신고하기</button>
                                <button class="visitButton">방문하기</button>
                            </div>
                        </div>
                        <div class="stores"><div class="storesIcon"><img src="img/crucianbread.png" style="width:50px; height:50px;">
                        </div>
                            <div class="storesInfoContainer">
                                <div class="storesName">
                                    참 붕어빵
                                </div>
                                <div class="storesTag">
                                    #붕어빵
                                </div>
                            </div>
                            <div class="storesDetailContainer">
                                <div class="storesDistance"><img src="img/location.png" style="width:25px; height:25px;">1.0km</div>
                                <div class="storesRate"><img src="img/like.png" style="width:25px; height:25px; margin-bottom:5px">4</div>
                                <button class="reportButton">신고하기</button>
                                <button class="visitButton">방문하기</button>
                            </div>
                        </div>
                        <div class="stores">
                            <div class="storesIcon"><img src="img/crucianbread.png" style="width:50px; height:50px;">
                            </div>
                            <div class="storesInfoContainer">
                                <div class="storesName">
                                    참 붕어빵
                                </div>
                                <div class="storesTag">
                                    #붕어빵
                                </div>
                            </div>
                            <div class="storesDetailContainer">
                                <div class="storesDistance"><img src="img/location.png" style="width:25px; height:25px;">1.0km</div>
                                <div class="storesRate"><img src="img/like.png" style="width:25px; height:25px; margin-bottom:5px">4</div>
                                <button class="reportButton">신고하기</button>
                                <button class="visitButton">방문하기</button>
                            </div>
                        </div>
                    </div>
<%--                </div>--%>
<%--                <div id="button-container">--%>
<%--                    <button id="prev">previous</button>--%>
<%--                    <button id="next">next</button>--%>
<%--                </div>--%>

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

<%--                    <i class="far fa-user"></i>--%>
                </div>

            </div>
            <div class="col"></div>
        </div>
    </div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892&libraries=services,clusterer,drawing"></script>

    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성

        // 마커를 표시할 위치와 title 객체 배열입니다
        var positions = [
            {
                title: '카카오',
                latlng: new kakao.maps.LatLng(33.450705, 126.570677)
            },
            {
                title: '생태연못',
                latlng: new kakao.maps.LatLng(33.450936, 126.569477)
            },
            {
                title: '텃밭',
                latlng: new kakao.maps.LatLng(33.450879, 126.569940)
            },
            {
                title: '근린공원',
                latlng: new kakao.maps.LatLng(33.451393, 126.570738)
            },
            {
                title: '참 붕어빵',
                latlng: new kakao.maps.LatLng(36.082952670249654, 129.40151471459686)
            },
            {
                title: '황금 붕어빵',
                latlng: new kakao.maps.LatLng(36.084442828651305, 129.38510461130596)
            },
            {
                title: '맛있는 붕어빵',
                latlng: new kakao.maps.LatLng(36.084097839579634, 129.3897560855043)
            },
            {
                title: '호떡 트럭',
                latlng: new kakao.maps.LatLng(36.084732871079254, 129.39044130634628)
            }
        ];
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

        let latitude;
        let longitude;

        for (var i = 0; i < positions.length; i ++) {

            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(24, 35);

            // 마커 이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
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
        }

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
            // setCenter();
            var position = new kakao.maps.LatLng(latitude, longitude);
            var message = '<div style="padding:5px;">현위치</div>';
            myLocation(position, message)
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

        getUserLocation();

        function confirm(){
            location.href = "/main";
        }







    </script>
</body>
</html>
