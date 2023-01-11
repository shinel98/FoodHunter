<%--
  Created by IntelliJ IDEA.
  User: narinhan
  Date: 2022/12/31
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="google-signin-client_id" content="989664921943-25870q3dpeq7plab53a4ik8dseqqccvu.apps.googleusercontent.com">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap-social.css">
    <!-- 카카오 api 사용을 위한 스크립트 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- 구글 api 사용을 위한 스크립트 -->
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script>
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
        }
    </script>
    <style>
        @media screen and (max-width: 768px) {
            .mobile-lr {
                display: none;
            }
            .mobile-center {
                width: 100%
            }
            #login-img {
                width: 400px;
                height: 350px;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid p-0">
        <div class="row g-0 text-center min-vh-100">
            <div class="col mobile-lr"></div>
            <div class="col border border-black mobile-center">
                <div class="row align-items-center justify-content-center">
                    <img src="/img/login.png" id="login-img" alt="login">
                    <h1>붕어빵 사냥꾼</h1>
                    <div class="d-grid mt-3 mb-2">
                        <button class="btn btn-kakao btn-login text-uppercase fw-bold" type="submit" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=1501bf8447efb2ba05b4183faf2dd8a2&redirect_uri=http://localhost:8080/main&response_type=code'";>
                            <i class="fab xi-kakaotalk xi-x me-2"></i>카카오 계정으로 로그인
                        </button>
                    </div>
                    <div class="d-grid mb-2">
                        <button class="btn btn-google btn-login text-uppercase fw-bold" type="submit" data-onsuccess="onSignIn">
                            <i class="fab fa-google me-2"></i>구글 계정으로 로그인
                        </button>
                    </div>
                </div>
            </div>
            <div class="col mobile-lr"></div>
        </div>
    </div>
</body>
</html>
