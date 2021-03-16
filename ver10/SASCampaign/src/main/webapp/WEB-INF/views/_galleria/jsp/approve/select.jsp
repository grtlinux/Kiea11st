<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
function search() {
	if($("#campaign_name").val()=='') {
		alert('캠페인 이름을 입력해 주세요.');
	} else {
		document.frmSearch.searchCampaign.value=$('#campaign_name').val();
		document.frmSearch.submit();
	}
}
</script>
<form name="frmSearch" action="/SASCampaign/_galleria/approve/select.do" target="_self">
<input type="hidden" name="searchCampaign" id="searchCampaign" value="${searchCampaign}" />
<table width="100%" height="100%" border="0" bgcolor="#4A4A4D" cellspacing="0" cellpadding="0">
	<tr height="40">
		<td width="1">&nbsp;</td>
		<td width="19">&nbsp;</td>
		<td valign="middle" width="100%"><b><font face="Malgun Gothic" color="#FFFFFF">캠페인 승인 미신청 문서 조회</font></b></td>
		<td width="1">&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan="2">
<%/*
			<table width="100%" border="0" bgcolor="#27292D">
				<tr height="20">
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td width="20">&nbsp;</td>
					<td width="80" align="right"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인 이름:</font></td>
					<td width="150"><input type="text" id="campaign_name" width="140" style="width:140px;background-color:#4A4A4D;color:#FFFFFF"></td>

					<td>&nbsp;</td>
					<td width="100" align="right"><button onclick="this.form.target='_self';return search();" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">&nbsp;&nbsp;&nbsp;<b>검색</b>&nbsp;&nbsp;&nbsp;</font></button></td>
					<td width="20">&nbsp;</td>
				</tr>
			</table>
*/%>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr height="30">
		<td>&nbsp;</td>
		<td colspan="2" align="right" bgcolor="#27292D">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan="2" align="center" bgcolor="#27292D">
			<table cellspacing="3" cellpadding="10" width="950">
				<thead>
					<tr>
						<th width="150" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인(그룹)<br/>코드 </font></th>
						<th width="200" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">실행부서</font></th>
						<th width="400" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">캠페인(그룹)명</font></th>
						<th width="110" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">행사<br/>시작일</font></th>
						<th width="110" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">행사<br/>종료일</font></th>
						<th width="140" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">상태</font></th>
						<th width="90"  style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">신청자</font></th>
						<th width="120" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">구성<br/>완료일</font></th>
						<th width="100" style="text-align: center; vertical-align: middle" bgcolor="#4A4A4D">&nbsp;</th>
					</tr>
				</thead>
<c:if test="${count != 0}">
	<c:forEach var="row" items="${result}" varStatus="status">
				<tr>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.cmpgn_id}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.exec_dept_cd}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.cmpgn_nm}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><fmt:formatDate pattern="yyyy-MM-dd" value="${row.schedule_strt_dt}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><fmt:formatDate pattern="yyyy-MM-dd" value="${row.schedule_end_dt}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.campaign_status_cd}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><c:out value="${row.req_emp_id}"/></font></td>
					<td align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF"><fmt:formatDate pattern="yyyy-MM-dd" value="${row.req_dt}" /></font></td>
					<td align="center" bgcolor="#4A4A4D">
						<table border="0"><tr><td>
						<button onclick="return openAPSign('<c:out value="${row.cmpgn_id}"/>');" style="background-color:#453A39;border:none;padding:3px;width:90px"><font face="Malgun Gothic" size="2" color="#FFFFFF">상신</font></button>
						</td></tr><tr><td>
						<button onclick="return openPopupApprove('<c:out value="${row.cmpgn_id}"/>');" style="background-color:#453A39;border:none;padding:3px;width:90px"><font face="Malgun Gothic" size="2" color="#FFFFFF">문구보기</font></button>
						</td></tr></table>
<!--
						&nbsp;<button onclick="return openPopupApprove('<c:out value="${row.cmpgn_id}"/>');" style="background-color:#453A39;border:none;padding:5px"><font face="Malgun Gothic" size="2" color="#FFFFFF">M</font></button>
-->
					</td>
				</tr>
	</c:forEach>
</c:if>
<c:if test="${count == 0}">
				<tr>
					<td colspan="9" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">승인 관련 캠페인이 없습니다.</font></td>
				</tr>
</c:if>
<c:if test="${empty count}">
				<tr>
					<td colspan="9" align="center" bgcolor="#4A4A4D"><font face="Malgun Gothic" size="2" color="#FFFFFF">승인 관련 캠페인이 없습니다.</font></td>
				</tr>
</c:if>
		</table>
		<td>&nbsp;</td>
	</tr>

	<tr height="40">
		<td>&nbsp;</td>
		<td colspan="2" bgcolor="#27292D" align="right">
		</td>
		<td>&nbsp;</td>
	</tr>

	<tr height="40">
		<td>&nbsp;</td>
		<td colspan="2" bgcolor="#27292D">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
<script type="text/javascript">
function openPopupEPAgent(cmpgn_id) {
	if(cmpgn_id == '1013174' || cmpgn_id == '1013272' || cmpgn_id == '1013271'|| cmpgn_id == '1013270' || cmpgn_id == '1013109'){
		openChkMsg(cmpgn_id);
	}else{
		openAPSign(cmpgn_id);
	}
}

function openAPSign(cmpgn_id) {
	alert("KANG: 상신(캠페인) 팝업입니다.");
	return false;
	
	var param = '?cmpgn_id=' + cmpgn_id + '&empid=<%=session.getAttribute("userid")%>';
	var url = 'http://gstart.galleria.co.kr/apagent/campaign.jsp' + param;
	var popOptions = "dialogWidth: 800px; dialogHeight: 700px; center: yes; resizable: no; status: no; scroll: yes;"; 
	//var vReturn = window.showModalDialog(url, window,  popOptions ); 
	//if (vReturn == 'ok'){
	var vReturn = window.open(url, window,  popOptions );	// new 20201228
	if (vReturn != null){   // new 20201228
		updateDocument(cmpgn_id); 
	} else {
	}
	window.close();
}

function openChkMsg(cmpgn_id){
	alert("KANG: 상신(특정 캠페인) 팝업입니다.");
	return false;
	
	var param = '?campaign_id=' + cmpgn_id;
	var url = '/SASCampaign/_galleria/approve/chkMsg.do' + param;
	var popOptions = "dialogWidth: 650px; dialogHeight: 500px; center: yes; resizable: no; status: no; scroll: yes;"; 
	//var vReturn = window.showModalDialog(url, window,  popOptions );
	var vReturn = window.open(url, window,  popOptions );   // new 20201228
	window.close();
}

function openPopupApprove(cmpgn_id) {
	alert("KANG: 문구보기 팝업입니다.");
	return false;
	
	var param = '?campaign_id=' + cmpgn_id;
	var url = '/SASCampaign/_galleria/approve/preview.do' + param;
	var popOptions = "dialogWidth: 650px; dialogHeight: 500px; center: yes; resizable: no; status: no; scroll: yes;"; 
	//var vReturn = window.showModalDialog(url, window,  popOptions );
	var vReturn = window.open(url, window,  popOptions );   // new 20201228
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

