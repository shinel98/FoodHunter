<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
<%--해야할 리스트
1.리스트 css 완료
2.하단 footer 내용 안 씹히게
3.top 보다더 둥글게 깍기
4.
--%>
<%--    부트스트립--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<%--제이쿼리--%>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%--    fontawesome--%>
    <script src="https://kit.fontawesome.com/221ffbaa00.js" crossorigin="anonymous"></script>
<%--    swipper slider css--%>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"    />

    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <style>
        .main{
            height: auto;
        }
        .navigationBar {
            position: fixed;
            height: 75px;

            left: 0;
            width: 100%;
            bottom: 0;
            z-index: 2;
            padding-top: 10px;

        }
        .idBox{

            width: auto;
            height: auto;
            border: none;
            outline: none;
        }
        .idBoxbutton{

            /*border: none;*/
            /*background-color: #1A1A1A;*/
        }
        .summeryBox {
            width: 25%;
            padding-bottom: 3%;
        }
        .nicktext{
            display: inline-block;
        }
        .countText{
            font-size: 30px;
            color: #2b2b2b;
        }
        .summeryText{
            font-size: 15px;
            color: #2b2b2b;
        }
        .exText{
            font-size: 25px;
        }

        .emty{
            background-color: #3D3D3D;
            width: 350px;
            height: 100px;
            align-items: center;
            text-align: left
        }

        .top{
            height: auto;
        }


        .bottom{
            height: 100%;
            padding-bottom: 75px;
        }
        .moreText{
            font-size: 15px;
        }
        .imgBox{
            width: 150px;
            height: 150px;

        }
        .tag{
            color:#B8B8B8;
        }
        .noneText{
            color:#737373;
        }
        .storeContainer{
            padding: 8px;

            display:flex;
            /*border: 1px solid black;*/
            /*background-color: white;*/
            width:100%;
            height:20%;
            z-index:1;
            flex-wrap: nowrap;
            overflow-x: auto;

            -ms-overflow-style: none;

        }
        .storeContainer::-webkit-scrollbar{
            display:none;
        }
        .storeitem{
            width: 20%;
            height: 50%;
            background-color: #3D3D3D;
            border-radius: 10px;
            z-index:1;
            margin-top: 10px;
            margin-left: 10px;
            margin-right: 10px;
            flex: 0 0 auto;
            /*transform: translate(, 20%);*/
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            blur-radius: 50px;
            padding: 4px;
            min-width: 270px;
        }



        /*본체 */
        .swiper {
            display:flex;
            flex-wrap: nowrap;
            overflow-x: auto;
            z-index: 1;
            padding-top: 1rem;

            width: 400px;
            height: 300px;
            float: left;

        }
        .swiper::-webkit-scrollbar {
            display: none;
        }
        /*아이템들*/
        .swiper-slide {
            background-color: #3D3D3D;
            width: 150px;
            height: 100px;
            background-color: black;
            color: black;

        }
        .swiper-wrapper{
            width: 150px;
            height: 100px;
        }

        .swiper-slide img {

        }
        .storeEx{
            text-align: left;
            color: white;
        }

        #recently-visited-div {
            flex: auto;
            height: 125px;
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
        #favorite-div {
            flex: auto;
            height: 125px;
        }
        .favorite-grid {
            display: grid;
            grid-template-columns: 1fr 30px;
            margin: 1rem;
            border-radius: 1rem;
        }
        #report {
            border-radius: 1rem;
        }
        #review {
            border-radius: 1rem;
        }
        #top {
            padding-bottom: 3rem;
        }
        #summery {
            width: 100%;
        }
        .fa-home:before {
            content: "\f015";
            font-size: smaller;
            color: gray;
        }
        .fa-pen:before {
            content: "\f304";
            font-size: smaller;
            color: gray;
        }
        .fa-user:before {
            content: "\f007";
            font-size: smaller;
            color: gray;
        }
        .menu-label {
            color: gray;
        }
    </style>
