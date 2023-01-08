<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .navigationBar {
            height: 75px;

            left: 0;
            width: 100%;
            bottom: 0;
            z-index: 2;
            padding-top: 10px;
            position: sticky;
        }
        .idBox{

            width: auto;
            height: auto;

            background-color: #1A1A1A;
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
            background-color: #6E6E6E;
        }
        .nicktext{
            display: inline-block;
        }
        .countText{
            font-size: 30px;
        }
        .summeryText{
            font-size: 15px;
        }
        .exText{
            font-size: 25px;
        }

        .emty{
            width: 350px;
            height: 100px;
            align-items: center;
            text-align: left
        }

        .top{
            background-color: #1A1A1A;
            height: auto;

        }
        #bottom{
            background-color: #242424;
        }
        .moreText{
            font-size: 15px;
            background-color: #1A1A1A;
            color: white;
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


        /*.button{*/
        /*    background-color: #1A1A1A;*/
        /*    color: white;*/
        /*}*/
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
    </style>
</head>
<body>
<div class="container-fluid p-0">
    <div class="row g-0 text-center min-vh-100">
        <div class="col">공백</div>

        <div class="col border top border-black main">

            <div class="align-items-center  w-100   rounded-bottom   md-5" id= "top">

                <div id = 'title'>
                    <label class="text-white fs-6 mt-3">마이페이지</label>
                </div>
                <div id="imgBox"  >
                    <img class = "imgBox rounded-circle mt-5"

                            src ="data:image/jpeg;base64,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">

                </div>
                <div class ='nicktext'>
                    <input class='idBox text-white fs-4 fw-bold text-center mt-3'   value="인사인사" disabled >
                    <button class="idBoxbutton"><i class="fa-regular fa-pen-to-square"></i></button>
                </div>
                <div ids ='summery' class=" mt-5 row d-flex justify-content-around ">

                    <div id='report' class =' align-middle summeryBox badge '>
                        <br>
                        <label class ='countText pt-4 '> 0</label><br><br>
                        <label class = 'summeryText pt-3'> 제보한 가게</label>
                    </div>
                    <div id='review' class =' align-middle summeryBox badge '>
                        <br>
                        <label id='count' class= 'countText pt-4  '> 0 </label><br><br>
                        <label id='text' class='summeryText pt-3 '> 리뷰한 가게 </label>
                    </div>

                </div>
            </div>

            <div id = 'bottom' class ="text-white  h-100">

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
<%--                        <label class = 'align-middle rounded-pill button moreText px-3 py-2 me-4 '>더보기</label>--%>
                    </div>
                </div>

                <div id ='visitStore' class = ' mt-2 mx-4 mb-2'>
                    <div>
                        <div id='item1' class ='emty mt-4 rounded bg-secondary d-flex flex-row '>

                            <div id="img1" class=' pt-2 mt-4 mb-4 ms-4 me-2'>
                                <i class="fa-3x fa-solid fa-face-frown"></i>
                            </div>
                            <div id='storetext1' class='mt-4 mb-4 ms-2 me-2 text-left' >
                                <div class ="pb-1 tag">
                                    방문 인증 내역이 없어요!
                                </div>
                                <div class="tag">
                                    방문 인증으로 정확도를 높혀봐요
                                </div>
                            </div>
                        </div>
                    </div>

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
                        <label class = 'align-middle rounded-pill button moreText px-3 py-2 me-4 '>더보기</label>
                    </div>
                </div>

                <div class="stores swiper mySwiper  ms-4 ps-2 ">
                  <div class="swiper-wrapper">
                        <div class="swiper-slide  rounded bg-secondary  ">
                            <div class="d-flex flex-row ">
                                <div  class='mt-4 mb-4 ms-4 me-2'>
                                    <i class="fa-solid fa-burger fa-3x"></i>
                                </div>
                                <div class='storeEx mt-3 mb-4 ms-2 me-2 '>
                                    <div class="">
                                        호떡 트럭 이름
                                    </div>
                                    <div class="pt-1 tag" >
                                        #태그
                                    </div>
                                </div>
                            </div>
                        </div>
                      <div class="swiper-slide  rounded bg-secondary  ">
                          <div class="d-flex flex-row ">
                              <div  class='mt-4 mb-4 ms-4 me-2'>
                                  <i class="fa-solid fa-burger fa-3x"></i>
                              </div>
                              <div class='storeEx mt-3 mb-4 ms-2 me-2 '>
                                  <div class="">
                                      호떡 트럭 이름
                                  </div>
                                  <div class="pt-1 tag" >
                                      #태그
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="swiper-slide  rounded bg-secondary  ">
                      <div class="d-flex flex-row ">
                          <div  class='mt-4 mb-4 ms-4 me-2'>
                              <i class="fa-solid fa-burger fa-3x"></i>
                          </div>
                          <div class='storeEx mt-3 mb-4 ms-2 me-2 '>
                              <div class="">
                                  호떡 트럭 이름
                              </div>
                              <div class="pt-1 tag" >
                                  #태그
                              </div>
                          </div>
                      </div>
                  </div>
                    </div>
                </div>

        <div class ='navigationBar position-sticky bg-dark d-flex flex-row justify-content-around text-white'>
        <div>
            <a href="./">
                <i class="fas fa-home fa-2x"></i>
                <br>
                <label>홈 </label>
            </a>
        </div>
        <div>
            <a href="./">
                <i class="fas fa-pen fa-2x"></i>
                <br>
                <label>제보 하기</label>
            </a>
        </div>
        <div>
            <a href="./">
                <i class="fas fa-user fa-2x"></i><br>
                <label>마이페이지</label>
            </a>
        </div>
    </div>


            </div>

            </div>
        <div class="col">공백</div>

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
</html>
