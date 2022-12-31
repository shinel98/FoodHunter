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

        #categoryImg {
            height: 40px;
            width: auto;
        }

        /*footer와 header 제외한 content 공간*/
        #content{
            position: relative;
            top: 82px;
        }

        #content-map {
            height: 350px;
        }

        #content-main-board {
            position: absolute;
            top: 300px;
            left: 50px;
            width: 80%;
            height: 60%;
            padding: 15px;
        }

        #content {
            position: relative;
            border: none;
        }

        #content-information {
            position: absolute;
            top: 570px;
            width: 100%;
            height: 40%;
            padding: 15px;
        }

        #content-review {
            position: absolute;
            top: 800px;
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

        #my-location{
            position: absolute;
            top: -40px;
            right: 5px;
            width: 30px;
            height: 30px;
            padding: 4px;
            border-radius: 50px;
            background-color: white;
            border: 1px solid #f55425;
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

        #my-location, #share i {
            color: #f55425;
        }

        #share i {
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

        #dayList, #payList {
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

        .payment-txt {
            text-align: center;
            margin-top: 4px;
        }

        #info-card{
            padding: 10px;
        }

        .payIcon {
            font-size: 19px;
        }

        #review-container {
            height: 80%;
            overflow: scroll;
        }

        .review {
            position: relative;
            height: 20%;
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
            right: 30px;
            color: white;
            background-color: #FF7B54;
            padding: 3px 0 3px 0;
            border-radius: 20px;
            padding: 10px 30px;
        }

        #btn-review:hover, #btn-edit:hover {
            background-color: #f55425;
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

        .review-text {
            text-align: left;
            margin: 4px;
            height: 35px;
            width: 80%;
            overflow: scroll;
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
                    <div style="width: 80%; float:left;">
                        <img id="categoryImg" src="/img/category-fish-bread.png" class="col" alt="category image">
                    </div>
                </hearder>
                <div id="content">
                    <!--지도-->
                    <!--Todo: 지도 연결-->
                    <div id="content-map" class="border-bottom">
                        map
                    </div>
                    <!--메인 보드-->
                    <div id="content-main-board" class="border card shadow">
                        <!--현재 내 위치로 이동 버튼-->
                        <button id="my-location"><i class="bi bi-geo-alt"></i></button>
                        000 님의 제보
                        <h2>그할마 붕어빵</h2>
                        <div class="center">
                            <div id="distance" type="button">
                                <i class="bi bi-compass"></i>
                                <span class="smallTxt">거리</span>
                            </div>
                            <div id="stars">
                                <i class="bi bi-star-fill"></i>
                                <span class="smallTxt">별점 평균</span>
                            </div>
                        </div>
                        <div>
                            <button id="share" type="button" class="btn" onclick="share();">
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
                            <div class="row">
                                <div class="col-3 subtitle" style="margin: auto 0; font-weight: 600;">결제 방식</div>
                                <div class="col-8" style="padding-left: 40px;">
                                    <ul id="payList">
                                        <li>
                                            <div class="row"><i class="bi bi-coin payIcon"></i></div>
                                            <div class="row payment-txt">현금</div>
                                        </li>
                                        <li>
                                            <div class="row"><i class="bi bi-credit-card payIcon"></i></div>
                                            <div class="row payment-txt">카드</div>
                                        </li>
                                        <li>
                                            <div class="row"><i class="bi bi-bank payIcon"></i></div>
                                            <div class="row payment-txt">계좌이체</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--리뷰-->
                    <div id="content-review">
                        <!--리뷰 작성하기 버튼-->
                        <button id="btn-review" type="button" class="btn" onclick="reviewWrite();">리뷰작성하기</button>
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
                            </div>
                            <!--리뷰 카드-->

                            <!--리뷰 카드 위의 구조 대로 반복 생성-->
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
                            <div class="shadow border card review"></div>
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

        /** 공유하기 **/
        /** Todo : 카카오 공유 기능 구현 **/
        function share() {

        }

        /** header: "<" 뒤로가기 버튼 클릭 **/
        function back() {
            history.back();
        }

        /** footer: 방문인증하기 버튼 클릭 **/
        function visit() {
            /** Todo : 방문인증 페이지로 이동 **/
            location.href = "/visit";
        }

        /** 삭제 요청 **/
        function deletion() {

        }

        /** 리뷰 작성하기 **/
        function reviewWrite() {

        }

        /** 정보 수정하기 **/
        function infoEdit() {

        }
    </script>
</body>
</html>