</head>
<body>
<div class="container-fluid p-0">
    <div class="row g-0 text-center min-vh-100">


        <div class="main bg-beige">

            <div id= "top" class="bg-white shadow align-items-center top w-100   rounded-bottom   md-5" >

                <div id = 'title'>
                    <label class="h5 my-3">마이페이지</label>
                </div>
                <div id="imgBox"  >
<%--                    <c:choose>--%>
<%--                        <c:when test="${user.profileImg != null}">--%>
<%--                            <img class="imgBox rounded-circle mt-5" src="${user.profileImg}" alt="profile image">--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
                            <img class="imgBox rounded-circle" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="profile image">
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
                </div>
                <div class ='nicktext'>
                    <input id="nickname" class='idBox bg-lightbeige border fs-4 fw-bold text-center mt-3' value="${user.nickname}" disabled >
                    <button class="idBoxbutton"><i class="fa-regular fa-pen-to-square"></i></button>
                    <button class="idBoxbutton" onclick="randomName();">랜덤생성</button>
                </div>
                <div id ='summery' class=" mt-5 row d-flex justify-content-around ">

                    <div id='report' class ='bg-lightbeige align-middle summeryBox badge '>
                        <br>
                        <label class ='countText pt-4 '>${reportedStoreCount}</label><br><br>
                        <label class = 'summeryText pt-3'> 제보한 가게</label>
                    </div>
                    <div id='review' class ='bg-lightbeige align-middle summeryBox badge '>
                        <br>
                        <label id='count' class= 'countText pt-4  '>${reviewCount}</label><br><br>
                        <label id='text' class='summeryText pt-3 '> 리뷰한 가게 </label>
                    </div>

                </div>
            </div>

            <div id = 'bottom' class ="bottom bg-beige">

