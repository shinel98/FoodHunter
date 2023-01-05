<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <style>
        .navigationBar{
            height: 50px;

            left: 0;
            width :100%;
            bottom:0;
            background : white;
            position:fixed;
        }
        .itemBox{
            width: 200px;
            height: 60px;
        }
        .swiper{
            width: 100%;
            height: 100%;
        }
        .top{
            background-color: 1A1A1A;
        }

    </style>
</head>
<body>
<div class="container-fluid p-0">
    <div class="row g-0 text-center min-vh-100">
        <div class="col">공백</div>
        <div class="col border bg-dark border-black main">
            <div class="top align-items-center h-25 w-100  opacity-75 rounded-bottom  md-5" id= "top">
                <div id = 'title'>
                    <label class="text-white fs-6">마이페이지</label>
                </div>
                <div id ='nicktext'>
                    <input class='idBox top text-white fs-4 text-center' style="border: none" value="인사인사" disabled >
                    <button class="idBoxbutton">수정</button>
                </div>
                <div ids ='summery' class="mt-5 row d-flex justify-content-around ">
                    <div id='report' class =' align-items-cente w-auto badge bg-secondary'>
                        <label class ='count fs-5'> 0</label><br><br>
                        <label class = 'text fs-6'> 제보한 가게</label>
                    </div>
                    <div id='review' class ='align-items-cente w-auto  badge bg-secondary'>
                        <label id='count' class= 'fs-5'> 0 </label><br><br>
                        <label id='text' class='fs-6'> 리뷰한 가게 </label>
                    </div>

                </div>
            </div>
            <div id = 'botom' class ="text-white bg-dark h-100">

                <div id="visit" class ="">
                </div>
                <div id ='visitText' class='text-start'>
                    <div>
                        <label class = 'mx-4 mt-2 '>방문 인증</label><br>
                    </div>
                    <div class = 'd-flex flex-row justify-content-between'>
                        <label class = 'mx-4 fs-5 '>최근 내가 들린 가게는? ></label>
                        <label class = 'rounded bg-secondary'>더보기</label>
                    </div>
                </div>
                <div id ='visitStore' class = ' container mt-2 mx-4 mb-2'>
                    <div>
                        <div id='item1' class ='w-50 mt-4 rounded bg-secondary d-flex flex-row justify-content-start'>
                            <div id="img1" class='mt-4 mb-4 ms-4 me-2'>
                                이미지
                            </div>
                            <div id='storetext1' class='mt-4 mb-4 ms-2 me-2'>
                                호떡 트럭
                            </div>
                        </div>
                    </div>

                </div>
                <div clss ='like'>
                </div>
                <div id ='likeText' class='text-start'>
                    <div>
                        <label class = 'mx-4 mt-2 '>방문 인증</label><br>
                    </div>
                    <div class = 'd-flex flex-row justify-content-between'>
                        <label class = 'mx-4 fs-5 '>최근 내가 들린 가게는? ></label>
                        <label class = 'rounded bg-secondary'>더보기</label>
                    </div>
                </div>
                <div class ='swiper mySwiper d-inline'>
                    <div class ='swiper-wrapper  mt-2 mx-4 mb-2 '>

                        <div  class ="swiper-slide myitemBox mt-4 rounded bg-secondary d-flex flex-row justify-content-start">
                                <div  class='mt-4 mb-4 ms-4 me-2'>
                                    이미지1
                                </div>
                                <div class='mt-4 mb-4 ms-2 me-2'>
                                호떡 트럭1
                                </div>
                        </div>
                        <div  class ="swiper-slide myitemBox mt-4 rounded bg-secondary d-flex flex-row justify-content-start">
                            <div  class='mt-4 mb-4 ms-4 me-2'>
                                이미지2
                            </div>
                            <div class='mt-4 mb-4 ms-2 me-2'>
                                호떡 트럭2
                            </div>
                        </div>
                        <div  class ="swiper-slide myitemBox mt-4 rounded bg-secondary d-flex flex-row justify-content-start">
                            <div  class='mt-4 mb-4 ms-4 me-2'>
                                이미지3
                            </div>
                            <div class='mt-4 mb-4 ms-2 me-2'>
                                호떡 트럭3
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <div class ='navigationBar position-sticky bg-dark d-flex flex-row justify-content-around border-top border-secondary text-white'>
                <div>
                        <label>홈 이미지</label>
                </div>
                <div>
                    <label>제보이미지</label>
                </div>
                <div>
                    <label>마이페이지이미지</label>
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
                    defaltName = $('.idBox').val();
                }
            }

        });


    });
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: "auto",
        spaceBetween: 30,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
</script>
</html>
