<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jang-yujin
  Date: 2023/01/06
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>카테고리 추가하기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> <!--icon-->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

  <style>
    #header{
      padding: 15px;
      border-radius: 0 0 20px 20px;
    }

    #back-btn{
      float: left;
      width: 10%;
    }

    #title{
      width: 90%;
      text-align: center;
    }

    #add{
      border-radius: 20px 20px 0 0;
      height: 30%;
      border: 2px solid #ff764e;
      width: 70%;
      margin: auto;
      padding: 20px;
      min-width: 400px;
      display: none;
    }

    .btn-category-apply{
      color: white;
      background-color: #FF7B54;
      border-radius: 20px;
      padding: 10px 30px;
      align-self : flex-end;
      width: 100%;
      margin-top: 20px;
    }

    .btn-category-apply-modal{
      color: white;
      background-color: #FF7B54;
      border-radius: 20px;
      padding: 10px 20px;
      align-self : flex-end;
      width: 40%;
      margin-top: 20px;
      float: left;
      margin-right: 20px;
    }

    #btn-report{
      position: fixed;
      bottom: 30px;
      color: #FF7B54;
      background-color: white;
      width: 460px;
    }

    #btn-report:hover{
      background-color: #FF7B54;
      font-weight: bold;
      color: white;
    }

    .btn-category-apply:hover{
      background-color: #f55425;
      font-weight: bold;
      color: white;
    }

    .btn-category-apply-modal:hover{
      background-color: #f55425;
      font-weight: bold;
      color: white;
    }

    #form-category-name{
      border-color: #ffe49f;
      border-width: 4px;
      border-radius: 15px;
      padding: 20px;
      width: 100%;
      height: 60%;
      font-size: 20px;
    }

    #form-category-name:focus{
      outline: none;
    }

    #form-category {
      position: relative;
    }

    #main {
      position: relative;
    }

    #form-main {
      position: absolute;
      top: 100px;
      width: 100%;
      height: 75%;
      border-radius: 10px;
      background-color: white;
      padding: 20px;
      overflow: scroll;
    }

    .form-section {
      margin-bottom: 40px;
    }

    img {
      width: 60px;
      padding-left: 15px;
    }

    span {
      margin-left: 10px;
    }

    .checkbox-row{
      margin-bottom: 25px;
      padding-left: 25px;
      padding-right : 25px;
    }

    form h5 {
      margin-bottom: 20px;
    }

    .smallTxt {
      font-size: smaller;
      margin-left: 2px;
    }

    #ask-add {
      position: absolute;
      bottom: 0;
      right: 20px;
      border: none;
      background-color: transparent;
    }

    .multiple-text {
      position: absolute;
      top: 3px;
      left: 110px;
      color: #5e5e5e;
    }

    #days > label{
      margin-right: 20px;
    }

    #randomButton{
      position: absolute;
      top: 0;
      right: 0;
      border-radius: 20px;
      padding: 5px 20px 5px 20px;
      background-color: white;
      color: #FF7B54;
      border: 1px solid #FF7B54;
    }

    #randomButton:hover, #randomButton:active{
      background-color: #f55425;
      color: white;
    }

  </style>
