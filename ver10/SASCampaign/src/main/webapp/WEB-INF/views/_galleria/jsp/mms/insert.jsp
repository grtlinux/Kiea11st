<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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
	Date d = new Date();
	SimpleDateFormat f = new SimpleDateFormat("yyyyMMdd");
	String today=f.format(d);
%>
<script src="/SASCampaign/_galleria/js/jquery-1.9.1.min.js"></script>
<script src="/SASCampaign/_galleria/js/jquery.form.min.js"></script>
<!-- KANG-20210316: CHANGE-START -->
<script type="text/javascript">
var fileInput;
// KANG-20210316: 특수 문자 체크
function checkSpecial(chkStr) {
	var fname = chkStr.replace(/C:\\fakepath\\/g, '');
	//alert("KANG: suffixName = [" + document.uploadForm.suffixName.value + "]");
	//alert("KANG: fname = ["+fname+"] from ["+chkStr+"]");
	/*
	//var regExp = /[~!@#$%^&*()_+-|<>?:;`,{}\]\[/\'\"\\\']/gi;
	var regExp = /[~!@#$%^&*+-|<>?:;`,{}\]\[/\'\"\\\']/gi;
	if (regExp.test(str)) {
		return true;
	} else {
		return false;
	}
	*/
	// KANG-20210316: checking the filename...
	fname = fname.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''); // eliminate korean letter
	fname = fname.replace(/[a-zA-Z0-9_\-\.]/g, ''); // eliminate the letter of alph(lower,uppper) and num
	if (fname != "") {
		//alert("KANG: 특수문자 ["+fname+"]가 포함되었습니다.");
		alert("KANG: 특수문자 ["+fname+"]가 포함되었습니다.");
		return true;
	}
	return false;
}
function checkfile(sender) {
	fileInput = sender;
	var fileExt = sender.value;
	if (!(/png|jpg|gif/i).test(fileExt)) {
		alert("이미지(png, jpg, gif) 파일 형식만 선택 가능합니다. ");
		return false;
	}
	var maxSize = 300*1024;		  //300K  개별파일 최대 용량
	var vFileSize = document.all.tempImage.fileSize;
	if(vFileSize > maxSize) {
		alert("파일업로드 허용용량 300K를 초과하였습니다.");
		vFileSize = 0;
		return false;
	}
	var chkStr = fileExt + document.uploadForm.suffixName.value;
	if (checkSpecial(chkStr)) {
		//alert("특수문자가 포함되었습니다.");
		return false;
	}
	return true;
}
function confirmUpload() {
	if(fileInput == undefined || fileInput.value == "") {
		alert('파일을 선택해 주세요.');
		return false;
	}
	if(!checkfile(fileInput)) {
		alert('파일을 다시 선택해 주세요.');
		return false;
	}
	document.uploadForm.serverFileName.value = '<c:out value="${storeCd}"/>_<%=session.getAttribute("userid")%>_<%=today%>_';
	document.uploadForm.submit();
}
function cancelUpload() {
	window.close();
}
</script>
<!-- KANG-20210316: CHANGE-START -->
<form id="uploadForm" name="uploadForm" method="post" target="_self" enctype="multipart/form-data" action="/SASCampaign/_galleria/mms/insertDone.do">
<input type="hidden" id="serverFileName" name="serverFileName">
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
	<tr height="40">
		<td width="1">&nbsp;</td>
		<td width="19">&nbsp;</td>
		<td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">MMS 이미지 업로드</font></b></td>
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
				<tr>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">파일명 :&nbsp;</font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">
						<input type="file" id="fileData" name="fileData"
							   accept="image/x-png,image/gif,image/jpeg"
							   placeholder="파일 찾기" style="width: 380px"
							   onchange="checkfile(this);">
					</font></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">저장할 파일명 :&nbsp;</font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">
						<font face="Malgun Gothic" size="2" color="#FFFFFF">
							<input type="text" id="suffixName" name="suffixName" width="360" style="width:360px;background-color:#4A4A4D;color:#FFFFFF">
						</font>
					</td>
				</tr>
				<tr height="10">
					<td colspan='2'>&nbsp;</td>
				</tr>
				<tr height="10">
					<td colspan='2' align='right'>
						<button onclick="return confirmUpload();" style="background-color:#453A39;border:none;padding:5px">
							<font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>확 인</b>&nbsp;
							</font>
						</button>&nbsp;
						<button onclick="return cancelUpload();" style="background-color:#453A39;border:none;padding:5px">
							<font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;<b>취 소</b>&nbsp;
							</font>
						</button>
					</td>
				</tr>
			</table>
		<td>&nbsp;</td>
	</tr>

	<tr height="40">
		<td>&nbsp;</td>
		<td colspan="2" bgcolor="#27292D">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<div id="image_preview" style="display:none">
<img src="" id="tempImage" name="tempImage">
</div>
</form>
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

