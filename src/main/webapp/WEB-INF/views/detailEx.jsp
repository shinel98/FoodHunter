<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <style>
    .top{
      background-color: black;
      padding: 8px 22px 10px 22px;
      border-radius: 0px 0px 10px 10px ;
      display: flex;
      justify-content: flex-start;
      align-items: center;
      margin-bottom: 10px;
    }
    .itemBox{


      margin: 30px 20px 0px 20px;
      background-color: black;
      padding: 8px 22px 10px 22px;
      border-radius:  10px ;

      display: flex;
      justify-content: flex-start;
      align-items: center;
    }
    .left{
      background-color: white;
      display: flex;
      align-items: center

    }
    .title{
      padding-left: 20px;
    }
    .content{
      margin-left: 20px;
    }

  </style>
</head>
<body>
<div class="container-fluid p-0">
  <div class="row g-0 text-center min-vh-100">
    <div class="col">공백</div>
    <div class="col border border-black main">
      <div class = "top">

        <div class ="left">
          이미지
        </div>
        <div class ="title">
          페이지 이름
        </div>

      </div>
      <div class = "main" >
        <div = "topBox"></div>
      <div >
        <div class = itemBox>
          <div class = "left">
            이미지
          </div>
          <div class = "content">
            가게이름
          </div>
        </div>
      </div>

      <div >
        <div class = itemBox>
          <div class = "left">
            이미지
          </div>
          <div class = "content">
            가게이름
          </div>
        </div>
      </div>

      <div >
        <div class = itemBox>
          <div class = "left">
            이미지
          </div>
          <div class = "content">
            가게이름
          </div>
        </div>
      </div>



    </div>

  </div>
  <div class="col">공백</div>

</div>
</div>

</body>
</html>
