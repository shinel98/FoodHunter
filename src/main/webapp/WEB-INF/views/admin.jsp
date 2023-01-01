<%--
  Created by IntelliJ IDEA.
  User: sijun
  Date: 2023-01-01
  Time: 오후 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>관리자 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

  <style>
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
        <div class="bg-beige d-flex py-3">
            <div class="item d-flex m-auto">
              <p class="h5 py-0">카테고리 추가 요청</p>
            </div>
        </div>
        <div id="add-category-request-list">
          <%--        카테고리 추가 요청 템플릿--%>
  <%--          <template id="add-category-request-template">--%>
          <div class="border add-category-request py-2 d-flex">
            <div class="me-auto d-flex align-items-center">
              <p class="h5 text-start ms-2 my-0">{name}</p>
              <small class="text-muted ms-2">요청 수: {number}</small>
            </div>
            <div class="d-flex my-auto justify-content-end">
              <button class="btn btn-success btn-sm m-auto d-flex align-items-center" onclick=""><img src="/img/done_FILL0_wght400_GRAD0_opsz48.png" width="30" height="30"/></button>
              <button class="btn btn-danger btn-sm ms-1 me-2 my-auto d-flex align-items-center" onclick=""><img src="/img/block_FILL0_wght400_GRAD0_opsz48.png" width="30" height="30"/></button>
            </div>
          </div>
  <%--          </template>--%>
        </div>
      </div>
      <div class="col"></div>
    </div>
  </div>
</body>
</html>
