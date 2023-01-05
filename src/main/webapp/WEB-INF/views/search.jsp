<%--
  Created by IntelliJ IDEA.
  User: sijun
  Date: 2023-01-01
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
      #header-box {
        max-width: none;
        height: 8rem;
      }
      body {
        padding-top: 8rem;
      }
      header {
        height: 8rem;
      }
      .container {
        display: grid;
        grid-template-columns: 50px 2fr 50px;
        grid-template-rows: 1fr 1fr;
      }
      .item:nth-child(3) {
        grid-column: 1 / 4;
        grid-row: 2 / 3;
      }
      .search-result {
        display: grid;
        grid-template-columns: 1fr 30px;
      }
      .bg-beige {
        background-color: #d9d9d9;
      }
      .clickable {
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <header class="container-fluid fixed-top p-0">
      <div class="row g-0 text-center">
        <div class="col"></div>
        <div class="col border border-black">
          <div id="header-box" class="container bg-beige">
            <div class="item d-flex my-auto">
              <img src="/img/close_FILL0_wght400_GRAD0_opsz48.png" onclick="" alt="close" width="30" height="30">
            </div>
            <div class="item d-flex m-auto">
              <p class="h5 py-0">위치 검색</p>
            </div>
            <div class="item mb-4">
              <input type="text" class="form-control" onkeyup="searchPlace(this.value)" placeholder="구, 동, 건물명, 역으로 검색하세요">
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
          <div class="col border border-black">
            <div id="search-result">
      <%--        검색 결과 템플릿--%>
              <template id="search-result-template">
                <div class="border search-result py-2 clickable" onclick="{placeSelect}">
                  <div class="d-flex flex-column justify-content-center">
                      <p class="h5 align-baseline text-start ms-2 my-0">{name}</p>
                      <p class="align-top text-start text-secondary ms-2 my-0">{address}</p>
                  </div>
                  <div class="d-flex my-auto">
                    <img id="place-select-button" src="/img/arrow_forward_ios_FILL0_wght400_GRAD0_opsz48.png" alt="arrow" width="30" height="30">
                  </div>
                </div>
              </template>
              <template id="no-search-result-template">
                <div class="py-5">
                  <div class="d-flex flex-column justify-content-center">
                    <p class="h5 text-center text-secondary my-0">검색 결과가 없습니다.</p>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=999dae6c70b0eaba00b7507d46323e18&libraries=services"></script>
<script>
  var searchResult = document.getElementById('search-result');
  var searchResultTemplate = document.getElementById('search-result-template').innerHTML;
  var noSearchResultTemplate = document.getElementById('no-search-result-template').innerHTML;

  var ps = new kakao.maps.services.Places();

  // Function for searching places by keyword
  function searchPlace(searchText) {
      var keyword = searchText;

      console.log(keyword);

      if (!keyword.replace(/^\s+|\s+$/g, '')) {
          removeAllChildNodes(searchResult);
          return false;
      }

      // Request a place search by keyword through the place search object
      ps.keywordSearch(keyword, placesSearchCB);
  }

  // Call back function called when the place search is completed
  function placesSearchCB(data, status, pagination) {
      if (status === kakao.maps.services.Status.OK) {
          // Display the search result on the map
          displaySearchResult(data);
      } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
          // Display a message when no search result is found
          displayNoResult();
      } else if (status === kakao.maps.services.Status.ERROR) {
          // Display a message when an error occurs
          alert('검색 결과 중 오류가 발생했습니다.');
          return;
      }
  }

  function removeAllChildNodes(element) {
      while (element.hasChildNodes()) {
          element.removeChild(element.lastChild);
      }
  }

  function displaySearchResult(places) {
      removeAllChildNodes(searchResult);

      for (var i = 0; i < places.length; i++) {
          var place = places[i];

          var template = searchResultTemplate;
          template = template.replace('{name}', place.place_name);
          template = template.replace('{address}', place.address_name);
          template = template.replace('{placeSelect}', 'selectPlace(' + place.y + ', ' + place.x + ')');

          searchResult.insertAdjacentHTML('beforeend', template);
      }
  }

  function displayNoResult() {
      removeAllChildNodes(searchResult);

      var template = noSearchResultTemplate;

      searchResult.insertAdjacentHTML('beforeend', template);
  }

  function selectPlace(lat, lng) {
      console.log(lat, lng);

      // Passing Coordinates and Redirecting to the main page
  }
</script>
