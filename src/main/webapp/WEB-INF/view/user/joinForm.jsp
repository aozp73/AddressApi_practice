<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>

            <div class="container my-3">
                <div class="container d-flex justify-content-center">
                    <form action="/join" method="post" onsubmit="return valid()">

                        <div class="d-flex form-group mb-2">
                            <div class="d-flex ">
                                <input id="username" type="text" name="username" class="form-control"
                                    placeholder="Enter username" size="30">
                            </div>
                            <button type="button" class="badge bg-secondary ms-2" onclick="sameCheck()">중복확인</button>
                        </div>


                        <div class="d-flex form-group mb-2">
                            <div class="d-flex">
                                <input id="password" type="password" name="password" class="form-control"
                                    placeholder="Enter password" size="40">
                            </div>
                        </div>

                        <div class="d-flex form-group mb-2">
                            <div style="position :relative;" class="d-flex">
                                <input id="passwordCheck" type="password" name="passwordCheck" class="form-control"
                                    placeholder="Enter passwordCheck" size="40">
                                <div id="passwordCheckBox">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex form-group mb-2">
                            <div class="d-flex ">
                                <input id="sample6_postcode" type="text" name="adress" class="form-control"
                                    placeholder="우편번호" size="30">
                            </div>
                            <button type="button" class="badge bg-secondary ms-2" 
                             onclick="  execDaumPostcode()">주소검색</button>
                        </div>
                        <div class="d-flex form-group mb-2">
                            <div class="d-flex ">
                                <input id="sample6_address" type="text" name="adress" class="form-control"
                                    placeholder="주소" size="30">
                            </div>
                        </div>
                        <div class="d-flex form-group mb-2">
                            <div class="d-flex ">
                                <input id="sample6_detailAddress" type="text" name="adress" class="form-control"
                                    placeholder="상세주소" size="30">
                            </div>
                        </div>
                        <div class="d-flex form-group mb-2">
                            <div class="d-flex ">
                                <input id="sample6_extraAddress" type="text" name="adress" class="form-control"
                                    placeholder="참고항목" size="30">
                            </div>
                        </div>


                        <div class="d-flex form-group mb-2">
                            <div class="d-flex">
                                <input id="email" type="email" name="email" class="form-control"
                                    placeholder="Enter email" size="40">
                            </div>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-primary">회원가입</button>
                        </div>
                    </form>
                </div>
            </div>
<script>

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

     

        <%@ include file="../layout/footer.jsp" %>