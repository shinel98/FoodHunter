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
    <script type="text/javascript" src="/js/store.js"></script>
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

    <!--방문인증 완료 모달-->
    <div style="z-index: 100; position: relative; margin: auto;">
        <div id="visitFinished-modal" class="card shadow bg-white" style="visibility:hidden">
            <div><h4>방문인증이 완료되었습니다.</h4></div>
            <iframe src="https://embed.lottiefiles.com/animation/42183" width="100%" style="margin: auto"></iframe>
            <button id="confirm" class="text-white btn btn-review-finished" onclick="confirm()">확인</button>
        </div>
    </div>

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