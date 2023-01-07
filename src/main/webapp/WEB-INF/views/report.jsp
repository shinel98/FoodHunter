<%--
  Created by IntelliJ IDEA.
  User: narinhan
  Date: 2022/12/31
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Report</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid p-0">
  <div class="row g-0 text-center min-vh-100">
    <div class="col">공백</div>
    <div class="col border border-black">
      <div id="map" class="card mb-3" style="width:100%; height:350px;>
        <text x="50%" y="50%" fill="#eceeef" dy=".3em">지도</text>
    </div>
    <div class="card-body">
      <p class="card-text">맛집 위치는 바로 여기!</p>
      <form method="post">
        <div class="d-flex mb-3 align-items-center"><input type="text" class="form-control" name="location"/></div>
        <div class="d-flex flex-column">
          <input type="submit" value="제보하기" class="btn btn-block btn-warning" />
        </div>
      </form>
    </div>

  </div>
  <div class="col">공백</div>
</div>
</div>
</body>
</html>
