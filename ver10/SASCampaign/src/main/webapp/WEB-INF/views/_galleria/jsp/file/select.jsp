<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String userid = request.getParameter("uid");
	userid = "H12345";
	session.setAttribute("userid",userid);
%>
<!doctype html>
<head>
<title>SAS Campaign Management</title>
<meta charset="utf-8">
<link href="/favicon.ico" rel="shortcut icon"/>
<style type="text/css">
<!--
.textTitle {
	font-size:30px;
	font-weight:bold;
	color:#FFFFFF;
}
.textMenu {
	font-size:12px;
	color:#CCCCCC;
}
.tdMain {
	/*background-color:#36383C;*/
	background-color:#323433;
}
.tdMain:hover {
	/*background-color:#4A4A4D;*/
	background-color:#434343;
}
.tdApprove {
	background:url("/SASCampaign/_galleria/images/approve-off.png") no-repeat;
}
.tdApprove:hover {
	background:url("/SASCampaign/_galleria/images/approve-on.png") no-repeat;
}
.tdMonitor {
	background:url("/SASCampaign/_galleria/images/monitor-off.png") no-repeat;
}
.tdMonitor:hover {
	background:url("/SASCampaign/_galleria/images/monitor-on.png") no-repeat;
}
.tdDesign {
	background:url("/SASCampaign/_galleria/images/design-off.png") no-repeat;
}
.tdDesign:hover {
	background:url("/SASCampaign/_galleria/images/design-on.png") no-repeat;
}
.tdExcept {
	background:url("/SASCampaign/_galleria/images/except-off.png") no-repeat;
}
.tdExcept:hover {
	background:url("/SASCampaign/_galleria/images/except-on.png") no-repeat;
}
.tdExcel {
	background:url("/SASCampaign/_galleria/images/excel-off.png") no-repeat;
}
.tdExcel:hover {
	background:url("/SASCampaign/_galleria/images/excel-on.png") no-repeat;
}
.tdAppend {
	background:url("/SASCampaign/_galleria/images/append-off.png") no-repeat;
}
.tdAppend:hover {
	background:url("/SASCampaign/_galleria/images/append-on.png") no-repeat;
}
.tdPolicy {
	background:url("/SASCampaign/_galleria/images/center-policy-off.png") no-repeat;
}
.tdPolicy:hover {
	background:url("/SASCampaign/_galleria/images/center-policy-on.png") no-repeat;
}
.sortable tr:hover {
	cursor: pointer;
}
select.comboTeam option.option_combo
{
	background-color: #4A4A4D;
}
-->
html
{
	overflow-x: hidden;
	overflow-y: yes;
}
body
{
	font-family:'Malgun Gothic' !important;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body bgcolor="#4A4A4D">
<%
if (session.getAttribute("userid") != null) {
%>
<script src="/SASCampaign/_galleria/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function deleteFile(docNo) {
	userId='<%=session.getAttribute("userid").toString()%>'
	if (confirm("삭제 하시겠습니까?")) {
		jQuery.ajax({
			type:"POST",
			url:"/SASCampaign/_galleria/file/delete.do",
			data:"file_seq="+docNo+"&userid="+userId,
			dataType: "json",
			success:function(data) {
				alert('삭제되었습니다.');
				location.reload();
			},
			error: function(data, status, err) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
}
</script>
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
	<tr height="40">
		<td width="1">&nbsp;</td>
		<td width="19">&nbsp;</td>
		<td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">파일 업로드</font></b></td>
		<td width="1">&nbsp;</td>
	</tr>
	<tr height="20">
		<td>&nbsp;</td>
		<td colspan="2" bgcolor="#27292D">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan="2" align="center" bgcolor="#27292D">
			<table cellspacing="3" cellpadding="10" width="90%">
				<thead>
					<tr>
						<th width="100" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">일련번호</font></th>
						<th width="700" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">파일명</font></th>
						<th width="140" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D">&nbsp;</th>
					</tr>
				</thead>
<c:if test="${count != 0}">
	<c:forEach var="row" items="${result}" varStatus="status">
				<tr>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.file_seq}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.file_nm}"/></font></td>
					<td align="center" bgcolor="#4A4A4D">
						<button onclick="return deleteFile('${row.file_seq}');" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">삭제</font></button>
					</td>
				</tr>
	</c:forEach>
</c:if>
				<c:if test="${count == 0}">
				<tr>
					<td colspan="4" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록된 파일이 없습니다.</font></td>
				</tr>
				</c:if>
				<c:if test="${empty count}">
				<tr>
					<td colspan="4" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">등록된 파일이 없습니다.</font></td>
				</tr>
				</c:if>
			</table>
		<td>&nbsp;</td>
	</tr>

	<tr height="40">
		<td>&nbsp;</td>
		<td colspan="2" bgcolor="#27292D" align="right">
			<table width="100%" border="0" bgcolor="#27292D">
				<tr height="20">
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td width="20">&nbsp;</td>
					<td align="right">
						<button onclick="return openPopupForAppendPopup('excel');" style="background-color:#453A39;border:none;padding:5px">
							<font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>Excel 파일 추가</b>&nbsp;
							</font>
						</button>
					</td>
					<td width="20">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td>&nbsp;</td>
	</tr>

	<tr height="40">
		<td>&nbsp;</td>
		<td colspan="2" bgcolor="#27292D">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<script type="text/javascript">
function openPopupForAppendPopup(fileType) {
	window.open('/SASCampaign/_galleria/file/insert.do?type=' + fileType
			  , "_blank"
			  , "width=600,height=300,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no");
}
</script>
<%
} else {
%>
<br/><br/><br/><br/><br/>
<center><font face="Malgun Gothic" size="20" color="#FFFFFF">세션이 종료되었습니다.<br/><br/>다시 로그인 하시기 바랍니다.</font></center>
<%
}
%>
</body>



</html>

