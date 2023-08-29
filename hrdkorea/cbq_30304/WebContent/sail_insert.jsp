<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 70px;
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
		if(document.forms.form.saleno.value.trim() == ""){
			alert("매출전표번호가 입력되지 않았습니다.");
			form.saleno.focus();
			return false;
		}else if(document.forms.form.scode.value.trim() == ""){
			alert("지점코드가 입력되지 않았습니다.");
			form.scode.focus();
			return false;
		}else if(document.forms.form.saledate.value.trim() == ""){
			alert("판매일자가 입력되지 않았습니다.");
			form.saledate.focus();
			return false;
		}else if(document.forms.form.pcode.value.trim() == "none"){
			alert("피자코드가 입력되지 않았습니다.");
			form.pcode.focus();
			return false;
		}else if(document.forms.form.amount.value.trim() == ""){
			alert("판매수량이 입력되지 않았습니다.");
			form.amount.focus();
			return false;
		}else{
			alert("매출전표가 정상적으로 등록되었습니다!");
			document.forms.form.submit();
			conn.commit();
			return true;
		}
	}
	function resetBtn(){
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.forms.form.reset();
		return false;
	}
</script>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
	<h1>매출전표등록</h1>
	<form action="sail_insert_confirm.jsp" name="form">
		<table border=1>
			<tr>
				<td>매출전표번호</td>
				<td><input type="text" name="saleno"></td>
			</tr>
			<tr>
				<td>지점코드</td>
				<td><input type="text" name="scode"></td>
			</tr>
			<tr>
				<td>판매일자</td>
				<td><input type="text" name="saledate"></td>
			</tr>
			<tr>
				<td>피자코드</td>
				<td>
					<select name="pcode">
						<option value="none">피자선택</option>
						<option value="AA01">고르곤졸라피자</option>
						<option value="AA02">치즈피자</option>
						<option value="AA03">페퍼로니피자</option>
						<option value="AA04">콤비네이션피자</option>
						<option value="AA05">고구마피자</option>
						<option value="AA06">포테이토피자</option>
						<option value="AA07">불고기피자</option>
						<option value="AA08">나폴리피자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="text" name="amount"></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="button" value="점포등록" onclick="update()">
					<input type="button" value="다시쓰기" onclick="resetBtn()">				
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp" />