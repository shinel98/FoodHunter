<%@ page isELIgnored="false" %>
<%@ page import="com.foodhunter.DTO.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
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
    <link rel="canonical" href="https://nickname.hwanmoo.kr" />
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=453d03fdea794867e41a9d927cff2cac"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
</head>
<body>
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
                        <!--메인 보드-->
                        <div id="content-main-board" class="border card shadow">
                            <!--카카오 지도 열기 & 길찾기
                                link 마지막에 가게 이름, 위도, 경도 넣으면 도착지로 자동 설정할 수 있음.
                            -->
                            <a id="kakao-location" href="https://map.kakao.com/link/to/test,37.402056,127.108212" title="길찾기"><i class="bi bi-map-fill"></i></a>
                            <!--현재 내 위치로 이동 버튼-->
                            <button id="my-location" onclick="mylocation();" title="현재 내 위치로 이동"><i class="bi bi-geo-alt-fill"></i></button>
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
                            <button id="btn-edit" type="button" class="btn" onclick="location.href='http://localhost:8080/report'";>정보수정하기</button>
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
                                        <p class="review-text col">맛있슈</p>
                                        <i class="bi bi-trash-fill col-2" style="margin: auto;"></i>
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
                        <form action="/visit">
                            <input type="hidden" name="storeId" value=${store.id}>
                            <input type="hidden" name="userId" value=1>
                            <button type="submit" class="text-white btn btn-visit">방문인증하기</button>
                        </form>

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
            <form id="review-form" action="/store/review" enctype="multipart/form-data" method="post" style="position: relative;">
                <!--임의로 설정해서 controller에 넘김-->
                <input type="number" name="usrId" value=3 style="display:none">
                <input type="number" name="storeId" value=1 style="display:none">
                <input type="number" name="score" id="score" value=3 style="display:none">
                <div id="review-score">
                    <ul class="review-star-list">
                        <li><i id="scoreOne" class="bi bi-star-fill" onclick="scoreOne();"></i></li>
                        <li><i id="scoreTwo"class="bi bi-star-fill" onclick="scoreTwo();"></i></li>
                        <li><i id="scoreThree"class="bi bi-star-fill" onclick="scoreThree();"></i></li>
                        <li><i id="scoreFour"class="bi bi-star" onclick="scoreFour();"></i></li>
                        <li><i id="scoreFive"class="bi bi-star" onclick="scoreFive();"></i></li>
                    </ul>
                </div>
                <div id="review-text">
                    <textarea placeholder="리뷰를 작성해주세요." id="form-text" name="reviewContent"></textarea>
                </div>

                <div id="photos">
                    <button type="button" id="add-photo-button" class="btn btn-primary" onclick="addPhoto()">사진 추가</button>
                    <button type="button" id="remove-photo-button" class="btn btn-warning d-none" onclick="removePhoto()">사진 삭제</button>
                </div>

                <button type="submit" class="text-white btn btn-review-finished">저장하기</button>
            </form>
        </div>
    </div>

    <form action="/store">
        <input type="hidden" name="storeId" value=${store.id}>
        <!--방문인증 완료 모달-->
        <div style="z-index: 100; position: relative; margin: auto;">
            <div id="visitFinished-modal" class="card shadow bg-white" style="visibility:hidden">
                <div><h4>방문인증이 완료되었습니다.</h4></div>
                <iframe src="https://embed.lottiefiles.com/animation/42183" width="100%" style="margin: auto"></iframe>
                <button type="submit" id="confirm" class="text-white btn btn-review-finished">확인</button>
            </div>
        </div>
    </form>


    <!--리뷰 에러 모달-->
    <div style="z-index: 100; position: relative; margin: auto;">
        <div id="reviewError-modal" class="card shadow bg-white" style="visibility:hidden">
            <div>
                <h4>이미 리뷰를 작성했습니다.</h4>
                <p>다시 작성하려면 기존의 리뷰를 삭제해주세요.</p>
            </div>
            <iframe src="https://embed.lottiefiles.com/animation/84891"></iframe>
            <button id="reviewConfirm" class="text-white btn btn-review-finished" onclick="confirm()">확인</button>
        </div>
    </div>
    <!--삭제 요청 모달-->
    <div style="z-index: 100; position: relative; margin: auto;">
        <div id="delete-modal" class="card shadow bg-white" style="visibility:hidden">
            <div>
                <h4>삭제 요청이 완료되었습니다.</h4>
            </div>
            <iframe src="https://embed.lottiefiles.com/animation/108969"></iframe>
            <button id="deleteConfirm" class="text-white btn btn-review-finished" onclick="confirm()">확인</button>
        </div>
    </div>

    <script>
        function randomName(){
            try {
                fetch('https://nickname.hwanmoo.kr/?format=json&count=1',{
                    credentials: "include",
                }).then((response)=> response.json())
                    .then((data)=>alert(data["words"][0]));
            } catch(err) {
                alert(err); // TypeError: Failed to fetch
            }
        }
    </script>
