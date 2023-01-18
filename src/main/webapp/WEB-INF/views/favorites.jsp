<%--
  Created by IntelliJ IDEA.
  User: sijun
  Date: 2023-01-09
  Time: 오전 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>즐겨찾기한 가게</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <style>
      #header-box {
          max-width: none;
          height: 6rem;
          border-radius: 0 0 1rem 1rem;
      }
      #favorite-list {
          display: flex;
          flex-wrap: wrap;
          flex-basis: 0;
      }
      #favorite-div {
          flex: auto;
          height: 125px;
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
      .favorite-grid {
          display: grid;
          grid-template-columns: 120px 1fr 30px;
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
          background-color: rgba(0, 0, 0, 0.05);
      }
      .clickable-non-hover {
        cursor: pointer;
      }

      @media screen and (max-width: 768px) {
          #favorite-list {
              display: flex;
              flex-wrap: wrap;
              flex-basis: 0;
          }
          #favorite-div {
              width: 90%;
              height: 125px;
          }
      }
  </style>
</head>
<body class="bg-beige">
<header class="container-fluid fixed-top p-0">
  <div id="header-box" class="container bg-white shadow">
    <div class="item d-flex my-auto">
      <img src="/img/arrow_back_ios_FILL0_wght400_GRAD0_opsz48.png" onclick="pageBack()" class="clickable-non-hover" alt="back" width="30" height="30">
    </div>
    <div class="item d-flex m-auto">
      <p class="h5 py-0">즐겨찾기한 가게</p>
    </div>
  </div>
</header>
<main>
  <div class="container-fluid p-0">
    <div class="row g-0 text-center min-vh-100">
      <div class="col border border-black">
        <div id="favorite-list" class="mt-3 mx-4">
          <%--즐겨찾기한 가게 템플릿--%>
          <template id="favorite-template">
            <div id="favorite-div" class="border bg-lightbeige favorite-grid py-2 clickable" onclick="">
              <div class="m-auto">
                <img src="{image-source}" alt="store image" width="100" height="100">
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
          <template id="no-favorite-template">
            <div class="py-5">
              <div class="d-flex flex-column justify-content-center">
                <p class="h5 text-center text-secondary my-0">즐겨찾기한 가게가 없습니다.</p>
              </div>
            </div>
          </template>
        </div>
      </div>
    </div>
  </div>
</main>
</body>
</html>

<script>
    const favoriteListElement = document.getElementById('favorite-list');
    const favoriteTemplate = document.getElementById('favorite-template');
    const noFavoriteTemplate = document.getElementById('no-favorite-template');
    const favoriteList = getFavoriteList();

    $(document).ready(function () {
        $("#favorite-list").empty();

        if (favoriteList.length === 0) {
            const noFavoriteElement = document.importNode(noFavoriteTemplate.content, true);
            favoriteListElement.appendChild(noFavoriteElement);

        } else {
            favoriteList.forEach((favorite) => {
                let template = favoriteTemplate;

                template.content.querySelector('img').src = favorite.image;
                template.content.querySelector('p').textContent = favorite.name;
                template.content.querySelector('p').nextElementSibling.textContent = favorite.address;
                template.content.querySelector('div').onclick = () => {
                    selectPlace(favorite.y, favorite.x);
                };
                const favoriteElement = document.importNode(template.content, true);
              favoriteListElement.appendChild(favoriteElement);
            });
        }
    });

    function getFavoriteList() {
        let list = [
            {
                image: "http://via.placeholder.com/100",
                name: "테스트",
                address: "테스트",
                y: 37.566826,
                x: 126.9786567
            },
            {
                image: "http://via.placeholder.com/100",
                name: "테스트",
                address: "테스트",
                y: 37.566826,
                x: 126.9786567
            },
            {
                image: "http://via.placeholder.com/100",
                name: "테스트",
                address: "테스트",
                y: 37.566826,
                x: 126.9786567
            },
            {
                image: "http://via.placeholder.com/100",
                name: "테스트",
                address: "테스트",
                y: 37.566826,
                x: 126.9786567
            },
        ];
        // Load Data from DB
        return list;
    };

    function selectPlace(lat, lng) {
        console.log(lat, lng);

        // Passing Coordinates and Redirecting to the main page
    }
    function pageBack(){
      history.back();
    }
</script>