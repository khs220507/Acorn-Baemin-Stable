<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Login Result</title>
<style>
/* CSS 스타일 정의 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

header {
	background-color: #48D1CC;
	height: 100px;
	margin-bottom: 50px;
}

section{
width: 1280px;
	padding-top: 140px;
	margin-bottom: 50px;
}

footer {
	
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.input-container {
	display: flex;
	align-items: center;
}

input[type="text"] {
	flex: 1;
	/* Allow the input to expand and fill available space */
}

button#checkDuplicate {
	background-color: #48D1CC;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
	/* Add margin to separate the button from the input */
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.login-title {
	text-align: center;
	padding: 20px;
}

h1 {
	color: #333;
}

p {
	font-size: 18px;
	color: #555;
}

.signup-form {
	background-color: #fff;
	padding: 20px;
	max-width: 350px;
	/* 폼의 최대 너비 설정 */
	width: 100%;
	border: 3px solid #48D1CC;
	box-shadow: 0px 0px 5px #ccc;
	border-radius: 10px;
}

span {
	display: block;
	margin-top: 5px;
	margin-bottom: 5px;
	font-weight: bolder;
}

.input-container-id {
	display: flex;
	align-items: center;
}

.input-container-address {
	display: flex;
	align-items: center;
}

.input-container-address-button {
	font-size: 20px;
}

input[type="text"], input[type="password"], input[type="tel"], input[type="email"],
	input[type="date"], input[type="button"] {
	width: 99%;
	height: 25px;
	padding: 10px;
	font-size: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="button"] {
	background-color: #48D1CC;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
}

.vertical-center {
	line-height: 30px;
	/* 이 값을 조정해서 세로 중앙 정렬의 높이를 조절할 수 있음 */
}

input:focus {
	border-color: #0982f0;
	/* 포커스 시 테두리 색상 설정 */
	outline: none;
	/* 포커스 아웃라인 제거 */
}

input[type="submit"] {
	font-weight: bolder;
	font-size: 18px;
	background-color: #48D1CC;
	color: white;
	height: 50px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 250px;
	display: block;
	margin: 0 auto;
}

a {
	color: #007bff;
	text-decoration: none;
}

.options {
	position: relative;
	align-items: center;
	height: 20px;
}

.optlab1 {
	left: 0px;
}

.optlab2 {
	right: 0px;
}

.options label {
	margin-right: 20px;
	/* 각 옵션 사이의 간격 조절 */
	position: absolute;
}

.remember-me {
	display: flex;
	align-items: center;
	font-size: 12px;
}

.remember-links {
	font-size: 12px;
	left: 0px;
}

.signup-link {
	margin-top: 10px;
	text-align: right;
	font-size: 12px;
}

.right-links {
	text-align: right;
}

.kakao {
	margin-top: 20px;
	text-align: center;
}
</style>
<script>

