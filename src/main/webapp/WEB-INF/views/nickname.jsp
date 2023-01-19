<%--
  Created by IntelliJ IDEA.
  User: inhyeok
  Date: 2023/01/11
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>

  <style>
    .mobile {
      background-color: #ffc81e;
      position: relative;
    }
    .mainContainer {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
    form{
        height: 60%;
    }
    .my {
      font-size: 3em;
      width: 400px;
    }
    .name {
      width:100%;

    }
    .name input {
      width: 100%;
      height: 50px;
      box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
      border-style: none;
      border-radius: 10px;
    }
    .is {
      display: inline-block;
      font-size: 3em;
    }
    #send {
      box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
      border-style: none;
      border-radius: 25px;
      /*background:url(../img/submit.png);*/
      /*background-repeat:no-repeat;*/
      width:32px;
      height:32px;
      padding: 0;
    }
    button svg {
      margin-bottom: 25px;
      background-color: #ffc81e;
      width: 32px;
      height: 32px;
      border-radius: 25px;
    }
    #nickname {
      text-align: center;
      font-size: 2em;
      color: gray;
    }
    input::placeholder {
      text-align: center;

    }
    .leftContainer, .rightContainer {
      display: none;
    }
    @media (min-width: 992px) {
      .leftContainer, .rightContainer {
        display: block;
      }
    }
  </style>
</head>
<body>
<div class="container-fluid p-0">
  <div class="row g-0 text-center min-vh-100">
    <div class="col leftContainer"></div>
    <div class="col mobile">
        <form method="post" action="<%=request.getContextPath()%>/loginPost">
      <div class="mainContainer">
        <div class="my">저는 닉네임 </div>
        <div class="name">
        <input type="text" id="nickname" name="nickname" required
               minlength="4" maxlength="12">
        </div>
        <div class="is">로 시작할래요</div>
        <button id="send" type="submit" value=""><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
        </svg></button>

      </div>

      </form>
        <div>
            <button class="btn btn-dark" onclick="recreate();">랜덤생성</button>
            <button class="btn btn-dark" onclick="use();">사용하기</button>
        </div>
    </div>
    <div class="col rightContainer"></div>
  </div>
</div>
<!--랜덤 이름 생성 api-->
<script>
    $(function(){
        randomName();
    });

    function randomName(){
        try {
            fetch('https://nickname.hwanmoo.kr/?format=json&count=1',{
                credentials: "include",
            }).then((response)=> response.json())
                .then((data)=>{
                    document.getElementById("nickname").placeholder = data["words"][0];
                });
        } catch(err) {
            alert(err); // TypeError: Failed to fetch
        }
    }

    function recreate(){
        document.getElementById("nickname").value = null;
        location.reload();
    }

    function use(){
        document.getElementById("nickname").value = document.getElementById("nickname").placeholder;
        document.getElementById("nickname").style.color = "white";
        document.getElementById("nickname").style.background = "#133331";
    }
</script>
</body>
</html>
