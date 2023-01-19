<%--
  Created by IntelliJ IDEA.
  User: jang-yujin
  Date: 2023/01/19
  Time: 1:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form name="hiddenForm" method="post" action="/store">
  <input type="number" name="storeId" value="${storeId}" hidden>
</form>
<script>
    document.hiddenForm.submit();
</script>
</body>
</html>
