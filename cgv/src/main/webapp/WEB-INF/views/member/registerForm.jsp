<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    
    <!-- jQuery 로드 (파일 경로가 올바른지 확인) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>

    <script type="text/javascript">
        // jQuery가 로드된 후 실행될 코드
        $(document).ready(function(){
            // "다음" 버튼 클릭 이벤트 처리
            $('#nextButton').click(function(event){
                event.preventDefault();  // 폼 제출을 방지
                $('#register_form_1').hide();  // 첫 번째 폼 숨기기
                $('#register_form_2').show();  // 두 번째 폼 보이기
            });
        });

        // 생년월일 필드에 오늘 날짜를 max 값으로 설정
        document.addEventListener('DOMContentLoaded', function() {
            var today = new Date();
            var year = today.getFullYear();
            var month = today.getMonth() + 1;
            var day = today.getDate();

            if (month < 10) month = '0' + month;
            if (day < 10) day = '0' + day;

            var maxDate = year + '-' + month + '-' + day;

            document.getElementById('birthdate').setAttribute('max', maxDate);
        });
    </script>
    <style type="text/css">
    	.button {
		    display: flex;
		    justify-content: space-between; /* 버튼 간격을 자동으로 설정 */
		    gap: 10px; /* 버튼 간의 간격을 설정 (필요시 조정) */
		    margin-top: 20px; /* 버튼들 위쪽 간격 */
		}
    </style>
</head>
<body>
    <div class="container">
        <!-- 첫 번째 폼 -->
        <form id="register_form_1" class="form-container">
            <ul>
                <li><label class="form-label" for="id">아이디</label> <input type="text" id="id" name="id" class="form-input"></li>
                <li><label class="form-label" for="passwd">비밀번호</label> <input type="password" id="passwd" name="passwd" class="form-input"></li>
                <li><label class="form-label">비밀번호확인</label> <input type="password" id="cpasswd" name="cpasswd" class="form-input"></li>
            </ul>
            <!-- 버튼의 type을 'button'으로 변경 -->
            <button type="button" id="nextButton" class="btn btn-primary">다음</button>
        </form>

        <!-- 두 번째 폼 (처음에는 숨김) -->
        <form action="register.do" id="register_form_2" class="form-container" style="display: none;">
            <ul>
                <li>
                    <label class="form-label" for="name">이름</label> 
                    <input type="text" id="name" name="name" class="form-input">
                </li>
                <li>
                    <label class="form-label" for="birthdate">생년월일</label> 
                    <input type="date" id="birthdate" name="birthdate" class="form-input" max="">
                </li>
                <li>
                    <label class="form-label" for="gender">성별</label> 
                    <input type="radio" name="gender" value="male"> 남성
                    <input type="radio" name="gender" value="female"> 여성
                </li>
                <li>
                    <label class="form-label" for="phone">핸드폰 번호</label> 
                    <input type="text" id="phone" name="phone" class="form-input">
                </li>
                <li>
                    <label class="form-label" for="email">이메일</label> 
                    <input type="email" id="email" name="email" class="form-input">
                </li>
                <li>
					<input type="hidden" name="zipcode" id="zipcode"autocomplete="off">
				</li>
				<li>
					<label class="form-label" for="address1">주소</label>
					<input type="text" name="address1" id="address1" class="form-input">
				</li>
				<li>
					<label class="form-label" for="address2">나머지 주소</label>
					<input type="text" name="address2" id="address2" class="form-input">
					</li>
            </ul>
        <div class="button">
		    <button class="btn btn-secondary" onclick="execDaumPostcode()" type="button" style="justify-content: right; margin-top: 5px;">주소찾기</button>
		    <button class="btn btn-primary">회원가입</button>
		</div> 
        </form>
    </div>
    <!-- 다음 우편번호 API 시작 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //(주의)address1에 참고항목이 보여지도록 수정
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //(수정) document.getElementById("address2").value = extraAddr;
                
                } 
                //(수정) else {
                //(수정)    document.getElementById("address2").value = '';
                //(수정) }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
                document.getElementById("address1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>	
<!-- 다음 우편번호 API 끝 -->	
</body>
</html>
