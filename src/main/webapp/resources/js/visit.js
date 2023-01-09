$(function(){
    // 처음 위치는 가게 table에 저장된 위도, 경도로 설정
    const container = document.getElementById('map-section'); //지도를 담을 영역의 DOM 레퍼런스
    const options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(36.10367691445477, 129.38881155932162), //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
    };
    new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
});
/** header: "<" 뒤로가기 버튼 클릭 **/
function back() {
    history.back();
}