</body>
</html>

<script>
    let photoCnt = 0;

    function addPhoto() {
        let photo = $("<input>");
        photo.attr("type", "file");
        photo.attr("accept", "image/png, image/jpeg");
        photo.attr("id", "photo" + photoCnt);
        photo.attr("name", "photo" + photoCnt);
        photo.attr("class", "form-control photo-upload mt-1");
        $('#photos').append(photo);
        photoCnt++;
        $('#remove-photo-button').removeClass('d-none');
    }

    function removePhoto() {
        if (photoCnt > 0) {
            $('#photos').children("input:last").remove();
            photoCnt--;
        }
        if (photoCnt == 0) {
            $('#remove-photo-button').addClass('d-none');
        }
    }
</script>

<script>
    function scoreOne(){
        document.getElementById("score").value = 1;
        let scoreIcon =  document.getElementById("scoreOne").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreOne").classList.remove("bi-star");
            document.getElementById("scoreOne").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreTwo").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreTwo").classList.remove("bi-star-fill");
            document.getElementById("scoreTwo").classList.add("bi-star");
        }
        scoreIcon =  document.getElementById("scoreThree").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreThree").classList.remove("bi-star-fill");
            document.getElementById("scoreThree").classList.add("bi-star");
        }
        scoreIcon =  document.getElementById("scoreFour").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreFour").classList.remove("bi-star-fill");
            document.getElementById("scoreFour").classList.add("bi-star");
        }
        scoreIcon =  document.getElementById("scoreFive").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreFive").classList.remove("bi-star-fill");
            document.getElementById("scoreFive").classList.add("bi-star");
        }
    }
    function scoreTwo(){
        document.getElementById("score").value = 2;
        let scoreIcon =  document.getElementById("scoreOne").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreOne").classList.remove("bi-star");
            document.getElementById("scoreOne").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreTwo").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreTwo").classList.remove("bi-star");
            document.getElementById("scoreTwo").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreThree").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreThree").classList.remove("bi-star-fill");
            document.getElementById("scoreThree").classList.add("bi-star");
        }
        scoreIcon =  document.getElementById("scoreFour").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreFour").classList.remove("bi-star-fill");
            document.getElementById("scoreFour").classList.add("bi-star");
        }
        scoreIcon =  document.getElementById("scoreFive").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreFive").classList.remove("bi-star-fill");
            document.getElementById("scoreFive").classList.add("bi-star");
        }
    }

    function scoreThree(){
        document.getElementById("score").value = 3;
        let scoreIcon =  document.getElementById("scoreOne").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreOne").classList.remove("bi-star");
            document.getElementById("scoreOne").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreTwo").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreTwo").classList.remove("bi-star");
            document.getElementById("scoreTwo").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreThree").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreThree").classList.remove("bi-star");
            document.getElementById("scoreThree").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreFour").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreFour").classList.remove("bi-star-fill");
            document.getElementById("scoreFour").classList.add("bi-star");
        }
        scoreIcon =  document.getElementById("scoreFive").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreFive").classList.remove("bi-star-fill");
            document.getElementById("scoreFive").classList.add("bi-star");
        }
    }

    function scoreFour(){
        document.getElementById("score").value = 4;
        let scoreIcon =  document.getElementById("scoreOne").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreOne").classList.remove("bi-star");
            document.getElementById("scoreOne").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreTwo").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreTwo").classList.remove("bi-star");
            document.getElementById("scoreTwo").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreThree").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreThree").classList.remove("bi-star");
            document.getElementById("scoreThree").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreFour").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreFour").classList.remove("bi-star");
            document.getElementById("scoreFour").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreFive").classList.item(1);
        if(scoreIcon == "bi-star-fill") {
            document.getElementById("scoreFive").classList.remove("bi-star-fill");
            document.getElementById("scoreFive").classList.add("bi-star");
        }
    }

    function scoreFive(){
        document.getElementById("score").value = 5;
        let scoreIcon =  document.getElementById("scoreOne").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreOne").classList.remove("bi-star");
            document.getElementById("scoreOne").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreTwo").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreTwo").classList.remove("bi-star");
            document.getElementById("scoreTwo").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreThree").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreThree").classList.remove("bi-star");
            document.getElementById("scoreThree").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreFour").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreFour").classList.remove("bi-star");
            document.getElementById("scoreFour").classList.add("bi-star-fill");
        }
        scoreIcon =  document.getElementById("scoreFive").classList.item(1);
        if(scoreIcon == "bi-star") {
            document.getElementById("scoreFive").classList.remove("bi-star");
            document.getElementById("scoreFive").classList.add("bi-star-fill");
        }
    }


