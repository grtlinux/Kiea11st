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
<script type="text/javascript">
var fileInput;
function checkfile(sender) {
    fileInput = sender;
    var fileExt = sender.value;
    if (!(/xlsx|xls/i).test(fileExt)) {
        alert("Excel(xlsx, xls) 파일 형식만 선택 가능합니다. ");
        return false;
    } else {
        return true;
    }
}
function confirmUpload() {
    if(fileInput == undefined || fileInput.value == "") {
        alert('파일을 선택해 주세요.');
        return;
    }
    if(!checkfile(fileInput)) {
        alert('파일을 다시 선택해 주세요.');
        return;
    }
    document.uploadForm.serverFileName.value='<c:out value="${storeCd}"/>_<%=session.getAttribute("userid")%>_<%=today%>_';
    document.uploadForm.submit();
}
function cancelUpload() {
    window.close();
}
</script>
<form id="uploadForm" name="uploadForm" method="post" target="_self" enctype="multipart/form-data" action="<%=request.getContextPath()%>/file/insertDone.sas">
<input type="hidden" id="serverFileName" name="serverFileName">
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
                <tr>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">파일찾기 :&nbsp;</font></td>
                    <td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">
						<input type="file" id="fileData" name="fileData"
                               accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel"
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

