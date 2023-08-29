<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 40px;
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
		if(document.forms.form.artist_id.value.trim() == ""){
			alert("참가번호가 입력되지 않았습니다!");
			form.artist_id.focus();
			return false;
		}else if(document.forms.form.artist_name.value.trim() == ""){
			alert("참가자명이 입력되지 않았습니다!");
			form.artist_id.focus();
			return false;
		}else if(document.forms.form.year.value.trim() == ""){
			alert("생년월일이 입력되지 않았습니다!");
			form.artist_id.focus();
			return false;
		}else if(document.forms.form.month.value.trim() == ""){
			alert("생년월일이 입력되지 않았습니다!");
			form.artist_id.focus();
			return false;
		}else if(document.forms.form.day.value.trim() == ""){
			alert("생년월일이 입력되지 않았습니다!");
			form.artist_id.focus();
			return false;
		}else if(document.forms.form.artist_gender.value.trim() == ""){
			alert("성별이 선택되지 않았습니다!");
			form.artist_id.focus();
			return false;
		}else if(document.forms.form.talent.value.trim() == "none"){
			alert("특기가 선택되지 않았습니다!");
			form.artist_id.focus();
			return false;
		}else if(document.forms.form.agency.value.trim() == ""){
			alert("소속사가 입력되지 않았습니다!");
			form.artist_id.focus();
			return false;
		}else{
			alert("참가신청이 정상적으로 등록 되었습니다!");
			document.forms.form.submit();
			conn.commit();
			return true;
		}
	}
	function resetBt(){
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.forms.form.reset();
		return false;
	}
</script>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<h1>오디션 등록</h1>
	<form action="audition_insert_confirm.jsp" name="form">
		<table border=1>
			<tr>
				<td>참가번호</td>
				<td><input type="text" name="artist_id">*참가번호는
					(A000)4자리입니다</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td><input type="text" name="artist_name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="year">년 <input
					type="text" name="month">월 <input type="text"
					name="day">일</td>

			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="artist_gender" value="M">남성 <input
					type="radio" name="artist_gender" value="F">여성</td>
			</tr>
			<tr>
				<td>특기</td>
				<td><select name="talent">
						<option value="none">특기선택</option>
						<option value="1">보컬</option>
						<option value="2">댄스</option>
						<option value="3">랩</option>
				</select></td>
			</tr>
			<tr>
				<td>소속사</td>
				<td><input type="text" name="agency"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="오디션 등록" onclick="update()">
					<input type="button" value="다시쓰기" onclick="resetBt();">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>