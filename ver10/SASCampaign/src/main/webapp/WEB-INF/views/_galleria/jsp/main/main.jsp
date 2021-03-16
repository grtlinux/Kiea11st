<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body bgcolor="#27292D">
<script src="/SASCampaign/_galleria/js/jquery-1.9.1.min.js"></script>
<script type="text/javasxript">
</script>

<center>
<table width="100%" height="70" border="0" bgcolor="#1A1A1A">
<tr><td align="center">
	<a href="/SASCampaign/">
	<img src="/SASCampaign/_galleria/images/logo.jpg" width="115" height="70"/>
	</a>
</td></tr>
</table>


<table width="100%" height="70" border="0">
<tr><td class="textTitle" align="center"> 캠페인 관리 시스템</td></tr>
</table>
<br/><br/>


<table width="1004" height="410" border="0" class="sortable">
  <tr height="200">
	<script type="text/javascript">
	function openPopupForCIStudio() {
		window.open('http://gstart.galleria.co.kr/SASCIStudio/'
				  , "_blank"
				  , "width=1400,height=900,directories=yes,resizable=yes,status=yes,toolbar=yes,menubar=yes");
	}
	</script>
	<td width="200" align="center" valign="middle" class="tdDesign" onclick="return openPopupForCIStudio();"><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			캠페인 디자인
		</b></font>
	</td>

	<td width="1"></td>
	<script type="text/javascript">
	function openPopupForApproval() {
		window.open('/SASCampaign/_galleria/approve/main.do'
				  , "_blank"
				  , "width=1024,height=768,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
	}
	</script>
	<td width="200" align="center" valign="middle" class="tdApprove" onclick="return openPopupForApproval();"><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			캠페인 승인 <br/>(신청/조회)
		</b></font>
	</td>

	<td width="1"></td>
	<script type="text/javascript">
	function openPopupForMonitoring() {
		window.open('<%=contextPath%>/monitoring/main.sas'
				  , "_blank"
				  , "width=1024,height=768,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
	}
	</script>
	<td width="200" align="center" valign="middle" class="tdMonitor" onclick="return openPopupForMonitoring();"><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			캠페인 모니터링
		</b></font>
	</td>

	<td width="1"></td>
	<script type="text/javascript">
	function openPopupForUpload() {
		window.open('/SASCampaign/_galleria/file/main.do',
										"_blank",
										"width=1024,height=768,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
	}
	</script>
	<td width="200" align="center" valign="middle" class="tdExcel" onclick="return openPopupForUpload();"><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			파일 <br/> 업로드
		</b></font>
	</td>

	<td width="1"></td>
	<script type="text/javascript">
	function openPopupForUploadMMS() {
		window.open('/SASCampaign/_galleria/mms/main.do',
										"_blank",
										"width=1024,height=768,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
	}
	</script>
	<td width="200" align="center" valign="middle" class="tdExcel" onclick="return openPopupForUploadMMS();"><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			MMS 이미지 <br/> 업로드
		</b></font>
	</td>
  </tr>
  <tr height="10"><td></td></tr>

  <tr height="200">
<c:if test="${result.auth=='Y'}">
	<script type="text/javascript">
	function openPopupForExcept() {
		window.open('<%=contextPath%>/exceptCustomer/main.sas',
										"_blank",
										"width=1024,height=768,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
	}
	</script>
</c:if>
	<td width="200" align="center" valign="middle" class="tdExcept"
<c:if test="${result.auth=='Y'}">
		onclick="return openPopupForExcept();"
</c:if>
		><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			대상자 제외
		</b></font>
	</td>

	<td width="1"></td>
<c:if test="${result.auth=='Y'}">
	<script type="text/javascript">
	function openPopupForCenterAppend() {
		window.open('<%=contextPath%>/appendCustomer/main.sas',
										"_blank",
										"width=1024,height=768,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
	}
	</script>
</c:if>
	<td width="200" align="center" valign="middle" class="tdAppend"
<c:if test="${result.auth=='Y'}">
		onclick="return openPopupForCenterAppend();"
</c:if>
		><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			캠페인실행확인 <br/> 직원등록
		</b></font>
	</td>

	<td width="1"></td>
<c:if test="${result.auth=='Y'}">
	<script type="text/javascript">
	function openPopupForCenterPolicy() {
		window.open('<%=contextPath%>/policy/main.sas',
										"_blank",
										"width=1024,height=768,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
	}
	</script>
</c:if>
	<td width="200" align="center" valign="middle" class="tdPolicy"
<c:if test="${result.auth=='Y'}">
		onclick="return openPopupForCenterPolicy();"
</c:if>
		><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			캠페인 <br/> 정책관리
		</b></font>
	</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>

<c:if test="${result.event_auth=='Y'}">
  <tr height="10"><td></td></tr>

  <tr height="200">
	<script type="text/javascript">
	function openPopupForOnline() {
		window.open('http://gstart.galleria.co.kr/online/list.sas?param=<%=userid%>',
										"_blank",
										"width=1024,height=768,location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no,scrollbars=1");
	}
	</script>
	<td width="200" align="center" valign="middle" class="tdPolicy"
		onclick="return openPopupForOnline();"
		><br/><br/><br/><br/>
		<font face="Malgun Gothic" size="3" color="#CCCCCC"><b>
			이벤트 관리
		</b></font>
	</td>
	<td width="1"></td>
	<td>&nbsp;</td>

	<td width="1"></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
	
</c:if>
</table>
</center>
</body>



</html>

