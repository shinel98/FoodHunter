<%--
  Created by IntelliJ IDEA.
  User: jang-yujin
  Date: 2023/01/06
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>카테고리 추가하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> <!--icon-->
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
    <form id="form-main" action="" method="post">
      <div id="location" class="form-section">
          <div><h5>가게 위치</h5></div>
          <!--Todo : 기본 값으로 지도에서 선택한 위치 넣기-->
          <div><input class="form-control form-control-lg" type="text" value="포항시 북구 흥해흡 558 한동대학교" aria-label=".form-control-lg example" name="location"></div>
      </div>
      <div id="name" class="form-section">
        <div><h5>가게 이름</h5></div>
        <!--Todo : 기본 값으로 이름 자동생성 api 결과 넣기-->
        <div><input class="form-control form-control-lg" type="text" value="양덕동 붕어빵" aria-label=".form-control-lg example" name="name"></div>
      </div>
      <div id="category" class="form-section">
        <div>
          <h5>카테고리 선택</h5>

        </div>
        <div class="row checkbox-row">
          <div class="col-md-3">
            <div class="custom-control custom-checkbox image-checkbox">
              <input type="checkbox" class="custom-control-input" id="1"><span>붕어빵</span>
              <label class="custom-control-label" for="1">
                <img src="/img/category-fish-bread.png" alt="#" class="img-fluid">
              </label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="custom-control custom-checkbox image-checkbox">
              <input type="checkbox" class="custom-control-input" id="2"><span>붕어빵</span>
              <label class="custom-control-label" for="2">
                <img src="/img/category-fish-bread.png" alt="#" class="img-fluid">
              </label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="custom-control custom-checkbox image-checkbox">
              <input type="checkbox" class="custom-control-input" id="3"><span>붕어빵</span>
              <label class="custom-control-label" for="3">
                <img src="/img/category-fish-bread.png" alt="#" class="img-fluid">
              </label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="custom-control custom-checkbox image-checkbox">
              <input type="checkbox" class="custom-control-input" id="4"><span>붕어빵</span>
              <label class="custom-control-label" for="4">
                <img src="/img/category-fish-bread.png" alt="#" class="img-fluid">
              </label>
            </div>
          </div>
        </div>
        <div class="row checkbox-row">
          <div class="col-md-3">
            <div class="custom-control custom-checkbox image-checkbox">
              <input type="checkbox" class="custom-control-input" id="5"><span>붕어빵</span>
              <label class="custom-control-label" for="5">
                <img src="/img/category-fish-bread.png" alt="#" class="img-fluid">
              </label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="custom-control custom-checkbox image-checkbox">
              <input type="checkbox" class="custom-control-input" id="6"><span>붕어빵</span>
              <label class="custom-control-label" for="6">
                <img src="/img/category-fish-bread.png" alt="#" class="img-fluid">
              </label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="custom-control custom-checkbox image-checkbox">
              <input type="checkbox" class="custom-control-input" id="7"><span>붕어빵</span>
              <label class="custom-control-label" for="7">
                <img src="/img/category-fish-bread.png" alt="#" class="img-fluid">
              </label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="custom-control custom-checkbox image-checkbox">
              <input type="checkbox" class="custom-control-input" id="8"><span>붕어빵</span>
              <label class="custom-control-label" for="8">
                <img src="/img/category-fish-bread.png" alt="#" class="img-fluid">
              </label>
            </div>
          </div>
        </div>
      </div>
      <div id="finish">
        <button id="btn-report" type="submit" class="btn btn-category-apply shadow">제보하기</button>
      </div>
    </form>

  </div>
  <div id="add" class="fixed-bottom border border-black bg-white shadow">
    <form id="form-category" action="" method="post">
      <div id="category-name">
        <input type="text" placeholder="새로운 카테고리 이름을 작성해주세요" id="form-category-name" name="categoryNameApply">
      </div>
      <button type="submit" class="text-white btn btn-category-apply float-right">추가신청하기</button>
    </form>
  </div>
</div>
</body>
</html>
