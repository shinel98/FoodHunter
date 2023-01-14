<%--
  Created by IntelliJ IDEA.
  User: sijun
  Date: 2023-01-01
  Time: 오후 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <title>관리자 페이지</title>
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
    .bg-beige {
      background-color: #d9d9d9;
    }
    .add-category-request:first-child {
      margin-top: 1rem;
    }
    .container {
      display: grid;
      grid-template-columns: 1fr;
      grid-template-rows: 1fr;
    }
  </style>
</head>
<body>
  <header class="container-fluid fixed-top p-0">
    <div id="header-box" class="container bg-beige shadow">
      <div class="item d-flex m-auto">
        <p class="h5 py-0">카테고리 추가 요청</p>
      </div>
    </div>
  </header>
  <main>
    <div class="container-fluid p-0">
      <div class="row g-0 text-center min-vh-100">
        <div id="add-category-request-list">
          <c:choose>
            <c:when test="${fn:length(categoryRequestList) > 0}">
              <c:forEach var="categoryRequest" items="${categoryRequestList}">
                <div class="col-12 add-category-request">
                  <div class="border add-category-request py-2 d-flex">
                    <div class="me-auto d-flex align-items-center">
                      <p class="h5 text-start ms-2 my-0">${categoryRequest.name}</p>
                      <small class="text-muted ms-2">요청 수: ${categoryRequest.requestCnt}</small>
                    </div>
                    <div class="d-flex my-auto justify-content-end">
                      <form action="/admin/category/accept" method="post">
                        <input type="hidden" name="categoryName" value="${categoryRequest.categoryId}">
                        <button type="submit" class="btn btn-success btn-sm m-auto d-flex align-items-center">
                          <img src="/img/done_FILL0_wght400_GRAD0_opsz48.png" width="30" height="30"/>
                        </button>
                      </form>
                      <form action="/admin/category/reject" method="post">
                        <input type="hidden" name="categoryName" value="${categoryRequest.categoryId}">
                        <button type="submit" class="btn btn-danger btn-sm ms-1 me-2 my-auto d-flex align-items-center">
                          <img src="/img/block_FILL0_wght400_GRAD0_opsz48.png" width="30" height="30"/>
                        </button>
                      </form>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <div class="py-5">
                <div class="d-flex flex-column justify-content-center">
                  <p class="h5 text-center text-secondary my-0">카테고리 추가 요청이 없습니다.</p>
                </div>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </main>
</body>
</html>