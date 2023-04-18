<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 200px;
		width: 100%;
		height: 100%;
	}
</style>
<script>
	function update(){
		if(document.forms.form.p_no.value.trim == ""){
			alert("환자코드를 입력하세요!");
			form.p_no.focus();
			return false;
		}else if(document.forms.form.t_code.value.trim == ""){
			alert("검사명을 선택하세요!");
			return false;
		}else if(document.forms.form.t_sdate.value.trim == ""){
			alert("검사시작일을 입력하세요!");
			form.t_sdate.focus();
			return false;
		}else if(document.forms.form.t_status.value.trim == ""){
			alert("검사상태를 선택하세요!");
			return false;
		}else if(document.forms.form.t_ldate.value.trim == ""){
			alert("검사 완료일을 입력하세요!");
			form.t_ldate.focus();
			return false;
		}else if(document.forms.form.t_result.value.trim == ""){
			alert("검사 결과를 선택하세요!");
			return false;
		}else {
			alert("정상적으로 등록되었습니다!");
			document.forms.form.submit();
			conn.commit();
			return true;
		}
			
	}
	
function resetBtn(){
	alert("모든 데이터를 삭제하고 처음부터 다시 입력합니다!");
	document.forms.form.reset();
	form.p_no.focus();
}
</script>
<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />

<section>
	<h2>검사결과 입력</h2>
	<form name="form" action="result_insert01_confirm.jsp">
	<table border=1>
		<tr>
			<td>환자코드</td>
			<td><input type="text" name="p_no">예)1001</td>
		</tr>
		<tr>
			<td>검사명</td>
			<td>
				<select name="t_code">
					<option selected>검사명
					<option value="T001">[T001]결핵
					<option value="T002">[T002]장티푸스
					<option value="T003">[T003]수두
					<option value="T004">[T004]홍역
					<option value="T005">[T005]콜레라
				</select>
			</td>
		</tr>
		<tr>
			<td>검사시작일</td>
			<td><input type="text" name="t_sdate"></td>
		</tr>
		<tr>
			<td>검사상태</td>
			<td><input type="radio" name="t_status" value="1">검사 중
				<input type="radio" name="t_status" value="2">검사 완료
			</td>
		</tr>
		<tr>
			<td>검사완료일</td>
			<td><input type="text" name="t_ldate"></td>
		</tr>
		<tr>
			<td>검사결과</td>
			<td><input type="radio" name = "t_result" value="X">미입력
				<input type="radio" name = "t_result" value="P">양성
				<input type="radio" name = "t_result" value="N">음성
			</td>
		</tr>
		<tr>
		<td></td>
			<td>
				<input type="button" value="등록" onclick="update()">
				<input type="button" value="재입력" onclick="resetBtn()">
			</td>
		</tr>
	</table>
	</form>
</section>

<jsp:include page="footer.jsp" /> 