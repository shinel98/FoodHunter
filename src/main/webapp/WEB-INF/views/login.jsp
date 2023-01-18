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
<%--    <meta name ="google-signin-client_id" content="989664921943-25870q3dpeq7plab53a4ik8dseqqccvu.apps.googleusercontent.com">--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap-social.css">
    <!-- 카카오 api 사용을 위한 스크립트 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


<%--   구글로그인에 사용하는 스크립 시온 --%>
<%--    <meta name="google-signin-client_id" content="157055717235-djh98t5kk3atuabnlcoaa9nl9jtvn716.apps.googleusercontent.com">--%>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

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
        .login_text {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container-fluid p-0">
        <div class="row g-0 text-center min-vh-100">
            <div class="col mobile-lr"></div>
            <div class="col mobile-center">
                <div class="row align-items-center justify-content-center">
                    <img src="/img/login.png" id="login-img" alt="login">
                    <h1>붕어빵 사냥꾼</h1>
                    <div class="d-grid mt-3 mb-2">
<%--                        <button class="btn btn-kakao btn-login text-uppercase fw-bold" type="submit" onclick="location.href='javascript:kakaoLogin()'";>--%>
<%--                            <i class="fab xi-kakaotalk xi-x me-2"></i>카카오 계정으로 로그인--%>
<%--                        </button>--%>
<%--    <div class="login-btn w-100 p-3 mb-3 rounded border-secondary"><img style="width: 20px;" src="resources/img/teamProject/kakao.png"/><a class="w-100" href="javascript:kakaoLogin();"  >카카오로 로그인하기  </a></div>--%>
    <div class="btn btn-kakao btn-login text-uppercase fw-bold" onClick="kakaoLogin();"><i class="fab xi-kakaotalk xi-x me-2"></i><btn class="w-100 login_text" >카카오로 로그인하기  </btn></div>
                    </div>
<%--                    <div class="d-grid mb-2">--%>
<%--                        <button class="btn btn-google btn-login text-uppercase fw-bold" type="submit" onclick="test();">--%>

<%--                                <div id="g_id_onload"--%>
<%--                                     data-client_id="157055717235-djh98t5kk3atuabnlcoaa9nl9jtvn716"--%>
<%--                                     data-ux_mode="redirect"--%>
<%--                                     data-login_uri="http://localhost:8080/main">--%>
<%--                                </div>--%>
<%--                                <div class="g_id_signin" data-type="standard"></div>--%>

<%--                        </button>--%>

<%--                    </div>--%>

                </div>
            </div>
            <div class="col mobile-lr"></div>
        </div>
    </div>

    <script>
        //kakao login
        // window.Kakao.init("6427a2da1670b1b5f26b5608136a6892");
        Kakao.init("6427a2da1670b1b5f26b5608136a6892");

        function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_nickname, profile_image, account_email',
            success : function(response) {
                console.log(response)
                window.Kakao.API.request({
                    url: '/v2/user/me',
                    success: (res) => {
                        const kakao_account = res.kakao_account;
                        const name = res.properties.nickname;
                        const email = res.kakao_account.email;

                        $.ajax({
                            type: 'POST',
                            url : 'snsLogin',
                            async: false,
                            data: {
                                name : name,
                                email : email,
                            },
                            success: function(data){
                                console.log("카카오 로그인 성공");
                                console.log(data);
                                <%--location.href="<%=request.getContextPath()%>/nickname"--%>
                                location.href="<%=request.getContextPath()%>/"+data;
                                //history.back();
                            },
                            error:function(){
                                console.log("카카오 데이터 가져오기 실패");
                                //location.reload();
                            }
                        })
                    }
                });

            },
            fail : function(error) {
                console.log(error);
            }
        });
    };
</script>
</body>
</html>

<%--'https://kauth.kakao.com/oauth/authorize?client_id=1501bf8447efb2ba05b4183faf2dd8a2&redirect_uri=http://localhost:8080/main&response_type=code'--%>