</head>
<body style="margin: 490px; margin: 0; background-color: #ffa48a">
<div class="container-fluid" style="height: 100%;">
  <hearder id="header" class="fixed-top border border-black bg-white shadow">
    <!--뒤로 가기 버튼-->
    <div id="back-btn">
      <button type="button" class="col btn" onclick="back();"><i id="btn-back" class="bi bi-chevron-left"></i></button>
    </div>
    <div id="title">
      <h5>가게 제보하기</h5>
    </div>
  </hearder>
  <!--main-->
  <div id="main" style="width: 500px; height: 100%; margin: auto;">
    <form id="form-main" method="post">
      <input type="hidden" name="lat" value="${markerForm.lat}">
      <input type="hidden" name="lon" value="${markerForm.lon}">
      <input type="hidden" value="31" name="userId">
      <div id="location" class="form-section">
          <div><h5>가게 위치</h5></div>
          <div><input id="addressName" class="form-control form-control-lg" type="text" aria-label=".form-control-lg example" name="addressName" readonly></div>
      </div>
      <div id="name" class="form-section">
        <div style="position: relative;"><h5>가게 이름</h5><button id="randomButton" onclick="randomName();" type="button">랜덤생성</button></div>
        <div><input id="rN" class="form-control form-control-lg" type="text" aria-label=".form-control-lg example" name="name" required></div>
      </div>
      <div id="category" class="form-section">
        <div style="position: relative;">
          <h5>카테고리 선택</h5>
          <span class="multiple-text" class="smallTxt">다중선택 가능</span>
          <!--카테고리 추가 신청 버튼-->
          <button type="button" id="ask-add" class="btn" onclick="add();">
            <i class="bi bi-exclamation-circle"></i>
            <span class="smallTxt">카테고리 추가 신청</span>
          </button>
        </div>
        <div class="row checkbox-row">
          <c:forEach var="category" items="${categoryList}">
            <div class="col-md-3">
              <div class="custom-control custom-checkbox image-checkbox">
                <input name="categoryId" type="checkbox" class="custom-control-input" value=${category.id} id="${category.id}"><span>${category.categoryName}</span>
                <label class="custom-control-label" for="${category.id}">
                  <img src="${category.icon}" alt="#" class="img-fluid">
                </label>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
      <div style="position: relative;">
        <div><h5>영업 요일</h5></div>
        <span class="multiple-text" class="smallTxt" style="left: 80px;">다중선택 가능</span>
        <div id="days">
          <input type="checkbox" id="sun" name="openDay" value=1 class="open-day" style="margin-left: 30px;">
          <label for="sun">일</label>
          <input type="checkbox" id="mon" name="openDay" value=2 class="open-day">
          <label for="mon">월</label>
          <input type="checkbox" id="tue" name="openDay" value=3 class="open-day">
          <label for="tue">화</label>
          <input type="checkbox" id="wed" name="openDay" value=4 class="open-day">
          <label for="wed">수</label>
          <input type="checkbox" id="thu" name="openDay" value=5 class="open-day">
          <label for="thu">목</label>
          <input type="checkbox" id="fri" name="openDay" value=6 class="open-day">
          <label for="fri">금</label>
          <input type="checkbox" id="sat" name="openDay" value=7 class="open-day">
          <label for="sat">토</label>
        </div>
      </div>
      <div id="finish">
        <button formaction="/report/finish" onsubmit="return validate();" id="btn-report" type="submit" class="btn btn-category-apply shadow">제보하기</button>
      </div>
  </div>
  <div id="add" class="fixed-bottom border border-black bg-white shadow">
      <div id="form-category">
        <div id="category-name">
          <input type="text" placeholder="새로운 카테고리 이름을 작성해주세요" id="form-category-name" name="categoryApplyName">
        </div>
        <div style="margin-left: 12%;">
          <button type="submit" formaction="/report/category-apply" onsubmit="return validateCategory();"  class="text-white btn btn-category-apply-modal float-right">추가신청</button>
          <button type="button" class="text-white btn btn-category-apply-modal float-right" onclick="cancel();">취소</button>
        </div>
      </div>

      </form>
  </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6427a2da1670b1b5f26b5608136a6892&libraries=services"></script>
<script>
  function add(){
    document.getElementById("add").style.display = "block";
  }

  function cancel() {
    document.getElementById("form-category-name").value="";
    document.getElementById("add").style.display = "none";
  }

  function back() {
    history.back();
  }


</script>

<!--랜덤 이름 생성 api-->
<script>
  $(function(){
      randomName();
      getAddressName();
  });

  function randomName(){
    try {
      fetch('https://nickname.hwanmoo.kr/?format=json&count=1',{
        credentials: "include",
      }).then((response)=> response.json())
              .then((data)=>{
                var name = data["words"][0];
                var arr = name.split(" ");
                var result="";
                for(var i=0; i<arr.length-1; i++) result += arr[i] + " ";
                result += "붕어빵";
                console.log("random : " + result);
                document.getElementById("rN").value = result;
              });
    } catch(err) {
      alert(err); // TypeError: Failed to fetch
    }
  }

  function getAddressName(){
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(${markerForm.lon}, ${markerForm.lat}, function(result, status) {
      if (status === kakao.maps.services.Status.OK) {
        var detailAddr =result[0].address.address_name;
        document.getElementById("addressName").value = detailAddr;
      }
    });

  }

  function validate(){
    var element = document.getElementsByClassName("custom-control-input");
    var atLeastOneChecked = false;
    for (var i = 0; i < element.length; i++) {
      if (element[i].checked === true) {
        atLeastOneChecked = true;
      }
    }
    if(atLeastOneChecked == false) {
      alert("최소 하나 이상의 카테고리 설정이 필요합니다.");
      return false;
    }
    else {
      var element = document.getElementsByClassName("open-day");
      var atLeastOneChecked = false;
      for (var i = 0; i < element.length; i++) {
        if (element[i].checked === true) {
          atLeastOneChecked = true;
        }
      }
      if(atLeastOneChecked == false) {
        alert("오픈 요일을 하나이상 선택해 주세요");
        return false;
      }
      else return true;
    }
  }


  function validateCategory(){
    return true;
  }
</script>
</body>
</html>
