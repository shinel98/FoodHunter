<%--
  Created by IntelliJ IDEA.
  User: narinhan
  Date: 2022/12/31
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
  <title>제보하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <style>
    #header {
      border-radius: 0 0 20px 20px;
    }

    #btn-back {
      padding: 12px;
    }

    .map-card {
      height: 350px;
    }

    .mobile-view {
      /* 중앙 배치 */
      float: none;
      margin: 0 auto;
      /* 모바일 기준 너비 고정 */
      /* width: 491px; */
      width: 100%;
      height: auto;
    }

    @media screen and (max-width: 768px) {
      .mobile-lr {
        display: none;
      }
    }
  </style>
  <script>
    /** 뒤로가기 **/
    function back() {
      history.back();
    }
  </script>
</head>
<body>
<div class="container-fluid p-0">
  <div class="row g-0 text-center min-vh-100">
    <div class="col mobile-lr"></div>
    <div class="col border border-black mobile-center">
      <header id="header" class="fixed-top border border-black mobile-view bg-white shadow">
        <!--뒤로 가기 버튼-->
        <div style="width: 10%; float: left;">
          <button type="button" class="col btn" onclick="back();">
            <i id="btn-back" class="bi bi-chevron-left"></i>
          </button>
        </div>
        <div style="width: 80%; float:left;">
          <h5 class="card-title text-center my-2 fw-light fs-5">제보하기</h5>
        </div>
      </header>
      <div class="card border-0 shadow rounded-3 my-5">
        <div class="card-body bg-light p-4 p-sm-5">
          <!-- 지도 -->
          <div class="card map-card" id="map">
            <p>TEST MAP</p>
          </div>
          <div class="d-grid mt-3">
            <p class="font-weight-bold">맛집 위치는 바로 여기!</p>
          </div>
          <form name="aform" id="aform" method="post" action="/report/detail">
            <input id="lat" name="lat" type="text" hidden="hidden" value="129.4020908227123423">
            <input id="lon" name="lon" type="text" hidden="hidden" value="36.081094115491084">
            <input type="text" class="form-control mb-3" id="location" readonly><span id="centerAddr"></span>
            <div class="d-grid my-3">
              <button class="btn btn-block btn-warning" type="submit" value="위치설정">위치 설정하기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="col mobile-lr"></div>
  </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(36.10367691445477, 129.38881155932162), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };
  // 지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 지도를 클릭한 위치에 표출할 마커입니다
  var marker = new kakao.maps.Marker({
    // 지도 중심좌표에 마커를 생성합니다
    position: map.getCenter()
  });
  // 지도에 마커를 표시합니다
  marker.setMap(map);

  // 지도에 클릭 이벤트를 등록합니다
  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

    // 클릭한 위도, 경도 정보를 가져옵니다
    var latlng = mouseEvent.latLng;

    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);

    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';

    var resultDiv = document.getElementById('centerAddr');
    resultDiv.innerHTML = message;

  });
</script>
</body>
</html>