// 사장님 회원가입 부분 ajax. id 값을 가져옴.
function signup() {
	
	let sellerId = $("#sellerId").val();
   	let sellerPw = $("#sellerPw").val();
   	let confirmPassword = $("#confirmPassword").val();
   	let sellerName = $("#sellerName").val();   
   	let sellerRegCode = $("#sellerRegCode").val();
   	let sellerPhone = $("#sellerPhone").val();
   	let sellerEmail = $("#sellerEmail").val();
   	let sellerBirth = $("#sellerBirth").val();
   	let sellerGender = $('input[name=option]:checked').val();
   	
   	if(confirmPassword == sellerPw ) {
   		
   	let info = {sellerId :sellerId,
   	 sellerPw :sellerPw,
   	 sellerName :sellerName,	
   	 sellerRegCode :sellerRegCode,
	 sellerPhone :sellerPhone,
	 sellerEmail :sellerEmail,
	 sellerBirth :sellerBirth,
	 sellerGender :sellerGender};
   	
   	let infos = JSON.stringify(info);
   	
		$.ajax({
			type : "POST",
			url : "/baemin/seller_signup",
			data : infos,
			contentType : "application/json", // 필수
			success : function(data) {
				alert("가입축하 q(≧▽≦q)");
				
				 window.location.href = "http://localhost:8080/baemin/home";
			},
			error : function() {
				alert("error");
			}
			});
	}
   	
////중요/////
	$(document)
			.ready(
					function() {
						let userIdValid = false;
						let userPwValid = false;
						let confirmPasswordValid = false;
						let userNameValid = false;
						let userNicknameValid = false;
						//alert("문서로드");
						// 아이디 유효성 검사
						$("#sellerId").on("input", function() {
							let idCheck = /^[a-zA-Z0-9]{6,8}$/;
							let sellerId = $(this).val();

							if (sellerId === "" || !idCheck.test(sellerId)) {
								$(this).css("border-color", "red");
								sellerIdValid = false;
							} else {
								$(this).css("border-color", "");
								sellerIdValid = true;
							}
						});

						// 아이디 중복 확인
						$("#checkDuplicate").click(
								function() {

									alert("중복탄다");
									if ($("#sellerId").val() == "") {
										alert("아이디를 입력해주세요.");
									} else {
										alert($("#sellerId").val());
										$.ajax({
											url : "/baemin/checkDuplicate",
											type : "POST",
											data : {
												'sellerId' : $("#sellerId").val()
											},
											contentType : "application/json", // 필수
											success : function(data) {
												alert(data);
												if (data === "yes") {
													$("#idcheck_blank").css(
															"color", "red");
													$("#idcheck_blank").text(
															"중복된 아이디입니다.");
													id_check = false;
													$("#sellerId").val("");
												} else {
													$("#idcheck_blank").css(
															"color", "blue");
													$("#idcheck_blank").text(
															"사용가능한 아이디입니다.");
													id_check = true;
												}
											},
											error : function() {
												alert("중복확인안됨ㅠ");
											}
										});
									}
									toggleIdConfirmButton();
								});

						// 아이디 확인 버튼 토글
						function toggleIdConfirmButton() {
							if (sellerIdValid) {
								$("#id_Confirm").show();
							} else {
								$("#id_Confirm").hide();
							}
						}

						// 비밀번호 유효성 검사
						$("#sellerPw")
								.on(
										"input",
										function() {
											let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

											if ($(this).val() === ""
													|| !pwdCheck.test($(this)
															.val())) {
												$(this).css("border-color",
														"red");
												sellerPwValid = false;
											} else {
												$(this).css("border-color", "");
												sellerPwValid = true;
											}
										});

						// 비밀번호 확인
						$("#confirmPassword").on(
								"input",
								function() {
									if ($(this).val() === ""
											|| !sellerPwValid
											|| $("#sellerPw").val() !== $(this)
													.val()) {
										$(this).css("border-color", "red");
										confirmPasswordValid = false;
									} else {
										$(this).css("border-color", "");
										confirmPasswordValid = true;
									}
								});

						// 손님 이름
						$("#sellerName").blur(function() {
							if ($("#sellerName").val == "") {
								sellerName = false;
							} else {
								sellerName = true;
							}
						});

					
						
						// 연락처 유효성 검사
						$("#sellerPhone").on("input", function () {
						    let phoneCheck = /^[0-9]{11}$/;

						    if ($(this).val() === "" || !phoneCheck.test($(this).val())) {
						        $(this).css("border-color", "red");
						        sellerPhoneValid = false;
						    } else {
						        $(this).css("border-color", "");
						        sellerPhoneValid = true;
						    }
						});
						
						// 이메일 유효성 검사
						$("#sellerEmail").on("input", function () {
						    let emailCheck = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

						    if ($(this).val() === "" || !emailCheck.test($(this).val())) {
						        $(this).css("border-color", "red");
						        sellerEmailValid = false;
						    } else {
						        $(this).css("border-color", "");
						        sellerEmailValid = true;
						    }
						});
						
						// 생년월일 유효성 검사
						$("#sellerBirthdate").on("input", function () {
						    let birthdateCheck = /^(19\d\d|20[0-2]\d)-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;

						    if ($(this).val() === "" || !birthdateCheck.test($(this).val())) {
						        $(this).css("border-color", "red");
						        sellerBirthdateValid = false;
						    } else {
						        $(this).css("border-color", "");
						        sellerBirthdateValid = true;
						    }
						});
						

						// 회원가입 버튼 클릭 시 유효성 검사 및 서버 전송
						$("#signin_button").click(
								function() {
									if (sellerIdValid && sellerPwValid
											&& confirmPasswordValid) {
										// 서버로 전송할 로직 추가
										alert("회원가입이 완료되었습니다.");
									} else {
										alert("입력 정보를 확인해주세요.");
									}
								});

					});
   	
   	
   	
   	
   	
}
</script>

</head>

<body>
	<jsp:include page="../base/header.jsp"/>
	<section id="content">


		<div class="container">

			<!-- 회원가입 폼 -->
			<div class="signup-form" >
			
				<div class="login-title">
					<h1>사장님 회원가입</h1>
				</div>


				<span class="input-container-id"> 
				<table>
						<td>아이디</td>
						<td><span><input type="text" id="sellerId"
								name="sellerIdn" placeholder="영문, 숫자 조합 6~8자"
								class="vertical-center" maxlength="8"></span>
							<button id="checkDuplicate">중복확인</button></td>
				</table>				
				</span> 
				
				<table>
					<td>비밀번호</td>
					<td><span><input type="password" id="sellerPw"
							name="m_password" placeholder="영문, 숫자, 특수문자 조합 8~16자"
							class="vertical-center" maxlength="16"></span></td>
				</table>
				<table>
					<td>비밀번호 확인</td>
					<td><span><input type="password" id="confirmPassword"
							name="confirmPassword" placeholder="비밀번호 확인"
							class="vertical-center" maxlength="16"> </span></td>
				</table>
				<table>
					<td>이름</td>
					<td><span><input type="text" id="sellerName"
							placeholder="이름" class="vertical-center"> </span></td>
				</table>
				
				
				
				<span> 
				<input type="text" id="sellerRegCode" placeholder="사업자등록번호" class="vertical-center">
				</span> <br> 
				<table>
					<td>연락처</td>
					<td><span> <input type="tel" id="sellerPhone"
							placeholder="연락처('-' 없이 11자리)" class="vertical-center"
							pattern="[0-9]{11}" title="숫자 11개를 입력하세요"></span></td>
				</table>
				<table>
					<td>이메일</td>
					<td><span> <input type="email" id="sellerEmail"
							placeholder="이메일" class="vertical-center">
					</span></td>
				</table>
				<table>
					<td>생년월일</td>
					<td><span> <input type="date" id="sellerBirth"
							placeholder="생년월일 8자리" class="vertical-center">
					</span></td>
				</table>
				
				<div class="options">
					<label class="optlab1"><input type="radio" name="option" id="maleOption" value="0">남</label> 
					<label class="optlab2"><input type="radio" name="option" id="femaleOption" value="1">여</label>					
				</div> <br>
				 
				<button onclick="signup()" value="회원가입">회원가입</button>

			</div>


			<p><a href="${path}/home">홈으로 돌아가기</a></p>
		</div>

	</section>
	<jsp:include page="../base/footer.jsp"/>


</body>

</html>