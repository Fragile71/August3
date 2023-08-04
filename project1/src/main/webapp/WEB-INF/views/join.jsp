<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/join.css?version=0.2">
<link rel="stylesheet" href="./css/menu.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#idCheck").click(
				function() {
					let id = $("#id").val();

					if (id == "" || id.length < 5) {

						$("#resultMSG").text("아이디는 5글자 이상이어야 합니다.");
						$("#resultMSG").css("color", "red");
						$("#resultMSG").css("font-weight", "bold");
						$("#resultMSG").css("font-size", "15pt");

						$("#id").focus();
						return false;

					} else {
						$.ajax({
							url : "./checkID",
							type : "post",
							data : {"id" : id},
							
							dataType : "json", // {result : 0}  
							success : function(data) {
								alert(data.result);

								if (data.result == 1) {
									$("#id").css("background-color", "red")
											.focus();
									$("#resultMSG").css("color", "red").text("이미 등록된 아이디입니다.");

								} else {
									$("#id").css("background-color", "white");
									$("#resultMSG").text("가입 가능").css("color","green");

								}

								//	$("#resultMSG").text("성공시 결과값 : "+ data);

							},
							error : function(request, status, error) {

								$("#resultMSG").text("오류가 발생하였습니다. 가입할 수 없습니다.");
								console.log(error);
							}

						});

					}

					return false;
				});

	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="signup">
		<form action="./join" method="post">
			<h1>회원가입</h1>
			<div class="signup2">

				<div>
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요"
						required="required" maxlength="10" onchange="checkID()">
					<button id="idCheck">중복검사</button>
					<br> <span id="resultMSG"></span>

				</div>

				<div>
					<input type="text" name="pw" id="pw" placeholder="비밀번호를 입력하세요"
						required="required" maxlength="10" onchange="checkID()">
				</div>


				<div>
					<input type="text" name="name" id="name" placeholder="이름을 입력하세요"
						required="required" maxlength="10" onchange="checkID()">
				</div>

				<div>
					<input type="text" name="addr" id="ADDR" placeholder="주소를 입력하세요"
						required="required" maxlength="40" onchange="checkID()">
				</div>


				<div>
					<input type="date" name="birth" id="BDATE" placeholder="생년월일"
						required="required" maxlength="8" onchange="checkID()">
				</div>

				<div>
					<select name="mbti">
						<option>MBTI 선택하세요</option>
						<optgroup label="내향형">
							<option value="ISTJ">ISTJ</option>
							<option value="ISTP">ISTP</option>
							<option value="ISFJ">ISFJ</option>
							<option value="ISFP">ISFP</option>
							<option value="INTJ">INTJ</option>
							<option value="INTP">INTP</option>
							<option value="INFJ">INFJ</option>
							<option value="INFP">INFP</option>
						</optgroup>
						<optgroup label="외향형">
							<option value="ESTJ">ESTJ</option>
							<option value="ESTP">ESTP</option>
							<option value="ESFJ">ESFJ</option>
							<option value="ESFP">ESFP</option>
							<option value="ENTJ">ENTJ</option>
							<option value="ENTP">ENTP</option>
							<option value="ENFJ">ENFJ</option>
							<option value="ENFP">ENFP</option>
						</optgroup>
					</select>




				</div>




				<div>
					<input type="radio" name="gender" id="m" value="1"> <label
						for="m">남자</label> <input type="radio" name="gender" id="f"
						value="0"> <label for="f">여자</label>
				</div>
			</div>

			<div class="label-row lrbtn">
				<button type='reset'>취소</button>
				<button type='submit'>가입하기</button>
			</div>


		</form>


	</div>


</body>
</html>