</script>

<script>

    $(function (){
        console.log("reloaded");
        calculateDistance();
        const searchParams = new URLSearchParams(location.search);
        for (const param of searchParams) {
            console.log(param);
            if(param.at(0) === "reviewError"){
                if(Boolean(param.at(1))) {
                    document.getElementById("reviewError-modal").style.visibility = "visible";
                }
            }
            else if(param.at(0) === "visitFinished"){
                if(Boolean(param.at(1))) {
                    document.getElementById("visitFinished-modal").style.visibility = "visible";
                }
            }
            else if(param.at(0) === "delete"){
                if(Boolean(param.at(1))) {
                    document.getElementById("delete-modal").style.visibility = "visible";
                }
            }
            else if(param.at(0) === "like"){
                if(Boolean(param.at(1))) {
                    console.log("true");
                    let buttons = document.getElementsByClassName("favoriteBtn");
                    //let icon = buttons.item(0).classList.item(2);
                    for(let i=0; i<buttons.length; i++){
                        buttons[i].classList.remove('bi-heart');
                        buttons.item(i).classList.add('bi-heart-fill');
                    }
                    console.log("heart=true");
                    location.href = "redirect:/store";
                }
                else console.log("false");
            }
        }

        // 처음 위치는 가게 table에 저장된 위도, 경도로 설정
        const container = document.getElementById('map-section'); //지도를 담을 영역의 DOM 레퍼런스
        const options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(36.10367691445477, 129.38881155932162), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };
        new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        Kakao.init('453d03fdea794867e41a9d927cff2cac'); // 사용하려는 앱의 JavaScript 키 입력
        console.log(Kakao.isInitialized());

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


    });

    // 1초마다 계산한 거리 업데이트하기
    function calculateDistance(){

        var myLat, myLon;
        var destLat, destLon;   // Todo : DB 연동해서 목적지 주소 넣기
        // 목적지 -> 임의로 테스트
        destLat =  36.08618059199135;
        destLon = 129.41260195413844;
        var destLatSec = destLat.toFixed(15)*60*60;
        var destLonSec = destLon.toFixed(15)*60*60;
        var element = document.getElementById("distance-text");

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
            distance /= 1000;
            distance = distance.toFixed(2);
            element.innerHTML = distance + "km";
        }, 10);
    }

    /** footer: 즐겨찾기 버튼 클릭 **/
    /** Todo : icon의 초기 값을 DB와 연동 및 수정 **/
    function favorite(){
        console.log("favorite()");
        let favoriteBtn =  document.getElementsByClassName("favoriteBtn");
        let favoriteIcon = favoriteBtn.item(0).classList.item(2);
        // 즐겨찾기 누른 경우
        if(favoriteIcon == "bi-heart") {
            for(let i=0; i<favoriteBtn.length; i++){
                favoriteBtn[i].classList.remove('bi-heart');
                favoriteBtn.item(i).classList.add('bi-heart-fill');
            }
            location.href = "/store/like";
        } // 즐겨찾기 해제한 경우
        else {
            for(let i=0; i<favoriteBtn.length; i++){
                favoriteBtn[i].classList.remove('bi-heart-fill');
                favoriteBtn.item(i).classList.add('bi-heart');

            }
            location.href = "/store/unlike";
        }
    }

    /** header: "<" 뒤로가기 버튼 클릭 **/
    function back() {
        history.back();
    }

    // /** footer: 방문인증하기 버튼 클릭 **/
    // function visit() {
    //     location.href = "/visit";
    // }

    /** 삭제 요청 **/
    function deletion() {
        const urlParams = new URL(window.location.href).searchParams;
        const storeId = urlParams.get('storeId');
        location.href = "/store/delete/" + storeId;
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

    function mylocation(){
        const container = document.getElementById('map-section'); //지도를 담을 영역의 DOM 레퍼런스
        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
        if (navigator.geolocation) {
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {

                const lat = position.coords.latitude; // 위도
                const lon = position.coords.longitude; // 경도

                const options = { //지도를 생성할 때 필요한 기본 옵션
                    center: new kakao.maps.LatLng(lat, lon), //지도의 중심좌표.
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
                    position: new kakao.maps.LatLng(lat, lon), // 마커를 표시할 위치
                    title: "내 위치", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                    image: markerImage // 마커 이미지
                });
            });
        }
    }

    function confirm(){
        location.href = "/main"
    }

</script>