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
  </style>
  <script>
    /** 뒤로가기 **/
    function back() {
      history.back();
    }
  </script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892"></script>
</head>
<body>
<div class="container-fluid p-0">
  <div class="row g-0 text-center min-vh-100">
    <div class="col">공백</div>
    <div class="col border border-black">
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
          <form name="aform" id="aform" method="post">
            <input type="text" class="form-control mb-3" id="location" readonly><span id="centerAddr"></span>
            <div class="d-grid my-3">
              <button class="btn btn-block btn-warning" type="submit" value="위치설정">위치 설정하기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="col">공백</div>
  </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892&libraries=services,clusterer,drawing"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 1 // 지도의 확대 레벨
          };

  // 지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
          infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

  // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
  searchAddrFromCoords(map.getCenter(), displayCenterInfo);

  // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
      if (status === kakao.maps.services.Status.OK) {
        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

        var content = '<div class="bAddr">' +
                '<span class="title">법정동 주소정보</span>' +
                detailAddr +
                '</div>';

        // 마커를 클릭한 위치에 표시합니다
        marker.setPosition(mouseEvent.latLng);
        marker.setMap(map);

        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
        infowindow.setContent(content);
        infowindow.open(map, marker);
      }
    });
  });

  // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
  kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
  });

  function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
  }

  function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
  }

  // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
  function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
      var infoDiv = document.getElementById('centerAddr');

      for(var i = 0; i < result.length; i++) {
        // 행정동의 region_type 값은 'H' 이므로
        if (result[i].region_type === 'H') {
          infoDiv.innerHTML = result[i].address_name;
          break;
        }
      }
    }
  }

  var centerAddr;
  displayCenterInfo(result, status);

  function join(){
    var joinForm = document.aform;
    //centerAddr 값 체크
    //if (joinForm.centerAddr1.value != document.getElementById("centerAddr").innerText) {
    joinForm.centerAddr1.value = document.getElementById("centerAddr").innerText;
    joinForm.submit();
    //}
  }
</script>
</body>
</html>
