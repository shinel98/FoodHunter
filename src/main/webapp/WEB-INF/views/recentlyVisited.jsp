<%--
  Created by IntelliJ IDEA.
  User: sijun
  Date: 2023-01-08
  Time: 오전 1:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>최근 방문한 가게</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
      #header-box {
        max-width: none;
        height: 6rem;
        border-radius: 0 0 1rem 1rem;
      }
      body {
        padding-top: 6rem;
      }
      header {
        height: 6rem;
      }
      .container {
          display: grid;
          grid-template-columns: 50px 2fr 50px;
          grid-template-rows: 1fr;
      }
      .recently-visited-grid {
          display: grid;
          grid-template-columns: 100px 1fr 30px;
          margin: 1rem;
          border-radius: 1rem;
      }
      .bg-beige {
          background-color: #d9d9d9;
      }
      .bg-lightbeige {
          background-color: #f0f0f0;
      }
      .clickable {
          cursor: pointer;
      }
      .clickable:hover {
          background-color: #eeeeee;
      }
    </style>
  </head>
  <body>
    <header class="container-fluid fixed-top p-0">
      <div class="row g-0 text-center">
        <div class="col"></div>
        <div class="col border border-black bg-beige">
          <div id="header-box" class="container bg-white">
            <div class="item d-flex my-auto">
              <img src="/img/arrow_back_ios_FILL0_wght400_GRAD0_opsz48.png" onclick="" alt="back" width="30" height="30">
            </div>
            <div class="item d-flex m-auto">
              <p class="h5 py-0">최근 방문한 가게</p>
            </div>
          </div>
        </div>
        <div class="col"></div>
      </div>
    </header>
    <main>
      <div class="container-fluid p-0">
        <div class="row g-0 text-center min-vh-100">
          <div class="col"></div>
          <div class="col border border-black bg-beige">
            <div id="recently-visited-list">
              <%--최근 방문한 가게 템플릿--%>
              <template id="recently-visited-template">
                <div class="border bg-lightbeige recently-visited-grid py-2 clickable" onclick="{placeSelect}">
                  <div class="m-auto">
                    <img src="{image-source}" alt="store image" width="80" height="60">
                  </div>
                  <div class="d-flex flex-column justify-content-center">
                    <p class="h5 align-baseline text-start ms-2 my-0">{name}</p>
                    <p class="align-top text-start text-secondary ms-2 my-0">{address}</p>
                  </div>
                  <div class="d-flex my-auto">
                    <img id="place-select-button" src="/img/arrow_forward_ios_FILL0_wght400_GRAD0_opsz48.png" alt="arrow" width="30" height="30">
                  </div>
                </div>
              </template>
              <template id="no-recently-visited-template">
                <div class="py-5">
                  <div class="d-flex flex-column justify-content-center">
                    <p class="h5 text-center text-secondary my-0">방문 인증 내역이 없습니다.</p>
                  </div>
                </div>
              </template>
            </div>
          </div>
          <div class="col"></div>
        </div>
      </div>
    </main>
  </body>
</html>
<script>
  const recentlyVisitedListElement = document.getElementById('recently-visited-list');
  const recentlyVisitedTemplate = document.getElementById('recently-visited-template');
  const noRecentlyVisitedTemplate = document.getElementById('no-recently-visited-template');
  const recentlyVisitedList = getRecentlyVisitedList();

  $(document).ready(function () {
    $("#recently-visited-list").empty();

    if (recentlyVisitedList.length === 0) {
        $("#recently-visited-list").append(noRecentlyVisitedTemplate);
    } else {
        recentlyVisitedList.forEach((recentlyVisited) => {
            let template = recentlyVisitedTemplate;

            template.content.querySelector('img').src = recentlyVisited.image;
            template.content.querySelector('p').textContent = recentlyVisited.name;
            template.content.querySelector('p').nextElementSibling.textContent = recentlyVisited.address;
            template.content.querySelector('div').onclick = () => {
                selectPlace(recentlyVisited.y, recentlyVisited.x);
            };

            $("#recently-visited-list").append(template);
        });
    }
  });

  function getRecentlyVisitedList() {
    let list = [];
    // Load Data from DB
    return list;
  };

  function selectPlace(lat, lng) {
    console.log(lat, lng);

    // Passing Coordinates and Redirecting to the main page
  }

</script>