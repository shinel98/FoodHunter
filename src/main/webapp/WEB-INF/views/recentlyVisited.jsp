<%--
  Created by IntelliJ IDEA.
  User: sijun
  Date: 2023-01-08
  Time: 오전 1:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
  <head>
    <title>최근 방문한 가게</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
      #header-box {
        max-width: none;
        height: 6rem;
        border-radius: 0 0 1rem 1rem;
      }
      #recently-visited-list {
        display: flex;
        flex-wrap: wrap;
        flex-basis: 0;
      }
      #recently-visited-div {
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
      .recently-visited-grid {
        display: grid;
        grid-template-columns: 1fr 30px;
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

      @media screen and (max-width: 768px) {
        #recently-visited-list {
            display: flex;
            flex-wrap: wrap;
            flex-basis: 0;
        }
        #recently-visited-div {
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
          <img src="/img/arrow_back_ios_FILL0_wght400_GRAD0_opsz48.png" class="clickable" onclick="location.href = '/my'" alt="back" width="30" height="30">
        </div>
        <div class="item d-flex m-auto">
          <p class="h5 py-0">최근 방문한 가게</p>
        </div>
      </div>
    </header>
    <main>
      <div class="container-fluid p-0">
        <div class="row g-0 text-center min-vh-100">
          <div class="col border border-black">
            <div id="recently-visited-list" class="mt-3 mx-4">
              <c:choose>
                <c:when test="${fn:length(recentlyVisitedList) > 0}">
                  <c:forEach var="recentlyVisited" items="${recentlyVisitedList}">
                    <div id="recently-visited-div" class="border bg-lightbeige recently-visited-grid py-2 clickable" onclick="location.href = '/store?storeId' + ${recentlyVisited.id}">
                      <div class="d-flex flex-column justify-content-center">
                        <p class="h5 align-baseline text-start ms-2 my-0">${recentlyVisited.name}</p>
                        <c:forEach var="tag" items="${allCategories}">
                          <c:if test="${tag.id == recentlyVisited.categoryId}">
                            <p class="align-top text-start text-secondary ms-2 my-0">#${tag.categoryName}</p>
                          </c:if>
                        </c:forEach>
                      </div>
                      <div class="d-flex my-auto">
                        <img id="place-select-button" src="/img/arrow_forward_ios_FILL0_wght400_GRAD0_opsz48.png" alt="arrow" width="30" height="30">
                      </div>
                    </div>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <div class="py-5">
                    <div class="d-flex flex-column justify-content-center">
                      <p class="h5 text-center text-secondary my-0">방문 인증 내역이 없습니다.</p>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>