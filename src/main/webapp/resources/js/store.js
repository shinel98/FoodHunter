
$(function (){
    calculateDistance();
    const searchParams = new URLSearchParams(location.search);

    for (const param of searchParams) {
        if(Boolean(param.at(1))) {
            alert("이미 리뷰를 작성했습니다. 다시 작성하려면 기존 리뷰를 삭제하세요.");
            location.href = "/store";   // reviewError=false 값으로 다시 되돌리기
        }
    }

    // 처음 위치는 가게 table에 저장된 위도, 경도로 설정
    const container = document.getElementById('map-section'); //지도를 담을 영역의 DOM 레퍼런스
    const options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(36.10367691445477, 129.38881155932162), //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
    };
    new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    Kakao.init('453d03fdea794867e41a9d927cff2cac'); // 사용하려는 앱의 JavaScript 키 입력
    console.log(Kakao.isInitialized());

    /**
     * content->title == addressTitle
     * 가게 이미지 -> 카테고리별 기본 이미지를 사용할 것인가? 가게 등록할 때 이미지를 넣도록 할 것인가?
     * webUrl에 /store로 들어가면 해당 가게에 대한 정보 페이지로 넘어가는지 확인해야 함.
     * **/
    Kakao.Share.createDefaultButton({
        container: '#kakaotalk-sharing-btn',
        objectType: 'location',
        address: '경기 성남시 분당구 판교역로 235', // 공유할 위치의 주소
        addressTitle:'그할마 붕어빵', // 카카오 지도 내 지도 뷰에서 사용될 타이틀
        content: {
            title: '그할마 붕어빵',      // 가게 이름
            description: '#붕어빵',    // 카테고리 태그
            imageUrl:
                'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
            link: {
                // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
                mobileWebUrl: 'https://developers.kakao.com',
                webUrl: 'https://developers.kakao.com',
            },
        },
        social: {
            likeCount: 286, // 즐겨찾기 추가한 사람 수
            commentCount: 45,   // 리뷰 수
            // sharedCount: 845,    // 공유한 숫자는 넣을지 말지 고민
        },
        buttons: [
            {
                title: '웹으로 보기',
                link: {
                    // 모바일은 현재 localhost라 연결 안되는 상태. 배포 후에 점검해보기
                    mobileWebUrl: 'http://localhost:8080/store',
                    webUrl: 'http://localhost:8080/store',
                },
            },
            // 위치 보기 버튼은 자동 생성됨
        ],
    });


});

// 1초마다 계산한 거리 업데이트하기
function calculateDistance(){

    var myLat, myLon;
    var destLat, destLon;   // Todo : DB 연동해서 목적지 주소 넣기
    // 목적지 -> 임의로 테스트
    destLat =  36.08618059199135;
    destLon = 129.41260195413844;
    var destLatSec = destLat.toFixed(15)*60*60;
    var destLonSec = destLon.toFixed(15)*60*60;
    var element = document.getElementById("distance-text");

    setInterval(function(){
        if (navigator.geolocation) {
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
                myLat = position.coords.latitude; // 위도
                myLon = position.coords.longitude; // 경도
            });
        }
        var myLatSec = (myLat.toFixed(15))*60*60;
        var myLonSec = (myLon.toFixed(15))*60*60;
        var gapLat = (myLatSec > destLatSec) ? myLatSec - destLatSec : destLatSec - myLatSec;
        var gapLon = (myLonSec > destLonSec) ? myLonSec - destLonSec : destLonSec - myLonSec;
        var meterLat = gapLat*30.887;
        var meterLon = gapLon*24.778;
        var distance = Math.sqrt(Math.pow(meterLon, 2) + Math.pow(meterLat, 2));
        distance = distance.toFixed(2);
        element.innerHTML = distance + "m";
    }, 1000);
}

/** footer: 즐겨찾기 버튼 클릭 **/
/** Todo : icon의 초기 값을 DB와 연동 및 수정 **/
function favorite(){
    let favoriteBtn =  document.getElementsByClassName("favoriteBtn");
    let favoriteIcon = favoriteBtn.item(0).classList.item(2);
    if(favoriteIcon == "bi-heart") {
        for(let i=0; i<favoriteBtn.length; i++){
            favoriteBtn[i].classList.remove('bi-heart');
            favoriteBtn.item(i).classList.add('bi-heart-fill');
        }
    }
    else {
        for(let i=0; i<favoriteBtn.length; i++){
            favoriteBtn[i].classList.remove('bi-heart-fill');
            favoriteBtn.item(i).classList.add('bi-heart');

        }
    }
}

/** header: "<" 뒤로가기 버튼 클릭 **/
function back() {
    history.back();
}

/** footer: 방문인증하기 버튼 클릭 **/
function visit() {
    location.href = "/visit";
}

/** 삭제 요청 **/
function deletion() {

}


/** 리뷰 작성하기 **/
function reviewWrite() {
    // black-bg 효과 안먹음. 수정하기
    document.getElementById("review-write-container").style.visibility = "visible";

}

/** 리뷰 작성 취소 **/
function reviewCancel(){
    document.getElementById("review-form").reset();
    document.getElementById("review-write-container").style.visibility = "hidden";
}

/** 정보 수정하기 **/
function infoEdit() {

}

/** Todo : 현재 위치에 마커 생성되도록 수정!! **/
function mylocation(){
    const container = document.getElementById('map-section'); //지도를 담을 영역의 DOM 레퍼런스
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

            const lat = position.coords.latitude; // 위도
            const lon = position.coords.longitude; // 경도

            const options = { //지도를 생성할 때 필요한 기본 옵션
                center: new kakao.maps.LatLng(lat, lon), //지도의 중심좌표.
                level: 3 //지도의 레벨(확대, 축소 정도)
            };
            const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

            // 마커 이미지의 이미지 주소입니다
            const imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

            const imageSize = new kakao.maps.Size(24, 35);

            // 마커 이미지를 생성합니다
            const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: new kakao.maps.LatLng(lat, lon), // 마커를 표시할 위치
                title: "내 위치", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image: markerImage // 마커 이미지
            });
        });
    }
}
