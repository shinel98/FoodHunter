<%--
  Created by IntelliJ IDEA.
  User: inhyeok
  Date: 2023/01/17
  Time: 7:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">

    if (!confirm("로그인이 필요한 항목입니다. 로그인 하시겠습니까? ")) {
    // 아니오 버튼 클릭 시
      location.href = "<%=request.getContextPath()%>/";
    } else {
      // 예 버튼 클릭 시
      location.href="<%=request.getContextPath()%>/login";
    }

</script>
</body>
</html>
