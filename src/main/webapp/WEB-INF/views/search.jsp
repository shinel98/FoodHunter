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
  <title>가게 검색</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <style>
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
  </style>
</head>
<body>
  <div class="container-fluid p-0">
    <div class="row g-0 text-center min-vh-100">
      <div class="col"></div>
      <div class="col border border-black">
        <div class="container bg-beige">
          <div class="item d-flex my-auto">
            <img src="/img/close_FILL0_wght400_GRAD0_opsz48.png" onclick="" alt="close" width="30" height="30">
          </div>
          <div class="item d-flex m-auto">
            <p class="h5 py-0">위치 검색</p>
          </div>
          <div class="item mb-4">
            <input type="text" class="form-control" onkeyup="search(this.value)" placeholder="구, 동, 건물명, 역으로 검색하세요">
          </div>
        </div>
        <div id="search-result">
  <%--        검색 결과 템플릿--%>
          <template id="search-result-template">
            <div class="border search-result py-2">
              <div class="d-flex flex-column justify-content-center">
                  <p class="h5 align-baseline text-start ms-2 my-0">{name}</p>
                  <p class="align-top text-start text-secondary ms-2 my-0">{address}</p>
              </div>
              <div class="d-flex my-auto">
                <img src="/img/arrow_forward_ios_FILL0_wght400_GRAD0_opsz48.png" onclick="" alt="arrow" width="30" height="30">
              </div>
            </div>
          </template>
        </div>
      </div>
      <div class="col"></div>
    </div>
  </div>
</body>
</html>

<script>
  const searchResult = document.getElementById('search-result');
  const searchResultTemplate = document.getElementById('search-result-template').innerHTML;

  function search(searchText) {
    // 검색 기능 구현
  }
</script>