<%--           <div id="visit" class ="">   </div>--%>
                <div id ='visitText' class='text-start mt-3'>

                    <div>
                        <div class = 'mx-4 mt-3 pb-3 pt-4' >
                            <i class="fa-solid fa-certificate"></i>
                            <label >방문 인증</label><br>
                        </div>
                    </div>
                    <div class = 'd-flex  flex-row justify-content-between'>
                        <label class = 'mx-4 exText '>최근 들린 가게는? ></label>
                        <label class = 'bg-lightbeige align-middle rounded-pill button moreText px-3 py-2 me-4 '>더보기</label>
                    </div>
                </div>

                <div id ='visitStore' class = ' mt-2 mx-4 mb-2'>
                    <c:choose>
                        <c:when test="${fn:length(recentlyVisitedList) > 0}">
                            <c:forEach var="recentlyVisited" items="${recentlyVisitedList}" varStatus="status">
                                <c:if test="${status.index < 5}">
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
                                            <img class="place-select-button" src="/img/arrow_forward_ios_FILL0_wght400_GRAD0_opsz48.png" alt="arrow" width="30" height="30">
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div id="recently-visited-div" class="border bg-lightbeige recently-visited-grid py-2 clickable" onclick="">
                                <div class="d-flex flex-column justify-content-center">
                                    <p class="h5 align-baseline text-start ms-2 my-0">방문 인증 내역이 없어요!</p>
                                    <p class="align-top text-start text-secondary ms-2 my-0">방문 인증으로 정확도를 높혀봐요</p>
                                </div>
                                <div class="d-flex my-auto">
                                    <img src="" alt="" width="30" height="30">
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div clss ='like'>           </div>
                <div id ='likeText' class='text-start'>
                    <div>
                        <div  class = 'mx-4 mt-2 pb-3 pt-4 '>
                            <i class="fa-regular fa-thumbs-up"></i>
                            <label>즐겨찾기</label><br>
                        </div>
                    </div>
                    <div class = 'd-flex flex-row justify-content-between'>
                        <label class = 'mx-4 exText '>나만의 맛집은? ></label>
                        <label class = 'bg-lightbeige align-middle rounded-pill button moreText px-3 py-2 me-4 '>더보기</label>
                    </div>
                </div>

                <div id="container1" class="storeContainer">
                    <c:choose>
                        <c:when test="${fn:length(favoriteList) > 0}">
                            <c:forEach var="favoriteStore" items="${favoriteList}">
                                <div id="favorite-div" class="border bg-lightbeige favorite-grid py-2 clickable" onclick="location.href = '/store?storeId' + ${favoriteStore.storeId}">
                                    <div class="d-flex flex-column justify-content-center">
                                        <c:forEach var="store" items="${storeList}">
                                            <c:if test="${store.id == favoriteStore.storeId}">
                                                <p class="h5 align-baseline text-start ms-2 my-0">${store.name}</p>
                                                <c:forEach var="tag" items="${allCategories}">
                                                    <c:if test="${tag.id == store.categoryId}">
                                                        <p class="align-top text-start text-secondary ms-2 my-0">#${tag.categoryName}</p>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="d-flex my-auto">
                                        <img class="place-select-button" src="/img/arrow_forward_ios_FILL0_wght400_GRAD0_opsz48.png" alt="arrow" width="30" height="30">
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div id="favorite-div" class="border bg-lightbeige favorite-grid py-2 clickable" onclick="">
                                <div class="d-flex flex-column justify-content-center">
                                    <p class="h5 align-baseline text-start ms-2 my-0">즐겨찾기한 가게가 없습니다.</p>
                                    <p class="align-top text-start text-secondary ms-2 my-0">자주 찾는 맛집을 즐겨찾기 해봐요</p>
                                </div>
                                <div class="d-flex my-auto">
                                    <img src="" alt="" width="30" height="30">
                                </div>
                            </div>
                            <div class="py-5">
                                <div class="d-flex flex-column justify-content-center">
                                    <p class="h5 text-center text-secondary my-0">즐겨찾기한 가게가 없습니다.</p>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
        <div class ='navigationBar bg-dark d-flex flex-row justify-content-around text-white'>
        <div>
            <a href="/main">
                <i class="fas fa-home fa-2x"></i>
                <br>
                <label class="menu-label">홈 </label>
            </a>
        </div>
        <div>
            <a href="/report">
                <i class="fas fa-pen fa-2x"></i>
                <br>
                <label class="menu-label">제보 하기</label>
            </a>
        </div>
        <div>
            <a href="/my">
                <i class="fas fa-user fa-2x"></i><br>
                <label class="menu-label">마이페이지</label>
            </a>
        </div>
    </div>


            </div>

            </div>


    </div>
</div>



</body>
<!--   자바스크립트 -->


<script>
    let defaltName = $('.idBox').val();
    var swiper = new Swiper(".mySwiper", {});
    $(function() {
        $(".idBoxbutton").on("click", function() {

            let changeName = $('.idBox').val();
            if(!(changeName == "")){

                if( defaltName == changeName){
                    $(".idBox").attr('disabled',false);
                    $('.idBox').focus();
                }
                else {

                    $(".idBox").attr('disabled',true);

                    // $(".idBox").css("width","20%");
                    defaltName = $('.idBox').val();
                }
            }

        });


    });
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: "auto",

        spaceBetween: 20,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
</script>

<!--랜덤 닉네임 생성 api
임의로 랜덤생성 버튼 만들어서 연결해놨으니 의도한 페이지 동작 방식 대로 가져다가 쓰시면 됩니다.
-->
<script>
    function randomName(){
        try {
            fetch('https://nickname.hwanmoo.kr/?format=json&count=1',{
                credentials: "include",
            }).then((response)=> response.json())
                .then((data)=>document.getElementById("nickname").value = data["words"][0]);
        } catch(err) {
            alert(err); // TypeError: Failed to fetch
        }
    }
</script>
</html>
