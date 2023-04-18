<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 60px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
		
	}
</style>
<script>
function update(){
	if(document.forms.form.resvno.value.trim == ""){
		alert("접종예약번호가 입력되지 않았습니다.");
		form.resvno.focus();
		return false;
	}else if(dcoument.forms.form.jumin.value.trim == ""){
		alert("주민번호가 입력되지 않았습니다.");
		form.jumin.focus();
		return false;
	}else if(dcoument.forms.form.vcode.value.trim == ""){
		alert("백신코드가 입력되지 않았습니다.");
		form.vcode.focus();
		return false;
	}else if(dcoument.forms.form.hospcode.value.trim == ""){
		alert("병원코드가 입력되지 않았습니다.");
		form.hospcode.focus();
		return false;
	}else if(dcoument.forms.form.resvdate.value.trim == ""){
		alert("예약일자 입력되지 않았습니다.");
		form.resvdate.focus();
		return false;
	}else if(dcoument.forms.form.resvtime.value.trim == ""){
		alert("예약시간 입력되지 않았습니다.");
		form.resvtime.focus();
		return false;
	}else{
		alert("접종예약정보가 등록 되었습니다!");
		document.forms.form.submit();
		conn.commit;
		return true;
	}
	
}
function resetBtn(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.forms.form.reset();
}
</script>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />

 <section>
 <form name="form" action="vaccine_insert_confirm.jsp">
 	<table border=1>
 		<tr>
 			<td>접종예약번호</td>
 			<td><input type="text" name="resvno">예) 20210001</td>
 		</tr>
 		 <tr>
 			<td>주민번호</td>
 			<td><input type="text" name="jumin">예) 710101~1000001</td>
 		</tr>
 		<tr>
 			<td>백신코드</td>
 			<td><input type="text" name="vcode">예) V001 ~ V003</td>
 		</tr>
 		<tr>
 			<td>병원코드</td>
 			<td><input type="text" name="hospcode">예) H001</td>
 		</tr>
 		<tr>
 			<td>예약일자</td>
 			<td><input type="text" name="resvdate">예) 20211231</td>
 		</tr>
 		<tr>
 			<td>예약시간</td>
 			<td><input type="text" name="resvtime">예) 1230</td>
 		</tr>
 		<tr>
 			<td></td>
				<td><input type="submit" value="등록" onclick="update()">
				<input type="button" value="다시쓰기" onclick="resetBtn()"></td>
 		</tr>
 	</table>
 </form>
 </section>

<jsp:include page="footer.jsp" />