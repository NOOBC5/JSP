<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 65px;
	left: 0;
	width: 100%;
	height: 100%;
}

h1 {
	text-align: center;
}

table {
	text-align: center;
	margin: auto;
}
</style>
<script>
	function update(){
		if(document.forms.form.regist_month.value.trim() == ""){
			alert("수강월이 입력되지않았습니다.");
			form.regist_month.focus();
			return false;
		}else if(document.forms.form.ca_no.value.trim() == "none"){
			alert("회원명 선택되지않았습니다.");
			form.ca_no.focus();
			return false;
		}else if(document.forms.form.c_no.value.trim() == ""){
			alert("회원번호가 입력되지않았습니다.");
			form.c_no.focus();
			return false;
		}else if(document.forms.form.class_area.value.trim() == "none"){
			alert("강의장소가 선택되지않았습니다.");
			form.class_area.focus();
			return false;
		}else if(document.forms.form.teacher_code.value.trim() == "none"){
			alert("강의명이 선택되지않았습니다.");
			form.teacher_code.focus();
			return false;
		}else if(document.forms.form.tuition.value.trim() == ""){
			alert("수강료가 입력되지않았습니다.");
			form.tuition.focus();
			return false;
		}else{
			document.forms.form.submit();
			conn.commit;
			return true;
		}
	}
	function resetBtn(){
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.forms.form.reset();
		return false;
	}
	function change(){
		
		var values = document.getElementById('test').value;
		document.getElementById('c_no').value = values;
	}
	function change2(){
		
		var values = document.getElementById('test1').value;
		var values2 = 100000;
		var values3 = document.getElementById('c_no').value;
		
		/* if(values == '100') values2;
		if(values == '200') values2 * 2;
		if(values == '300') values2 * 3;
		if(values == '400') values2 * 4; */
		if(values == '100'){
			values2 = values2;
		}else if(values == '200'){
			values2 = values2 * 2;
		}else if(values == '300'){
			values2 = values2 * 3;
		}else if(values == '400'){
			values2 = values2 * 4;
		}
		
		if(values3 <= 20000){
			document.getElementById('tuition').value = values2;	
		}else if(values3 >= 20000){
			document.getElementById('tuition').value = values2 / 2;
		}
	}
</script>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
	<h1>수강신청</h1>
	<form action="class_insert_confirm.jsp" name="form">
		<table border=1>
			<tr>
				<td>수강월</td>
				<td><input type="text" name="regist_month">2022년03월 예)202203</td>
			</tr>
			<tr>
				<td>회원명</td>
				<td><select id="test" name="ca_no" onchange="change()">
						<option value="none">회원명</option>
						<option value="10001">홍길동</option>
						<option value="10002">장발장</option>
						<option value="10003">임꺽정</option>
						<option value="20001">성춘향</option>
						<option value="20002">이몽룡</option>
				</select></td>
			</tr>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="c_no" id="c_no" >예)10001</td>
			</tr>
			<tr>
				<td>강의장소</td>
				<td><select name="class_area">
						<option value="none">강의장소</option>
						<option value="서울분원">서울분원</option>
						<option value="성남분원">성남분원</option>
						<option value="대전분원">대전분원</option>
						<option value="부산분원">부산분원</option>
						<option value="대구분원">대구분원</option>
				</select></td>
			</tr>
			<tr>
				<td>강의명</td>
				<td><select id="test1" name="teacher_code" onchange="change2()">
						<option value="none">강의신청</option>
						<option value="100">초급반</option>
						<option value="200">중급반</option>
						<option value="300">고급반</option>
						<option value="400">심화반</option>
				</select></td>
			</tr>
			<tr>
				<td>수강료</td>
				<td><input type="text" name="tuition" id="tuition">원</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수강신청" onclick="update()">
					<input type="button" value="다시쓰기" onclick="resetBtn()">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp" />